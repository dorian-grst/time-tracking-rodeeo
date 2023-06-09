import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

const hSizedBox20 = SizedBox(height: 20);
const hSizedBox15 = SizedBox(height: 15);

class EditTaskForm extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool center;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const EditTaskForm({
    Key? key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.center,
    required this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hSizedBox20,
        Text(
          label,
          style: context.textTheme.titleMedium,
        ),
        hSizedBox15,
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          keyboardType: keyboardType,
          textAlign: center ? TextAlign.center : TextAlign.start,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: context.textTheme.labelLarge,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            filled: true,
            fillColor: context.colorScheme.onBackground,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colorScheme.onBackground,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.error, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.error, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
