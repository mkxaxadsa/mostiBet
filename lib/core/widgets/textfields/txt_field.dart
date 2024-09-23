import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';
import '../../config/themes.dart';
import '../../utils.dart';

class TxtField extends StatefulWidget {
  const TxtField({
    super.key,
    required this.controller,
    required this.hintText,
    this.number = false,
    this.datePicker = false,
    this.timePicker = false,
    this.length = 20,
    this.width = 260,
    this.prefix = true,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool number;
  final bool datePicker;
  final bool timePicker;
  final int length;
  final double width;
  final bool prefix;
  final void Function() onChanged;

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  TextInputType? _keyboardType() {
    if (widget.number) return TextInputType.number;
    return null;
  }

  bool _readOnly() {
    if (widget.datePicker || widget.timePicker) return true;
    return false;
  }

  List<TextInputFormatter>? _inputFormatters() {
    final length = LengthLimitingTextInputFormatter(widget.length);
    final digit = FilteringTextInputFormatter.digitsOnly;
    if (widget.number) return [length, digit];
    return [length];
  }

  void onDateTimeChanged(DateTime date) {
    setState(() {
      widget.controller.text = dateToString(date);
    });
    widget.onChanged();
  }

  void onTimeChanged(DateTime date) {
    setState(() {
      widget.controller.text = timeToString(date);
    });
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.textfield,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            width: 1,
            color: AppColors.border,
          ),
        ),
        child: TextField(
          controller: widget.controller,
          textAlign: TextAlign.center,
          keyboardType: _keyboardType(),
          inputFormatters: _inputFormatters(),
          readOnly: _readOnly(),
          textCapitalization: TextCapitalization.sentences,
          style: const TextStyle(
            color: AppColors.white,
            fontFamily: Fonts.regular,
          ),
          decoration: InputDecoration(
            prefixIcon: widget.prefix
                ? const Icon(
                    Icons.edit_rounded,
                    size: 16,
                    color: Colors.transparent,
                  )
                : null,
            suffixIcon: const Icon(
              Icons.edit_rounded,
              size: 16,
              color: AppColors.border,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 0,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: AppColors.border,
              fontFamily: Fonts.regular,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value) {
            widget.onChanged();
          },
          onTap: () async {
            if (widget.datePicker) {
              await showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 240,
                    decoration: const BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                    ),
                    child: CupertinoTheme(
                      data: cupertinoTheme,
                      child: CupertinoDatePicker(
                        onDateTimeChanged: onDateTimeChanged,
                        initialDateTime: stringToDate(widget.controller.text),
                        mode: CupertinoDatePickerMode.date,
                        minimumYear: 1950,
                        maximumYear: DateTime.now().year + 1,
                      ),
                    ),
                  );
                },
              );
            } else if (widget.timePicker) {
              await showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return Container(
                    height: 240,
                    decoration: const BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                    ),
                    child: CupertinoTheme(
                      data: cupertinoTheme,
                      child: CupertinoDatePicker(
                        onDateTimeChanged: onTimeChanged,
                        initialDateTime: stringToDate(widget.controller.text),
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
