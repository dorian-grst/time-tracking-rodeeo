import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/share/app_text_style.dart';
import 'package:apprentissage/src/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const hSizedBox20 = SizedBox(height: 20);

class ParameterSection extends StatelessWidget {
  const ParameterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paramètres 🍃',
            style: context.textTheme.titleLarge,
          ),
          hSizedBox20,
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 50),
                    child: Icon(
                      size: 100,
                      themeProvider.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                      color: context.colorScheme.secondary, // Ajoutez la couleur souhaitée ici
                    ),
                  ),
                  Text('Changez de thème',
                      style: TextStyle(color: context.colorScheme.onSurface)
                          .merge(AppTextStyle.title)),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 50),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        'Vous pouvez changer le thème de l\'interface de l\'application.',
                        style: TextStyle(
                          color: context.colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      themeProvider.toggleTheme();
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(context.colorScheme.onSurface),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(
                          Size(200, 50)), // Modifier la largeur et la hauteur du bouton ici
                    ),
                    child: Text(
                      themeProvider.isDarkMode ? 'Light Theme' : 'Dark Theme',
                      style: TextStyle(
                        color: context.colorScheme.onBackground,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
