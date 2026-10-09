import 'package:flutter/material.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';
import 'package:habit_term/shared/widgets/terminal_option_picker.dart';
import 'package:habit_term/shared/widgets/terminal_primary_button.dart';
import 'package:habit_term/shared/widgets/terminal_prompt_label.dart';
import 'package:habit_term/shared/widgets/terminal_screen_scaffold.dart';
import 'package:habit_term/shared/widgets/terminal_selector_row.dart';
import 'package:habit_term/shared/widgets/terminal_text_field.dart';
import 'package:habit_term/shared/widgets/terminal_toggle_row.dart';

/// `~/add` screen — terminal wizard for creating a new habit.
///
/// Currently backed by dummy/static state only; wiring to Riverpod/Hive
/// lands separately. See CLAUDE.md — this screen only composes widgets.
class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  State<AddHabitScreen> createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: 'Read Book',
  );

  static const List<String> _frequencyOptions = ['Daily', 'Weekly', 'Monthly'];
  static const List<String> _targetOptions = [
    '1 time',
    '2 times',
    '5 times',
    'Unlimited',
  ];

  String _frequency = _frequencyOptions.first;
  String _target = _targetOptions.first;

  bool _addToToday = true;
  bool _setReminder = false;
  bool _addNote = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickFrequency() async {
    final selected = await showTerminalOptionPicker(
      context,
      title: 'frequency',
      options: _frequencyOptions,
      selected: _frequency,
    );
    if (selected != null) {
      setState(() => _frequency = selected);
    }
  }

  Future<void> _pickTarget() async {
    final selected = await showTerminalOptionPicker(
      context,
      title: 'target',
      options: _targetOptions,
      selected: _target,
    );
    if (selected != null) {
      setState(() => _target = selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TerminalScreenScaffold(
      commandLabel: 'add',
      showCommandInput: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a new habit',
              style: AppTypography.h3(color: AppColors.primary),
            ),
            const SizedBox(height: AppSpacing.xxl),

            const TerminalPromptLabel(label: 'name'),
            const SizedBox(height: AppSpacing.md),
            TerminalTextField(controller: _nameController),
            const SizedBox(height: AppSpacing.xxl),

            const TerminalPromptLabel(label: 'frequency'),
            const SizedBox(height: AppSpacing.md),
            TerminalSelectorRow(value: _frequency, onTap: _pickFrequency),
            const SizedBox(height: AppSpacing.xxl),

            const TerminalPromptLabel(label: 'target (optional)'),
            const SizedBox(height: AppSpacing.md),
            TerminalSelectorRow(value: _target, onTap: _pickTarget),
            const SizedBox(height: AppSpacing.xxl),

            TerminalToggleRow(
              label: 'Add to today',
              checked: _addToToday,
              onChanged: (value) => setState(() => _addToToday = value),
            ),
            const SizedBox(height: AppSpacing.md),
            TerminalToggleRow(
              label: 'Set reminder',
              checked: _setReminder,
              onChanged: (value) => setState(() => _setReminder = value),
            ),
            const SizedBox(height: AppSpacing.md),
            TerminalToggleRow(
              label: 'Add note',
              checked: _addNote,
              onChanged: (value) => setState(() => _addNote = value),
            ),
            const SizedBox(height: AppSpacing.xxl),

            const TerminalPrimaryButton(label: 'Create Habit'),
          ],
        ),
      ),
    );
  }
}
