# CLAUDE.md

Guidance for Claude Code when working in this repository.

## Project

Habit-Term is an **offline-first CLI-style habit tracker** built with Flutter.
It must look and feel like a terminal application — retro, monospace,
green-on-black, cyberpunk-adjacent — not a normal app with a green theme
slapped on. See the reference screens (whoami, `~/today`, `~/add`,
`~/habit/1`, `~/stats`, `~/achievements`, `~/settings`, `~/inspire`,
`~/complete`).

Full rules live in two files at the repo root — **read them before
implementing anything**:

- `Architecture.md` — folder structure, layering, state management, Hive rules
- `Design.md` — colors, typography, spacing, component patterns, terminal
  language

Do not restate or duplicate those rules here; treat them as source of truth
and keep this file only as a pointer + a few working conventions.

## Stack

- Flutter & Dart — client
- Hive — local/offline persistence (source of truth, no network dependency)
- Riverpod — state management

## Structure (see `Architecture.md` for full detail)

```
lib/
├── core/        # theme (colors/typography/font sizes/spacing/text constants),
│                # constants, extensions, helpers, memory (Hive)
├── shared/      # widgets/components reusable across 2+ features
└── features/    # today, habit, add_habit, stats, achievements, settings, inspiration
    └── <feature>/{model, data/{usecase,implementation}, view/{provider, screen, widgets}}
```

Dependency direction: `core → shared → features`. Core never imports feature
code. Features depend on `core/theme` and `shared/widgets`, not on each
other's internals.

## Design tokens (see `Design.md` for full detail)

All colors, typography, spacing, radii, and text constants live in
`core/theme/` (`app_colors.dart`, `app_typography.dart`, `app_font_sizes.dart`,
`app_spacing.dart`, `app_text_constants.dart`, `app_theme.dart`). Never
hardcode a `Color(...)`, raw font size, or literal `EdgeInsets.all(n)` inside
a feature widget — consume the token instead. Font is JetBrains Mono
everywhere.

## Screen and widget rules

- **Screens are skeletons only.** A screen (`feature/view/screen/`) composes
  layout and wires provider state to widgets — it must not contain inline UI
  chunks, styling logic, or business logic. If a section of a screen is more
  than a few lines of composition, extract it into a widget.
- **Feature-specific widgets** go in `feature/view/widgets/` (e.g.
  `HabitTile`, `HabitStreakCard`, `TodayHabitList`).
- **Reusable widgets** — anything usable by 2+ features, or a generic
  terminal primitive (button, panel, input, checkbox, progress bar, divider,
  shortcut bar, empty/error state) — go in `shared/widgets/`. Don't move a
  widget to `shared/` just because it's large; it must be genuinely feature-
  agnostic (see Architecture.md §13).
- Prefer composing existing `shared/` terminal components over inventing new
  one-off styling per screen.

## Conventions

- File names: `snake_case.dart`. Classes: `PascalCase`.
- Use package imports (`package:habit_term/...`), not deep relative imports.
- Use cases are single-purpose (`CreateHabitUseCase`, not `HabitManager`).
- UI never touches Hive directly; always Screen → Provider → UseCase →
  Implementation → Memory → Hive.
- `setState` only for ephemeral local UI state; shared/persistent state goes
  through Riverpod.
