# Habit-Term Design System

## 1. Design Identity

Habit-Term is an **offline-first CLI habit tracker** designed to feel
like a polished terminal application rather than a conventional
mobile/web productivity app.

The visual identity is:

-   Retro terminal
-   Minimal
-   Developer-oriented
-   Calm and focused
-   Slightly cyberpunk/futuristic
-   High contrast without being harsh
-   Text-first
-   Keyboard/command oriented

The interface should communicate:

> Small steps. Big version of you.

The design must feel intentional and consistent across every screen.

### Core principle

**Do not make a normal app and simply apply a green theme to it.**

The UI should behave and look like a terminal-native application: -
Commands - Prompt symbols - Monospace typography - Thin borders -
ASCII-inspired layouts - Keyboard shortcuts - Compact information -
Minimal decoration - Clear visual hierarchy

------------------------------------------------------------------------

# 2. Visual Reference

The intended visual direction is based on the provided Habit-Term
reference UI.

Important characteristics from the reference:

-   Very dark green-black background
-   Bright terminal green as the primary accent
-   Thin green borders
-   Monospace typography
-   Large letter spacing for branding
-   Terminal-style paths such as `~/today`
-   Prompt symbols such as `>`
-   Checkbox-style habit completion
-   Progress bars made from blocks
-   Small secondary accent colors
-   Minimal rounded corners
-   Large amounts of negative space
-   Dense but readable information
-   Terminal command/navigation language

The final implementation should preserve this visual language even when
adding new screens.

------------------------------------------------------------------------

# 3. Color System

## 3.1 Base Colors

Never hardcode colors throughout the UI.

All colors must come from the centralized design system.

``` text
Background        #000800
Surface           #001008
Surface Elevated  #001810

Border            #185040
Border Bright     #3CC878

Primary           #58F8A0
Primary Bright    #70FFB0
Primary Dim       #22885A

Text              #E0FFE9
Text Secondary    #A8C8B5
Text Muted        #608070

Success           #58F8A0
Warning           #FFD66B
Danger            #FF6B7A
Info              #63E6E2
Purple            #D99AFF

White             #F2FFF6
Black             #000000
```

------------------------------------------------------------------------

## 3.2 Color Usage

### Background

``` text
#000800
```

Use for: - Main application background - Full-screen background - Empty
space

Do not use pure `#000000` as the primary background.

The subtle green tint is intentional.

------------------------------------------------------------------------

### Surface

``` text
#001008
```

Use for: - Cards - Panels - Input areas - Dialog-like terminal sections

------------------------------------------------------------------------

### Elevated Surface

``` text
#001810
```

Use sparingly for: - Selected items - Active panels - Focused areas -
Important controls

------------------------------------------------------------------------

### Primary

``` text
#58F8A0
```

This is the main Habit-Term identity color.

Use for: - Commands - Active navigation - Completed habits - Primary
buttons - Progress indicators - Focus states - Important values -
Selected items

Do not use it for every piece of text.

Green should remain visually meaningful.

------------------------------------------------------------------------

### Primary Bright

``` text
#70FFB0
```

Use for: - Strong emphasis - Hover/focus states - Important success
states - Primary CTA emphasis

------------------------------------------------------------------------

### Primary Dim

``` text
#22885A
```

Use for: - Decorative terminal elements - Disabled green elements -
Subtle separators - Secondary progress elements

------------------------------------------------------------------------

### Main Text

``` text
#E0FFE9
```

Use for: - Habit names - Body text - Important information - Headings
that should not be green

------------------------------------------------------------------------

### Secondary Text

``` text
#A8C8B5
```

Use for: - Descriptions - Supporting information - Metadata

------------------------------------------------------------------------

### Muted Text

``` text
#608070
```

Use for: - Disabled content - Hints - Low-priority metadata -
Placeholder text

------------------------------------------------------------------------

## 3.3 Semantic Colors

### Success

``` text
#58F8A0
```

Examples:

``` text
[x] Workout
Completed
+1
```

------------------------------------------------------------------------

### Warning

``` text
#FFD66B
```

Use for: - Streaks - Reminders - Upcoming actions - Attention-required
states

Example:

``` text
Streak             12 days
Longest Streak     21 days
```

------------------------------------------------------------------------

### Danger

``` text
#FF6B7A
```

Use only for: - Delete - Destructive actions - Critical errors

Do not make the entire error UI red.

------------------------------------------------------------------------

### Info

``` text
#63E6E2
```

Use for: - Informational messages - Neutral status indicators -
Secondary highlights

------------------------------------------------------------------------

### Purple

``` text
#D99AFF
```

Use as a secondary personality accent.

Good uses: - Achievement categories - Quotes - Special milestones -
Decorative highlights

Do not use purple as a second primary color.

------------------------------------------------------------------------

# 4. Typography

## Primary Font

Use:

**JetBrains Mono**

This is the default font for the entire application.

The interface should be intentionally monospace.

Recommended weights:

``` text
Regular    400
Medium     500
SemiBold   600
Bold       700
```

------------------------------------------------------------------------

## Typography Scale

``` text
Display       32px   Bold       Letter spacing: 6px
H1            24px   Bold       Letter spacing: 1px
H2            18px   SemiBold   Letter spacing: 0px
H3            16px   SemiBold   Letter spacing: 0px
Body          14px   Regular    Letter spacing: 0px
Command       14px   Medium     Letter spacing: 0px
Metadata      12px   Regular    Letter spacing: 0px
Caption       11px   Regular    Letter spacing: 0px
Stats         16px   Bold       Letter spacing: 0px
```

------------------------------------------------------------------------

## Branding Typography

The application name should use large letter spacing.

Example:

``` text
H A B I T
- T E R M
```

Recommended:

``` text
Font: JetBrains Mono
Weight: Bold
Size: 32px
Letter spacing: 6px
Color: #58F8A0
```

Do not use normal proportional typography for the logo.

------------------------------------------------------------------------

# 5. Layout Philosophy

The layout should feel like a terminal viewport.

Avoid: - Excessive cards - Large floating buttons - Material-style UI -
Heavy shadows - Gradients - Glassmorphism - Excessive rounded
containers - Large illustrations inside every screen

Prefer: - Thin borders - Horizontal separators - Text hierarchy -
Command prompts - Compact controls - Consistent spacing - Terminal
paths - Keyboard shortcuts

------------------------------------------------------------------------

# 6. Spacing System

Use a consistent 4px-based spacing system.

``` text
4px    xs
8px    sm
12px   md
16px   lg
20px   xl
24px   xxl
32px   xxxl
40px   section
48px   major section
```

Recommended default:

``` text
Screen horizontal padding: 24px
Section spacing: 24px
Card padding: 16px
Control spacing: 12px
Text-to-icon spacing: 8px
```

Do not randomly introduce spacing values.

If a new spacing value is required, add it to the design system rather
than hardcoding it.

------------------------------------------------------------------------

# 7. Borders

Borders are an important part of the terminal aesthetic.

Default border:

``` text
#185040
```

Focused/active border:

``` text
#3CC878
```

Primary highlighted border:

``` text
#58F8A0
```

Use thin borders.

Preferred:

``` text
1px
```

Avoid thick 2--4px borders unless there is a specific visual reason.

------------------------------------------------------------------------

# 8. Corner Radius

The interface should be mostly sharp or subtly rounded.

Recommended:

``` text
Small controls: 4px
Cards:           6px
Large panels:    8px
Buttons:         4px
```

Avoid: - 16px+ - Pill-shaped controls - Excessive rounded cards

The design should still feel like a terminal.

------------------------------------------------------------------------

# 9. Shadows

Avoid conventional app shadows.

The dark background and borders should provide hierarchy.

Do not add: - Large drop shadows - Material elevation - Glow everywhere

A subtle green glow may be used very selectively for: - Primary focus -
Completion celebration - Logo - Important terminal effects

------------------------------------------------------------------------

# 10. Icons

Icons should support the terminal UI rather than dominate it.

Prefer: - Simple line icons - Small icons - Monochrome icons - Terminal
symbols - ASCII symbols when appropriate

Examples:

``` text
>
→
✓
[x]
[ ]
*
+
-
~
$
#
@
```

Use icons only when they improve recognition.

Do not fill the UI with decorative icons.

------------------------------------------------------------------------

# 11. Terminal Language

The application should use terminal-style naming.

Examples:

``` text
~/today
~/add
~/stats
~/achievements
~/settings
~/inspire
~/complete
~/habit/1
```

Instead of:

``` text
Today
Add Habit
Statistics
Settings
Inspiration
```

The terminal path can act as the page title.

Example:

``` text
~/today
────────────────────────────────
```

This pattern should remain consistent throughout the application.

------------------------------------------------------------------------

# 12. Command Prompt

Use `>` as the primary interaction prompt.

Example:

``` text
> name
  Read Book
```

or:

``` text
> frequency
  Daily
```

The prompt should use:

``` text
Color: #58F8A0
Font: JetBrains Mono Medium
```

The value should use the normal text color.

------------------------------------------------------------------------

# 13. Buttons

Buttons should look like terminal commands.

Preferred:

``` text
[ Create Habit ]
```

or:

``` text
[✓] Save
```

Avoid:

``` text
Create Habit
```

inside a large rounded Material button.

Primary button:

``` text
Background: #58F8A0
Text:       #000800
Border:     #58F8A0
Radius:     4px
```

Secondary button:

``` text
Background: transparent
Text:       #58F8A0
Border:     #185040
Radius:     4px
```

------------------------------------------------------------------------

# 14. Inputs

Inputs should resemble terminal prompts.

Example:

``` text
> name

┌──────────────────────────────┐
│ Read Book                    │
└──────────────────────────────┘
```

Default:

``` text
Background: #001008
Border: #185040
Text: #E0FFE9
```

Focused:

``` text
Border: #58F8A0
```

Placeholder:

``` text
#608070
```

Avoid heavily rounded text fields.

------------------------------------------------------------------------

# 15. Checkboxes

Habit completion is one of the most important interactions.

Use terminal-style checkboxes:

``` text
[x] Drink Water
[ ] Workout
[x] Meditate
```

Completed:

``` text
[x]
```

Unchecked:

``` text
[ ]
```

Completed habit name may use:

``` text
#A8C8B5
```

while the checkbox remains:

``` text
#58F8A0
```

Do not automatically strike through every completed habit unless it
improves the specific screen.

------------------------------------------------------------------------

# 16. Progress Bars

Use terminal-inspired progress bars.

Example:

``` text
████████████░░░░░░░░
```

or:

``` text
[██████████░░░░░░░░░░] 50%
```

Completed portion:

``` text
#58F8A0
```

Remaining portion:

``` text
#185040
```

Keep progress bars rectangular.

------------------------------------------------------------------------

# 17. Data Visualization

Statistics should still look like terminal output.

Example:

``` text
Completion Rate     71%
Total Habits         5
Completed           25
Missed              10
```

For charts:

-   Use simple block/bar representations
-   Avoid excessive gradients
-   Avoid 3D charts
-   Avoid glossy visualizations
-   Keep labels monospace

Example:

``` text
Mon  ███████
Tue  ███
Wed  ████████
Thu  ██████████
Fri  █████
Sat  ████████
Sun  ██████
```

------------------------------------------------------------------------

# 18. Habit Cards

A habit card should be compact.

Example:

``` text
┌──────────────────────────────────┐
│ [✓] Read Book                    │
│     Daily · 1 time               │
│                                  │
│     Streak        12 days        │
└──────────────────────────────────┘
```

Avoid making every habit card visually heavy.

The user should be able to scan multiple habits quickly.

------------------------------------------------------------------------

# 19. Screen Design

## Today

Path:

``` text
~/today
```

Purpose:

Show the user's current habits and completion progress.

Structure:

``` text
~/today
────────────────────────────────

Thu, 25 Sep 2025              09:41

"Discipline is just
 self-love in the terminal."
                    - anonymous

3 / 5 completed

████████████░░░░░░

[x] Drink Water             2/2
[x] Workout                 1/1
[ ] Read Book               0/1
[x] Meditate                1/1
[ ] No Social Media         0/1

────────────────────────────────

[1] Add Habit   [2] View Stats
[3] Settings    [4] Quit
```

------------------------------------------------------------------------

# 20. Add Habit

Path:

``` text
~/add
```

Use a terminal wizard.

Example:

``` text
~/add
────────────────────────────────

Create a new habit

> name

┌──────────────────────────────┐
│ Read Book                    │
└──────────────────────────────┘

> icon

[ 📚 ]                         >

> frequency

Daily                         >

> target

1 time                        >

[✓] Add to today
[ ] Set reminder
[ ] Add note

────────────────────────────────

[ Create Habit ]
```

------------------------------------------------------------------------

# 21. Habit Detail

Path:

``` text
~/habit/1
```

Show:

-   Habit identity
-   Frequency
-   Calendar
-   Streak
-   Longest streak
-   Completion rate
-   Actions

Example:

``` text
~/habit/1
────────────────────────────────

┌──────────────────────────────┐
│ 📖  Read Book                │
│     Daily · 1 time           │
└──────────────────────────────┘

< September 2025 >

Mo Tu We Th Fr Sa Su

13 12 12 22 13 3 3
●  ●  ●  ●  ●  ● ●

...

Streak                  12 days
Longest Streak          21 days
Completion Rate         78%

────────────────────────────────

[✓] Mark Done
[d] Delete
[e] Edit
[b] Back
```

------------------------------------------------------------------------

# 22. Statistics

Path:

``` text
~/stats
```

Use:

``` text
Daily   Weekly   Monthly   All
```

without turning it into a modern tab-heavy interface.

Example:

``` text
~/stats
────────────────────────────────

Daily  Weekly  Monthly  All

<    22 Sep - 28 Sep 2025    >

Mon  ███████
Tue  ███
Wed  ████████
Thu  ██████████
Fri  █████
Sat  ████████
Sun  ██████

────────────────────────────────

Completion Rate        71%
Total Habits            5
Completed              25
Missed                 10

> Keep going! You're doing great.
```

------------------------------------------------------------------------

# 23. Achievements

Path:

``` text
~/achievements
```

Achievements should feel like terminal unlocks.

Example:

``` text
┌──────────────────────────────────┐
│ 🏆  First Step                  │
│     Complete a habit             │
│     for the first time.       [✓]│
└──────────────────────────────────┘
```

Locked achievements should be visibly muted:

``` text
#608070
```

Unlocked achievements can use: - Primary green - Warning yellow - Purple
for special achievements

------------------------------------------------------------------------

# 24. Settings

Path:

``` text
~/settings
```

Keep settings compact.

Example:

``` text
~/settings
────────────────────────────────

Appearance          Terminal Green >
Notifications       On              >
Daily Reminder      8:00 AM         >
Backup & Sync       On              >
Export Data                          >
Clear All Data                       >
About                               >

────────────────────────────────

"A better you
 is a series of small commands
 executed daily."
```

------------------------------------------------------------------------

# 25. Inspiration

Path:

``` text
~/inspire
```

This screen can be slightly more visual but must remain inside the
terminal aesthetic.

Example:

``` text
┌──────────────────────────────────┐
│                                  │
│        small quote / art         │
│                                  │
│ "You don't have to be perfect.   │
│  You just have to keep showing   │
│  up."                            │
│                                  │
└──────────────────────────────────┘

[n] Next Quote    [b] Back
```

------------------------------------------------------------------------

# 26. Completion Screen

Path:

``` text
~/complete
```

This is one of the few places where the design can become celebratory.

Example:

``` text
             ✦   ✧

             🏆

       Habit Completed!

          Read Book

       +1 to a better you.

        [ Great! ]

             ✧   ✦
```

Use: - Primary green - Warning yellow - Small particles/symbols

Avoid excessive animation.

------------------------------------------------------------------------

# 27. Empty States

Empty states should remain terminal-like.

Example:

``` text
~/today
────────────────────────────────

No habits configured.

> add

Create your first habit
and start building momentum.

[ Add Habit ]
```

Avoid generic illustrations unless they fit the terminal identity.

------------------------------------------------------------------------

# 28. Error States

Errors should be informative rather than visually aggressive.

Example:

``` text
~/today
────────────────────────────────

! Unable to load today's habits.

Reason:
Local storage could not be accessed.

> retry
> settings
> back
```

Use `#FF6B7A` only for the error indicator.

------------------------------------------------------------------------

# 29. Offline-First Principle

Habit-Term is an **offline-first application**.

The design should never imply that network connectivity is required for
core functionality.

Core habit operations should work without internet:

-   Create habit
-   Edit habit
-   Delete habit
-   Complete habit
-   View history
-   View statistics
-   View achievements
-   View settings
-   Export local data

If synchronization is introduced later, it should be presented as an
optional capability.

------------------------------------------------------------------------

# 30. Animation

Animation should be subtle.

Good animations:

-   Progress bar filling
-   Checkbox completion
-   Small achievement celebration
-   Screen transitions
-   Focus transitions
-   Completion particles

Avoid:

-   Large page transitions
-   Excessive bouncing
-   Continuous animations
-   UI elements flying around
-   Long loading animations

The interface should feel fast.

A CLI application should feel immediate.

------------------------------------------------------------------------

# 31. Interaction Principles

The application should prioritize keyboard/command interaction.

Every important action should have an obvious command or shortcut.

Examples:

``` text
[1] Add Habit
[2] View Stats
[3] Settings
[4] Quit
```

and:

``` text
[e] Edit
[d] Delete
[b] Back
[n] Next
[q] Quit
```

Do not hide critical actions behind icon-only controls.

------------------------------------------------------------------------

# 32. Accessibility

Despite the terminal aesthetic:

-   Maintain readable contrast
-   Do not rely only on color
-   Use symbols/text for status
-   Provide clear focus states
-   Keep font readable
-   Avoid extremely small text
-   Ensure destructive actions are clearly labeled

Example:

Do not use only:

``` text
●
```

for completion.

Prefer:

``` text
[x] Completed
```

when space allows.

------------------------------------------------------------------------

# 33. Design Anti-Patterns

Do NOT introduce these unless there is a very strong reason:

``` text
❌ Material 3 default cards
❌ Large pill buttons
❌ Heavy shadows
❌ Glassmorphism
❌ Gradients everywhere
❌ Bright neon rainbow palette
❌ Multiple competing primary colors
❌ Large photographic backgrounds
❌ Generic SaaS dashboard styling
❌ Excessive rounded corners
❌ Giant floating action buttons
❌ Conventional mobile navigation bars
❌ Inconsistent icon styles
❌ Random colors
❌ Hardcoded Color(...) values throughout the code
```

------------------------------------------------------------------------

# 34. Design Tokens

The implementation should centralize design tokens.

Suggested structure:

``` text
lib/
  core/
    theme/
      app_colors.dart
      app_typography.dart
      app_spacing.dart
      app_radii.dart
      app_borders.dart
      app_theme.dart
```

The exact folder structure may differ depending on the project
architecture, but the principle is mandatory:

**UI components should consume design tokens instead of defining their
own visual values.**

------------------------------------------------------------------------

# 35. Component Philosophy

Reusable components should be created for repeated terminal patterns.

Potential components:

``` text
TerminalHeader
TerminalPanel
TerminalDivider
TerminalPrompt
TerminalButton
TerminalInput
TerminalCheckbox
TerminalProgressBar
TerminalStat
TerminalShortcutBar
TerminalEmptyState
TerminalErrorState
TerminalQuote
TerminalAchievement
```

Components should remain small and composable.

Do not create one giant widget that handles the entire application UI.

------------------------------------------------------------------------

# 36. Naming

Use consistent terminal vocabulary.

Preferred:

``` text
Habit
Streak
Completion
Target
Frequency
Progress
Today
Stats
Achievement
Reminder
Command
```

Terminal paths:

``` text
~/today
~/add
~/stats
~/achievements
~/settings
~/inspire
~/complete
~/habit/:id
```

------------------------------------------------------------------------

# 37. Overall Design Rule

Whenever implementing a new feature, ask:

1.  Does this look like a terminal application?
2.  Does it use the established color tokens?
3.  Does it use JetBrains Mono?
4.  Does it preserve the dark green-black atmosphere?
5.  Is the hierarchy clear without excessive decoration?
6.  Does it support keyboard/command interaction where appropriate?
7.  Is the component reusable?
8.  Does it avoid conventional SaaS/mobile UI patterns?
9.  Does it remain readable and accessible?
10. Does it feel like the same application as `~/today`?

If the answer to any of these is no, reconsider the design before
implementing it.

------------------------------------------------------------------------

# 38. Design North Star

The final product should feel like:

``` text
A beautiful terminal
        +
A focused habit tracker
        +
A small RPG-like progression system
        +
A calm productivity tool
```

Not:

``` text
A normal habit tracker
        +
A green color theme
```

The user should feel like they are **executing commands to build a
better version of themselves.**

The core visual identity is:

``` text
                 H A B I T
                 - T E R M

             small steps.
          big version of you.

        ~/today
        ~/add
        ~/stats
        ~/achievements

        #000800
        #58F8A0
        JetBrains Mono
```

This identity should remain consistent across the entire application.
