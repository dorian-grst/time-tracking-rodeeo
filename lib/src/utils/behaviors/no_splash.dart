import 'package:flutter/material.dart';

/// cf https://stackoverflow.com/questions/73726428/how-to-disable-dragging-down-from-buttom-in-this-list-view
/// change list view behavior

class NoSplash extends StatelessWidget {
  const NoSplash(this.child, {super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: child);
  }
}
