import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Incase/assats/colors/colors.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final EdgeInsets contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final double prefixMaxWidth;
  final double suffixMaxWidth;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool hasError;
  final bool isObscure;
  final String prefixText;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String title;
  final double height;
  final int? maxLines;
  final String errorText;

  const DefaultTextField({
    required this.controller,
    required this.onChanged,
    this.prefix,
    this.title = '',
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.inputFormatters,
    this.suffix,
    this.prefixMaxWidth = 40,
    this.suffixMaxWidth = 40,
    this.hintStyle,
    this.hintText,
    this.style,
    this.isObscure = false,
    this.hasError = false,
    this.prefixText = '',
    this.errorText = '',
    this.inputDecoration,
    this.keyboardType,
    this.height = 40,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: const Color.fromRGBO(255, 255, 255, 0.48),
                    fontSize: 12),
              ),
              if (hasError) ...[
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    errorText,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: Colors.red),
                  ),
                )
              ]
            ],
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: height,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: style ??
                Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: const Color.fromRGBO(255, 255, 255, 0.48)),
            inputFormatters: inputFormatters,
            obscureText: isObscure,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: inputDecoration ??
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: hasError
                            ? Colors.red
                            : const Color.fromRGBO(15, 15, 15, 0.50)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: hasError ? Colors.red : grey),
                  ),
                  hintText: hintText,
                  hintStyle:
                      hintStyle ?? Theme.of(context).textTheme.displaySmall,
                  contentPadding: contentPadding,
                  suffixIcon: suffix,
                  suffixIconConstraints:
                      BoxConstraints(maxWidth: suffixMaxWidth),
                  fillColor: const Color.fromRGBO(15, 15, 15, 0.50),
                  filled: true,
                  prefixIconConstraints:
                      BoxConstraints(maxWidth: prefixMaxWidth),
                  prefixIcon: prefix,
                ),
          ),
        ),
      ],
    );
  }
}
