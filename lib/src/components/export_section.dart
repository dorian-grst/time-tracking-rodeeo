import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/share/app_text_style.dart';
import 'package:flutter/material.dart';

const hSizedBox20 = SizedBox(height: 20);

class ExportSection extends StatefulWidget {
  const ExportSection({Key? key}) : super(key: key);

  @override
  _ExportSectionState createState() => _ExportSectionState();
}

class _ExportSectionState extends State<ExportSection> {
  bool _isExporting = false;

  void _startExport() {
    setState(() {
      _isExporting = true;
    });

    // Attendre 2 secondes puis réinitialiser l'état de l'export
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isExporting = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Exporter 🍃',
            style: AppTextStyle.title,
          ),
          const SizedBox(height: 20),
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
                      _isExporting ? Icons.download_done : Icons.download,
                      size: 100,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Text(
                    'Exporter les données',
                    style:
                        TextStyle(color: context.colorScheme.onSurface).merge(AppTextStyle.title),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 50),
                    child: SizedBox(
                      width: 250,
                      child: Text(
                        'Vous pouvez exporter vos données en fichier CSV.',
                        style: TextStyle(
                          color: context.colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!_isExporting) {
                        _startExport();
                      }
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
                      _isExporting ? 'Exporté !' : 'Exporter',
                      style: TextStyle(
                        color: context.colorScheme.onBackground,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
