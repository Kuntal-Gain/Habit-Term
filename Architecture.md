# Habit-Term Architecture

## 1. Architecture Overview

Habit-Term is an **offline-first CLI habit tracker** built with:

-   Flutter & Dart --- client application
-   Hive --- local/offline persistence
-   Riverpod --- state management

The project follows a **feature-first architecture** with a small set of
centralized core utilities and reusable shared UI components.

The primary goals are:

-   Clear separation of responsibilities
-   Feature isolation
-   Reusable components
-   Testable business logic
-   Offline-first behavior
-   Easy future expansion
-   Minimal coupling between features
-   Predictable dependency flow

The architecture is organized into three primary layers:

``` text
lib/
├── core/
├── shared/
└── features/
```

------------------------------------------------------------------------

# 2. Project Structure

The high-level structure should be:

``` text
lib/
│
├── core/
│   ├── constants/
│   ├── extensions/
│   ├── helpers/
│   ├── memory/
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_typography.dart
│   │   ├── app_font_sizes.dart
│   │   ├── app_spacing.dart
│   │   ├── app_text_constants.dart
│   │   ├── app_theme.dart
│   │   └── ...
│   └── ...
│
├── shared/
│   ├── widgets/
│   ├── components/
│   └── ...
│
├── features/
│   ├── today/
│   │   ├── model/
│   │   ├── data/
│   │   └── view/
│   │
│   ├── habit/
│   │   ├── model/
│   │   ├── data/
│   │   └── view/
│   │
│   ├── add_habit/
│   │   ├── model/
│   │   ├── data/
│   │   └── view/
│   │
│   ├── stats/
│   │   ├── model/
│   │   ├── data/
│   │   └── view/
│   │
│   ├── achievements/
│   │   ├── model/
│   │   ├── data/
│   │   └── view/
│   │
│   ├── settings/
│   │   ├── model/
│   │   ├── data/
│   │   └── view/
│   │
│   └── inspiration/
│       ├── model/
│       ├── data/
│       └── view/
│
└── main.dart
```

The actual feature list may evolve, but the architectural rules should
remain consistent.

------------------------------------------------------------------------

# 3. Core

`core/` contains functionality that is **application-wide and not
specific to one feature**.

Core should not contain feature-specific business logic.

Examples:

``` text
core/
├── constants/
├── extensions/
├── helpers/
├── memory/
├── theme/
├── typography/
├── spacing/
└── ...
```

------------------------------------------------------------------------

## 3.1 Core Responsibilities

Core contains:

-   Global design tokens
-   Theme configuration
-   Typography
-   Font sizes
-   Spacing
-   Text constants
-   App constants
-   Extensions
-   Generic helpers
-   Hive/local-storage infrastructure
-   Shared application-level utilities
-   Global configuration

Core should be reusable by any feature.

------------------------------------------------------------------------

# 4. Core Design Tokens

All visual constants must be centralized.

Do not hardcode values inside feature widgets.

Examples:

``` text
core/
└── theme/
    ├── app_theme.dart
    ├── app_colors.dart
    ├── app_typography.dart
    ├── app_font_sizes.dart
    ├── app_spacing.dart
    ├── app_text_constants.dart
    └── ...
```

All text constants, typography, colors, and spacing tokens are
centralized inside `core/theme/`. There are no separate top-level
`typography/` or `spacing/` folders.

Potential usage:

``` dart
AppColors.primary
AppColors.background

AppFontSizes.body
AppFontSizes.heading

AppSpacing.sm
AppSpacing.md
AppSpacing.lg
```

The exact names may evolve, but visual values must remain centralized.

Refer to `Design.md` for the visual design system.

------------------------------------------------------------------------

# 5. Core Theme

The application theme belongs in:

``` text
core/theme/
```

Example:

``` text
core/theme/
├── app_colors.dart
├── app_theme.dart
└── ...
```

The theme is responsible for:

-   Colors
-   Material configuration where required
-   Component defaults
-   Global visual behavior
-   Terminal-style application appearance

Features must consume the theme.

Features should not create their own global colors or typography
systems.

------------------------------------------------------------------------

# 6. Core Typography

Typography belongs in:

``` text
core/theme/
```

The primary font is:

``` text
JetBrains Mono
```

Typography should define reusable text styles.

Example:

``` dart
AppTypography.display
AppTypography.heading
AppTypography.body
AppTypography.command
AppTypography.metadata
AppTypography.caption
AppTypography.stats
```

Do not repeatedly create custom `TextStyle` instances inside widgets
when an existing application style is appropriate.

If a genuinely new global text style is required, add it to the
centralized typography system.

------------------------------------------------------------------------

# 7. Core Spacing

Spacing belongs in:

``` text
core/theme/
```

Use a consistent spacing scale.

Example:

``` dart
AppSpacing.xs
AppSpacing.sm
AppSpacing.md
AppSpacing.lg
AppSpacing.xl
AppSpacing.xxl
```

The spacing system should be based on the design system defined in
`Design.md`.

Avoid:

``` dart
padding: EdgeInsets.all(13)
```

when a design token can represent the same intent.

Prefer:

``` dart
padding: EdgeInsets.all(AppSpacing.md)
```

------------------------------------------------------------------------

# 8. Core Extensions

Extensions belong in:

``` text
core/extensions/
```

Extensions should contain **generic application-wide convenience
behavior**.

Examples:

``` text
DateTime extensions
String extensions
BuildContext extensions
Iterable extensions
num extensions
```

Examples:

``` dart
date.isToday
date.isYesterday
value.capitalize()
value.isNullOrEmpty
context.screenWidth
```

Do not place feature-specific behavior inside core extensions.

Bad:

``` dart
extension HabitExtensions on HabitModel {
  ...
}
```

If the behavior only makes sense for the Habit feature, it belongs
inside that feature.

------------------------------------------------------------------------

# 9. Core Helpers

Generic helpers belong in:

``` text
core/helpers/
```

Helpers should solve reusable technical problems.

Examples:

``` text
DateHelper
ValidationHelper
IdHelper
FormattingHelper
DebounceHelper
```

A helper must remain generic.

If a helper becomes tightly coupled to a feature, move it into that
feature.

------------------------------------------------------------------------

# 10. Core Memory

Because Habit-Term is offline-first, local persistence is a core
application concern.

Use:

``` text
core/memory/
```

for Hive infrastructure.

Suggested structure:

``` text
core/
└── memory/
    ├── hive_service.dart
    ├── hive_boxes.dart
    ├── hive_adapters.dart
    └── ...
```

The exact names may differ.

------------------------------------------------------------------------

## 10.1 Memory Responsibilities

The memory layer is responsible for:

-   Hive initialization
-   Hive adapter registration
-   Box management
-   Opening/closing boxes
-   Generic local persistence infrastructure
-   Storage configuration

Feature-specific repositories/use cases should not initialize Hive
themselves.

Bad:

``` dart
class HabitUseCase {
  Future<void> initHive() async {
    ...
  }
}
```

Good:

``` text
core/memory
      ↓
Hive infrastructure

feature/habit/data
      ↓
Uses memory infrastructure
```

------------------------------------------------------------------------

# 11. Hive Rules

Hive is the primary local storage mechanism.

All persistent models must have clearly defined Hive adapters.

Avoid dynamic Hive adapters.

Prefer:

``` dart
Hive.registerAdapter<HabitModel>(HabitModelAdapter());
```

instead of:

``` dart
Hive.registerAdapter(HabitModelAdapter());
```

when the API allows explicit typing.

Each persisted model must have a stable `typeId`.

Example:

``` text
AddressType      → 0
AddressModel     → 1
HabitType        → 2
HabitModel       → 3
```

Do not casually change existing type IDs after data has been released.

Changing a type ID can make existing local data unreadable.

------------------------------------------------------------------------

# 12. Shared

`shared/` contains **reusable UI components that are not tied to a
specific feature**.

Structure:

``` text
shared/
├── widgets/
├── components/
└── ...
```

Examples:

``` text
TerminalButton
TerminalPanel
TerminalPrompt
TerminalInput
TerminalCheckbox
TerminalProgressBar
TerminalDivider
TerminalShortcutBar
TerminalEmptyState
TerminalErrorState
TerminalLoading
```

These components should be reusable by multiple features.

------------------------------------------------------------------------

# 13. Shared Component Rule

A component belongs in `shared/` only when it is genuinely reusable.

Do not move feature-specific widgets into shared simply because they are
large.

For example:

``` text
shared/widgets/terminal_button.dart
```

Good.

But:

``` text
shared/widgets/habit_streak_card.dart
```

should normally remain inside:

``` text
features/habit/view/widgets/
```

because it represents habit-specific UI.

------------------------------------------------------------------------

# 14. Features

All product functionality belongs inside:

``` text
features/
```

Each feature must be isolated.

Each feature contains exactly three primary areas:

``` text
feature/
├── model/
├── data/
└── view/
```

The responsibility of each layer must remain clear.

------------------------------------------------------------------------

# 15. Feature Model

`model/` contains the data structures owned by that feature.

Example:

``` text
features/habit/model/
├── habit_model.dart
├── habit_frequency.dart
├── habit_target.dart
└── ...
```

Models should represent application data.

Examples:

``` text
HabitModel
HabitFrequency
HabitTarget
HabitCompletion
```

Model responsibilities:

-   Data representation
-   Serialization
-   Hive annotations/adapters where applicable
-   Equality where required
-   Immutable state representation

Models should not contain UI code.

Avoid:

``` dart
class HabitModel {
  Widget build() {
    ...
  }
}
```

------------------------------------------------------------------------

# 16. Feature Data

`data/` contains the feature's application/data logic.

The feature data layer contains:

``` text
data/
├── usecase/
└── implementation/
```

or an equivalent organization such as:

``` text
data/
├── usecases/
└── implementations/
```

The important rule is that **use case contracts and their
implementations are separated**.

Example:

``` text
features/habit/data/
├── usecase/
│   ├── get_habits_usecase.dart
│   ├── create_habit_usecase.dart
│   ├── update_habit_usecase.dart
│   └── delete_habit_usecase.dart
│
└── implementation/
    ├── get_habits_usecase_impl.dart
    ├── create_habit_usecase_impl.dart
    ├── update_habit_usecase_impl.dart
    └── delete_habit_usecase_impl.dart
```

------------------------------------------------------------------------

# 17. Use Cases

Use cases represent application actions.

Examples:

``` text
Create Habit
Get Habit
Get Today's Habits
Complete Habit
Undo Completion
Update Habit
Delete Habit
Get Streak
Get Statistics
```

A use case should represent **one meaningful action**.

Avoid giant classes such as:

``` dart
HabitManager
```

that contain every possible operation.

Prefer:

``` text
CreateHabitUseCase
CompleteHabitUseCase
DeleteHabitUseCase
GetTodayHabitsUseCase
```

------------------------------------------------------------------------

# 18. Use Case Contracts

The provider/view layer should depend on the use case abstraction rather
than directly knowing implementation details.

Example:

``` dart
abstract class CreateHabitUseCase {
  Future<HabitModel> call(CreateHabitRequest request);
}
```

Implementation:

``` dart
class CreateHabitUseCaseImpl implements CreateHabitUseCase {
  ...
}
```

Riverpod can provide the implementation:

``` text
Provider
   ↓
CreateHabitUseCase
   ↓
CreateHabitUseCaseImpl
```

This keeps business logic replaceable and testable.

------------------------------------------------------------------------

# 19. Feature View

`view/` contains presentation/UI logic.

Structure:

``` text
view/
├── provider/
├── screen/
└── widgets/
```

Responsibilities:

### provider/

Riverpod state and presentation state.

### screen/

Full pages/screens.

### widgets/

Widgets specific to the feature.

------------------------------------------------------------------------

# 20. Feature Providers

Providers belong inside:

``` text
feature/view/provider/
```

Providers are responsible for:

-   Managing presentation state
-   Calling use cases
-   Exposing state to widgets
-   Handling loading/error/success states
-   Triggering UI updates

Providers should not contain raw Hive logic.

Bad:

``` dart
class HabitNotifier extends Notifier {
  void saveHabit() {
    Hive.box('habits').put(...);
  }
}
```

Good:

``` text
HabitProvider
      ↓
CreateHabitUseCase
      ↓
Local storage/data implementation
      ↓
Hive
```

The provider orchestrates presentation state.

------------------------------------------------------------------------

# 21. Riverpod Architecture

Riverpod is the state-management layer.

Recommended dependency flow:

``` text
Screen
  ↓
Provider / Notifier
  ↓
Use Case
  ↓
Implementation
  ↓
Hive / Memory
```

The reverse dependency should not occur.

Hive should never know about Riverpod.

Models should not depend on providers.

Widgets should not directly manipulate Hive.

------------------------------------------------------------------------

# 22. Provider Responsibilities

A provider should answer:

-   What state does the screen need?
-   What is currently loading?
-   Did an operation succeed?
-   Did an operation fail?
-   What data should the UI display?
-   Which use case should execute?

Example:

``` text
HabitListNotifier

State:
- loading
- habits
- error

Actions:
- loadHabits()
- completeHabit()
- deleteHabit()
```

The notifier should delegate actual business operations to use cases.

------------------------------------------------------------------------

# 23. Screen Responsibilities

Screens should primarily compose UI.

Example:

``` dart
class TodayScreen extends ConsumerWidget {
  ...
}
```

A screen should:

-   Read provider state
-   Build layout
-   Display widgets
-   Trigger provider actions
-   Handle navigation

A screen should not:

-   Open Hive boxes
-   Perform database queries
-   Calculate complex business rules
-   Contain large reusable UI sections

------------------------------------------------------------------------

# 24. Feature Widgets

Feature-specific widgets belong here:

``` text
features/habit/view/widgets/
```

Examples:

``` text
HabitTile
HabitStreakCard
HabitCalendar
HabitTargetIndicator
```

If the widget can be reused by unrelated features, consider moving it
to:

``` text
shared/widgets/
```

------------------------------------------------------------------------

# 25. Dependency Direction

The architecture follows this dependency direction:

``` text
                 ┌─────────────┐
                 │    Core     │
                 └──────┬──────┘
                        │
                        ↓
                 ┌─────────────┐
                 │   Shared    │
                 └──────┬──────┘
                        │
                        ↓
                 ┌─────────────┐
                 │  Features   │
                 └─────────────┘
```

Within a feature:

``` text
View
 ↓
Use Case
 ↓
Implementation
 ↓
Memory / Hive
```

The exact implementation may evolve, but the separation of
responsibilities must remain.

------------------------------------------------------------------------

# 26. What Core Can Depend On

`core/` should remain highly independent.

Core can depend on infrastructure packages required to implement its
responsibility.

For example:

``` text
core/memory → Hive
core/theme  → Flutter
```

Core should not depend on:

``` text
features/habit
features/stats
features/today
```

Core must never import feature code.

------------------------------------------------------------------------

# 27. What Shared Can Depend On

Shared components can depend on:

``` text
Flutter
Core
```

They should generally not depend on feature-specific code.

Example:

``` text
shared/widgets/terminal_button.dart
       ↓
core/theme
core/typography
```

Avoid:

``` text
shared/widgets/terminal_button.dart
       ↓
features/habit/model
```

------------------------------------------------------------------------

# 28. Feature Isolation

A feature should own its own models, use cases, providers, screens, and
feature-specific widgets.

Example:

``` text
features/habit/
├── model/
├── data/
└── view/
```

Another feature should not directly access the internals of the Habit
feature.

If another feature needs Habit functionality, expose it through an
appropriate abstraction/use case/provider rather than reaching into
internal implementation details.

------------------------------------------------------------------------

# 29. Feature-to-Feature Communication

Avoid direct coupling such as:

``` text
TodayScreen
  ↓
HabitProvider internals
```

Prefer:

``` text
Today feature
  ↓
shared/core abstraction
```

or, where appropriate:

``` text
Today feature
  ↓
Habit use case
```

The goal is to keep features independently understandable.

------------------------------------------------------------------------

# 30. Example Habit Feature

Recommended structure:

``` text
features/
└── habit/
    │
    ├── model/
    │   ├── habit_model.dart
    │   ├── habit_frequency.dart
    │   └── habit_target.dart
    │
    ├── data/
    │   ├── usecase/
    │   │   ├── create_habit_usecase.dart
    │   │   ├── get_habits_usecase.dart
    │   │   ├── update_habit_usecase.dart
    │   │   └── delete_habit_usecase.dart
    │   │
    │   └── implementation/
    │       ├── create_habit_usecase_impl.dart
    │       ├── get_habits_usecase_impl.dart
    │       ├── update_habit_usecase_impl.dart
    │       └── delete_habit_usecase_impl.dart
    │
    └── view/
        ├── provider/
        │   ├── habit_provider.dart
        │   └── habit_state.dart
        │
        ├── screen/
        │   └── habit_screen.dart
        │
        └── widgets/
            ├── habit_tile.dart
            ├── habit_streak_card.dart
            └── habit_progress.dart
```

------------------------------------------------------------------------

# 31. Example Today Feature

``` text
features/
└── today/
    │
    ├── model/
    │   ├── today_model.dart
    │   └── today_summary.dart
    │
    ├── data/
    │   ├── usecase/
    │   │   ├── get_today_habits_usecase.dart
    │   │   └── get_today_progress_usecase.dart
    │   │
    │   └── implementation/
    │       ├── get_today_habits_usecase_impl.dart
    │       └── get_today_progress_usecase_impl.dart
    │
    └── view/
        ├── provider/
        │   └── today_provider.dart
        │
        ├── screen/
        │   └── today_screen.dart
        │
        └── widgets/
            ├── today_progress.dart
            ├── today_habit_list.dart
            └── today_quote.dart
```

------------------------------------------------------------------------

# 32. Example Stats Feature

``` text
features/
└── stats/
    │
    ├── model/
    │   ├── stats_model.dart
    │   ├── daily_stats.dart
    │   └── weekly_stats.dart
    │
    ├── data/
    │   ├── usecase/
    │   │   ├── get_daily_stats_usecase.dart
    │   │   ├── get_weekly_stats_usecase.dart
    │   │   └── get_completion_rate_usecase.dart
    │   │
    │   └── implementation/
    │       ├── get_daily_stats_usecase_impl.dart
    │       ├── get_weekly_stats_usecase_impl.dart
    │       └── get_completion_rate_usecase_impl.dart
    │
    └── view/
        ├── provider/
        │   └── stats_provider.dart
        │
        ├── screen/
        │   └── stats_screen.dart
        │
        └── widgets/
            ├── stats_chart.dart
            ├── stats_summary.dart
            └── stats_filter.dart
```

------------------------------------------------------------------------

# 33. Dependency Injection

Riverpod should be used as the dependency injection mechanism.

Example conceptual dependency graph:

``` text
HiveServiceProvider
       ↓
CreateHabitUseCaseImpl
       ↓
CreateHabitUseCaseProvider
       ↓
HabitNotifier
       ↓
HabitScreen
```

Providers should expose abstractions where useful.

Example:

``` dart
final createHabitUseCaseProvider =
    Provider<CreateHabitUseCase>((ref) {
  return CreateHabitUseCaseImpl(
    memory: ref.watch(memoryProvider),
  );
});
```

Then:

``` dart
final habitProvider =
    NotifierProvider<HabitNotifier, HabitState>(
  HabitNotifier.new,
);
```

The exact Riverpod provider type should be selected based on the
state-management requirement.

------------------------------------------------------------------------

# 34. State Management Rules

Use Riverpod for application state.

Do not use:

``` text
setState
```

for state that needs to be shared across screens or features.

`setState` may still be appropriate for truly local ephemeral UI state.

Examples of local UI state:

``` text
isPasswordVisible
temporary focus state
animation state
local expansion state
```

Examples that belong in Riverpod:

``` text
Habit list
Today's progress
Statistics
Achievements
Settings state
Persistent user preferences
```

------------------------------------------------------------------------

# 35. Offline-First Data Flow

The primary data flow is:

``` text
User
 ↓
Screen
 ↓
Riverpod Provider
 ↓
Use Case
 ↓
Implementation
 ↓
Hive
 ↓
Local Data
```

For reads:

``` text
Hive
 ↓
Use Case
 ↓
Provider
 ↓
Screen
```

The application should assume that local storage is the source of truth
for the current version.

------------------------------------------------------------------------

# 36. Future Synchronization

Cloud synchronization may be added later.

The current architecture should not make cloud synchronization
mandatory.

Future direction:

``` text
                ┌──────────────┐
                │   Use Case   │
                └───────┬──────┘
                        ↓
              ┌─────────────────┐
              │ Data Abstraction │
              └───────┬─────────┘
                      │
              ┌───────┴────────┐
              ↓                ↓
            Hive             Cloud
           Local             Remote
```

Do not build cloud-specific complexity into the current offline
implementation unless it is actually required.

The architecture should leave room for it.

------------------------------------------------------------------------

# 37. Model Rules

Models should be predictable and immutable where practical.

Prefer:

``` dart
class HabitModel {
  final String id;
  final String name;
  final HabitFrequency frequency;

  const HabitModel({
    required this.id,
    required this.name,
    required this.frequency,
  });
}
```

Avoid mutable public fields unless there is a clear reason.

Use methods such as `copyWith` when appropriate.

------------------------------------------------------------------------

# 38. Serialization

Models that are persisted should have a clear serialization strategy.

For Hive:

``` text
Model
 ↓
Hive TypeAdapter
 ↓
Hive Box
```

If JSON serialization is needed later:

``` text
Model
 ↓
toJson/fromJson
```

Serialization logic should remain associated with the model/data
boundary and should not leak into widgets.

------------------------------------------------------------------------

# 39. Error Handling

Errors should be handled deliberately.

Do not silently swallow exceptions.

Data/use-case layer:

``` text
Storage Exception
       ↓
Meaningful application error
       ↓
Provider state
       ↓
UI
```

The UI should receive an understandable state rather than raw storage
exceptions whenever possible.

Example:

``` text
Unable to load habits.

Local storage could not be accessed.
```

------------------------------------------------------------------------

# 40. Loading State

Providers should explicitly represent loading where asynchronous
operations are involved.

Example conceptual state:

``` text
Initial
Loading
Loaded
Error
```

For more complex screens, use a state model that clearly represents:

``` text
data
loading
error
```

Avoid scattered booleans such as:

``` dart
isLoading
isSaving
hasError
isDeleting
```

when a structured state model would be clearer.

------------------------------------------------------------------------

# 41. Navigation

Navigation should remain separate from business logic.

Screens should not directly perform complex navigation decisions based
on database operations.

Keep routing/navigation configuration centralized.

Potential structure:

``` text
core/
└── routing/
    └── app_router.dart
```

if routing becomes substantial.

Feature screens can define their route information, but
application-level route configuration should remain centralized.

------------------------------------------------------------------------

# 42. Testing Strategy

The architecture should make each layer independently testable.

## Model Tests

Test:

-   Serialization
-   Equality
-   Copying
-   Hive conversion

## Use Case Tests

Test:

-   Business rules
-   Successful operations
-   Error cases

Use mocked/fake dependencies.

## Provider Tests

Test:

-   Initial state
-   Loading
-   Success
-   Error
-   User actions

## Widget Tests

Test:

-   Rendering
-   User interaction
-   State-driven UI
-   Accessibility where appropriate

------------------------------------------------------------------------

# 43. Testing Dependency Rule

Use cases should not require Flutter UI.

Example:

``` text
CreateHabitUseCase
```

should be testable without:

``` text
WidgetTester
BuildContext
MaterialApp
```

This keeps business logic independent from presentation.

------------------------------------------------------------------------

# 44. File Naming

Use `snake_case`.

Examples:

``` text
habit_model.dart
create_habit_usecase.dart
create_habit_usecase_impl.dart
habit_provider.dart
habit_screen.dart
habit_tile.dart
```

Classes use PascalCase:

``` text
HabitModel
CreateHabitUseCase
CreateHabitUseCaseImpl
HabitNotifier
HabitScreen
HabitTile
```

------------------------------------------------------------------------

# 45. Import Rules

Prefer package imports for project files:

``` dart
import 'package:habit_term/core/theme/app_colors.dart';
```

Avoid long chains of relative imports:

``` dart
import '../../../core/theme/app_colors.dart';
```

This makes feature boundaries easier to understand.

------------------------------------------------------------------------

# 46. Avoid God Classes

Do not create classes that handle everything.

Avoid:

``` text
HabitManager
AppManager
DataManager
StorageManager
ApplicationController
```

with dozens of unrelated responsibilities.

Instead split responsibilities:

``` text
CreateHabitUseCase
UpdateHabitUseCase
DeleteHabitUseCase
CompleteHabitUseCase
GetHabitStatsUseCase
```

Small classes are preferred when they have clear responsibilities.

------------------------------------------------------------------------

# 47. Avoid Premature Abstraction

Do not create abstractions simply because an abstraction is
theoretically possible.

Create an interface when it provides a meaningful architectural benefit
such as:

-   Testability
-   Replaceable implementation
-   Clear domain contract
-   Future storage implementation
-   Dependency inversion

Do not create five interfaces for a simple private helper.

The architecture should remain practical.

------------------------------------------------------------------------

# 48. Do Not Leak Storage Details

UI code must never know about Hive.

Bad:

``` dart
final box = Hive.box('habits');
```

inside a widget/provider.

Good:

``` text
UI
 ↓
Provider
 ↓
Use Case
 ↓
Implementation
 ↓
Memory
 ↓
Hive
```

Hive is an implementation detail of persistence.

------------------------------------------------------------------------

# 49. Do Not Put Business Logic in Widgets

Bad:

``` dart
onPressed: () {
  if (habit.frequency == HabitFrequency.daily) {
    ...
  }

  Hive.box(...).put(...);
}
```

Good:

``` dart
onPressed: () {
  ref.read(habitProvider.notifier).completeHabit(habit.id);
}
```

The provider/use case handles the operation.

------------------------------------------------------------------------

# 50. Do Not Put UI Logic in Models

Bad:

``` dart
class HabitModel {
  Color get color => ...;
}
```

unless the value is truly part of the domain model.

Prefer:

``` text
Model
 ↓
Provider
 ↓
UI
 ↓
Theme/design tokens
```

UI presentation decisions belong to the view layer.

------------------------------------------------------------------------

# 51. Feature Growth

When a feature becomes larger, do not immediately create deeper
architecture layers.

Start with:

``` text
model/
data/
view/
```

Only introduce additional folders when the feature genuinely requires
them.

For example:

``` text
data/
├── usecase/
├── implementation/
└── repository/
```

can be introduced later if repository abstraction becomes necessary.

Architecture should grow with the application.

------------------------------------------------------------------------

# 52. Recommended Final Structure

A mature version of Habit-Term may look like:

``` text
lib/
│
├── core/
│   ├── constants/
│   ├── extensions/
│   ├── helpers/
│   ├── memory/
│   │   ├── hive_adapters.dart
│   │   ├── hive_boxes.dart
│   │   └── hive_service.dart
│   ├── routing/
│   └── theme/
│       ├── app_colors.dart
│       ├── app_theme.dart
│       ├── app_typography.dart
│       ├── app_font_sizes.dart
│       ├── app_spacing.dart
│       └── app_text_constants.dart
│
├── shared/
│   ├── components/
│   └── widgets/
│       ├── terminal_button.dart
│       ├── terminal_checkbox.dart
│       ├── terminal_divider.dart
│       ├── terminal_input.dart
│       ├── terminal_panel.dart
│       ├── terminal_progress_bar.dart
│       ├── terminal_prompt.dart
│       └── terminal_shortcut_bar.dart
│
├── features/
│   │
│   ├── habit/
│   │   ├── model/
│   │   ├── data/
│   │   │   ├── usecase/
│   │   │   └── implementation/
│   │   └── view/
│   │       ├── provider/
│   │       ├── screen/
│   │       └── widgets/
│   │
│   ├── today/
│   ├── add_habit/
│   ├── stats/
│   ├── achievements/
│   ├── settings/
│   └── inspiration/
│
└── main.dart
```

------------------------------------------------------------------------

# 53. Architecture North Star

Habit-Term should remain:

``` text
Simple
   ↓
Feature-first
   ↓
Offline-first
   ↓
Testable
   ↓
Reusable
   ↓
Easy to extend
```

The most important dependency rule is:

``` text
               ┌─────────────┐
               │     UI      │
               └──────┬──────┘
                      ↓
               ┌─────────────┐
               │   Riverpod  │
               └──────┬──────┘
                      ↓
               ┌─────────────┐
               │  Use Cases  │
               └──────┬──────┘
                      ↓
               ┌─────────────┐
               │Implementation│
               └──────┬──────┘
                      ↓
               ┌─────────────┐
               │    Hive     │
               └─────────────┘
```

And the application-level organization is:

``` text
CORE
 ↓
Global infrastructure + design system

SHARED
 ↓
Reusable UI components

FEATURES
 ↓
Actual product functionality
```

When adding a new feature, follow this rule:

> **Put global infrastructure in `core`, reusable UI in `shared`, and
> everything specific to a product capability inside its own feature.**

The architecture should support the design philosophy defined in
`Design.md` without allowing the visual layer, state management, or
local persistence to become tightly coupled.
