import 'package:apprentissage/src/themes/theme_provider.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const kRadius = Radius.circular(25);

const kBorderRadius = BorderRadius.only(
  topLeft: kRadius,
  topRight: kRadius,
);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  ValueNotifier<bool> isDarkModeNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final aspects = [
      BottomNavbarAspect.calendar,
      BottomNavbarAspect.home,
      BottomNavbarAspect.download,
      BottomNavbarAspect.parameter,
    ];
    return ClipRRect(
      borderRadius: kBorderRadius,
      child: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: context.colorScheme.onBackground,
          selectedItemColor: context.colorScheme.onSurface,
          unselectedItemColor: context.colorScheme.surface,
          currentIndex: widget.selectedIndex,
          onTap: (index) {
            widget.onItemTapped(index);
          },
          items: aspects.map((aspect) {
            return BottomNavigationBarItem(
              icon: Icon(aspect.icon),
              label: aspect.title,
            );
          }).toList(growable: false),
        ),
      ),
    );
  }
}

enum BottomNavbarAspect {
  calendar(icon: Icons.calendar_today, title: 'Calendrier'),
  home(icon: Icons.home, title: 'Accueil'),
  download(icon: Icons.file_download, title: 'Exporter'),
  parameter(icon: Icons.settings, title: 'Paramètres');

  final IconData icon;
  final String title;

  const BottomNavbarAspect({
    required this.title,
    required this.icon,
  });
}
