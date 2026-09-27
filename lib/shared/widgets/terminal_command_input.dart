import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:habit_term/core/theme/app_colors.dart';
import 'package:habit_term/core/theme/app_radii.dart';
import 'package:habit_term/core/theme/app_spacing.dart';
import 'package:habit_term/core/theme/app_typography.dart';

/// Terminal-style command input with `/`-triggered suggestions.
///
/// Typing `/` opens a dropdown of [suggestions] filtered by the current
/// text; selecting one fills the field, and submitting (Enter or tapping a
/// suggestion) invokes [onSubmit] with the final command string.
class TerminalCommandInput extends StatefulWidget {
  const TerminalCommandInput({
    super.key,
    required this.suggestions,
    required this.onSubmit,
    this.hintText = 'type / for commands',
  });

  final List<String> suggestions;
  final ValueChanged<String> onSubmit;
  final String hintText;

  @override
  State<TerminalCommandInput> createState() => _TerminalCommandInputState();
}

class _TerminalCommandInputState extends State<TerminalCommandInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  List<String> _filtered = const [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleTextChanged() {
    final text = _controller.text;

    final matches = text.startsWith('/')
        ? widget.suggestions
              .where((s) => s.toLowerCase().startsWith(text.toLowerCase()))
              .toList()
        : const <String>[];

    if (matches.length != _filtered.length || !matches.every(_filtered.contains)) {
      setState(() => _filtered = matches);
    }
  }

  void _selectSuggestion(String command) {
    _controller.value = TextEditingValue(
      text: command,
      selection: TextSelection.collapsed(offset: command.length),
    );
    _submit(command);
  }

  void _submit([String? value]) {
    final command = (value ?? _controller.text).trim();

    if (command.isEmpty) {
      return;
    }

    widget.onSubmit(command);

    _controller.clear();
    setState(() => _filtered = const []);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_filtered.isNotEmpty) ...[
          _SuggestionBox(items: _filtered, onSelect: _selectSuggestion),
          const SizedBox(height: AppSpacing.sm),
        ],
        _CommandField(
          controller: _controller,
          focusNode: _focusNode,
          hintText: widget.hintText,
          onSubmit: _submit,
        ),
      ],
    );
  }
}

class _CommandField extends StatelessWidget {
  const _CommandField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '> ',
          style: AppTypography.command(),
        ),
        Expanded(
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: false,
            cursorColor: AppColors.primary,
            cursorWidth: 9,
            cursorRadius: Radius.zero,
            style: AppTypography.command(color: AppColors.text),
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            decoration: InputDecoration(
              isDense: true,
              filled: false,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: AppTypography.command(color: AppColors.textMuted),
            ),
            onSubmitted: onSubmit,
          ),
        ),
      ],
    );
  }
}

class _SuggestionBox extends StatelessWidget {
  const _SuggestionBox({
    required this.items,
    required this.onSelect,
  });

  final List<String> items;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: AppRadii.smallControlRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final item in items)
            _SuggestionRow(
              command: item,
              isLast: item == items.last,
              onTap: () => onSelect(item),
            ),
        ],
      ),
    );
  }
}

class _SuggestionRow extends StatelessWidget {
  const _SuggestionRow({
    required this.command,
    required this.isLast,
    required this.onTap,
  });

  final String command;
  final bool isLast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : const Border(bottom: BorderSide(color: AppColors.border)),
        ),
        child: Text(
          command,
          style: AppTypography.command(color: AppColors.primary),
        ),
      ),
    );
  }
}
