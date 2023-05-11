import 'package:apprentissage/src/themes/rodeeo_theme.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:flutter/material.dart';

const kRadius = Radius.circular(25);

const kBorderRadius = BorderRadius.only(
  topLeft: kRadius,
  topRight: kRadius,
);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });
  final int selectedIndex;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    final aspects = [
      BottomNavbarAspect.calendar,
      BottomNavbarAspect.home,
      BottomNavbarAspect.download,
    ];
    return ClipRRect(
      borderRadius: kBorderRadius,
      child: SizedBox(
        height: 120,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: context.colorScheme.background,
          currentIndex: selectedIndex, // L'index de l'élément sélectionné
          onTap: onItemTapped, // Callback appelé lors du clic sur un élément
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
  download(icon: Icons.file_download, title: 'Exporter');

  final IconData icon;
  final String title;
  const BottomNavbarAspect({
    required this.title,
    required this.icon,
  });

  void onPressed() {
    print('pressed : $title');
  }
}
