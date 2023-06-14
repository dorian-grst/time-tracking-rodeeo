import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/extensions/validator_extensions.dart';
import 'package:flutter/material.dart';

const wSizedBox12 = SizedBox(width: 12);
const hSizedBox25 = SizedBox(height: 25);

class ListViewCellDetailbox extends StatelessWidget {
  const ListViewCellDetailbox(
      {super.key,
      required this.data,
      required this.title,
      required this.icon,
      required this.color});
  final String data;
  final String title;
  final IconData icon;
  final Color color;

  List<TextSpan> formatText(BuildContext context, String data) {
    List<TextSpan> formattedText = [];
    for (int i = 0; i < data.length; i++) {
      final currentChar = data[i];

      if (isNumeric(currentChar)) {
        formattedText.add(
          TextSpan(
            text: currentChar,
            style: TextStyle(
              color: context.colorScheme.onSurface,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      } else if (isLetter(currentChar)) {
        formattedText.add(
          TextSpan(
            text: currentChar,
            style: TextStyle(
              color: context.colorScheme.onSurface,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      } else {
        formattedText.add(
          TextSpan(
            text: currentChar,
            style: TextStyle(
              color: context.colorScheme.onSurface,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }
    }
    return formattedText;
  }

  bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }

  bool isLetter(String? s) {
    if (s == null) {
      return false;
    }
    return ValidatorExtensions.isLetterDetailBox(s);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 180,
      decoration: BoxDecoration(
        color: context.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      icon,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                wSizedBox12,
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 13,
                      color: context.colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: RichText(
                text: TextSpan(
                  children: formatText(context, data),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
