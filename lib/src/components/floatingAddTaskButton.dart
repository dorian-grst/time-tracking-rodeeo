import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FloatingAddTaskButton extends StatelessWidget {
  const FloatingAddTaskButton({super.key, required this.tabIndex});
  final ValueNotifier<int> tabIndex;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: tabIndex,
      builder: (context, selectedIndex, child) {
        return Visibility(
          visible: selectedIndex == 0,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: const Color.fromRGBO(47, 147, 92, 1),
            foregroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        );
      },
    );
  }
}
