import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Windhair extends StatelessWidget {
  const Windhair({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
            decoration: BoxDecoration(
              color: context.colorScheme.secondary,
            ),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Lottie.asset(
                    'assets/animations/windhair.json',
                    width: 175,
                    fit: BoxFit.contain,
                    repeat: true,
                    animate: true,
                  ),
                ),
              ],
            )))
      ],
    );
  }
}
