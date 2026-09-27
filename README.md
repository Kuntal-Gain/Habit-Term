# HABIT-TERM

<img width="648" height="271" alt="brand" src="https://github.com/user-attachments/assets/6aee7faf-5655-485a-bda2-2b7e744d11ff" />

[![GitHub stars](https://img.shields.io/github/stars/Kuntal-Gain/Habit-Term?style=for-the-badge&logo=github)](https://github.com/Kuntal-Gain/Habit-Term/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Kuntal-Gain/Habit-Term?style=for-the-badge&logo=github)](https://github.com/Kuntal-Gain/Habit-Term/network/members)
[![GitHub issues](https://img.shields.io/github/issues/Kuntal-Gain/Habit-Term?style=for-the-badge&logo=github)](https://github.com/Kuntal-Gain/Habit-Term/issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/Kuntal-Gain/Habit-Term?style=for-the-badge&logo=github)](https://github.com/Kuntal-Gain/Habit-Term/commits/master)

**A terminal-styled, offline-first habit tracker built with Flutter.**

Small steps. Big version of you.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.13-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![State Management](https://img.shields.io/badge/State-Riverpod-3ECF8E)](https://riverpod.dev)
[![Storage](https://img.shields.io/badge/Storage-Hive-FFB300)](https://docs.hivedb.dev)
[![Routing](https://img.shields.io/badge/Routing-go__router-4285F4)](https://pub.dev/packages/go_router)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-2ea44f)](#)
[![License](https://img.shields.io/badge/License-Unlicensed-lightgrey)](#license)

---

## About

Habit-Term is not a habit tracker with a green theme slapped on — it's
designed to look and feel like a real terminal application: retro,
monospace, green-on-black, keyboard/command oriented. Every screen is a
"path" (`~/today`, `~/add`, `~/stats`, `~/habit/1`) and every action has an
obvious shortcut (`[1] Add Habit`, `[e] Edit`, `[b] Back`).

The app is **offline-first**: all data lives locally in Hive, with no
network dependency for core functionality.

## Features

- `~/today` — daily habit checklist with completion progress
- `~/habit/:id` — single-habit calendar view, streaks, and completion rate
- `~/add` — terminal-style wizard for creating a new habit
- `~/stats` — daily / weekly / monthly / all-time statistics
- `~/achievements` — terminal-style unlocks
- `~/settings` — compact, keyboard-driven preferences
- `~/inspire` — rotating terminal quotes
- `~/complete` — habit completion celebration screen
- Command input with `/`-triggered autocomplete for navigating between
  screens, in addition to numbered/lettered shortcuts

## Tech Stack

| Concern              | Choice                                  |
| --------------------- | ---------------------------------------- |
| Framework             | Flutter                                  |
| Language              | Dart                                     |
| State management      | Riverpod                                 |
| Local persistence     | Hive (offline-first, source of truth)    |
| Routing               | go_router                                |
| Typography            | JetBrains Mono                           |

## Architecture

The codebase follows a strict layered structure — see
[`Architecture.md`](Architecture.md) for full rules.

```
lib/
├── core/        # theme, constants, extensions, helpers, memory (Hive)
├── shared/      # widgets reusable across 2+ features
└── features/    # today, habit, add_habit, stats, achievements, settings, inspiration
    └── <feature>/
        ├── model/
        ├── data/            # usecase + usecase_impl (flat, no subfolders)
        └── view/
            ├── provider/
            ├── screen/      # skeletons only — composition, no inline UI logic
            └── widgets/     # feature-specific widgets
```

Dependency direction is strictly `core → shared → features`. Data flows
`Screen → Provider → UseCase → Implementation → Memory → Hive` — the UI
never touches Hive directly.

## Design System

All colors, typography, spacing, radii, and copy are centralized as design
tokens in `lib/core/theme/` — no feature widget hardcodes a `Color(...)`,
raw font size, or literal `EdgeInsets`. Full visual language, component
patterns, and screen-by-screen specs live in
[`Design.md`](Design.md).

```
Background   #000800
Primary      #58F8A0
Warning      #FFD66B
Danger       #FF6B7A
Font         JetBrains Mono
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart ^3.13)
- A connected device, simulator/emulator, or a supported desktop/web target

### Setup

```bash
git clone <repository-url>
cd habit_term
flutter pub get
```

### Run

```bash
flutter run
```

### Generate Hive adapters

If a model changes, regenerate the Hive `TypeAdapter`s:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Test

```bash
flutter test
```

## Contributing

Before implementing anything, read [`Architecture.md`](Architecture.md) and
[`Design.md`](Design.md) — they are the source of truth for structure and
visual rules, and [`CLAUDE.md`](CLAUDE.md) captures the working conventions
for this repository.

## License

No license has been declared for this project yet.
