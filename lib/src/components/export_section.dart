import 'dart:convert';
import 'dart:io';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

const hSizedBox20 = SizedBox(height: 20);

class ExportSection extends StatefulWidget {
  const ExportSection({Key? key}) : super(key: key);

  @override
  State<ExportSection> createState() => _ExportSectionState();
}

class _ExportSectionState extends State<ExportSection> {
  bool _isExporting = false;

  Future<void> startExport() async {
    setState(() {
      _isExporting = true;
    });

    List<Map<String, dynamic>> taskJsonList = [];
    for (var i = 0; i < taskBox.length; i++) {
      Task task = taskBox.getAt(i) as Task;
      taskJsonList.add(task.toMap());
    }
    String jsonStr = jsonEncode(taskJsonList);
    File('tasks.json')
        .writeAsString(jsonStr)
        .then((_) => debugPrint('Fichier JSON créé avec succès.'))
        .catchError((error) => debugPrint('Erreur lors de la création du fichier JSON : $error'));

    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'dorian.grasset.contact@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Export de mes tâches',
        'body': 'Voici le fichier JSON contenant mes tâches à la date du $formattedDate.',
        'attachments': 'tasks.json',
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
      // Attendre 2 secondes puis réinitialiser l'état de l'export
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isExporting = false;
        });
      });
    } else {
      throw Exception('Could not launch $emailUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Exporter 🍃',
            style: context.textTheme.titleLarge,
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
                    style: TextStyle(color: context.colorScheme.onSurface)
                        .merge(context.textTheme.titleLarge),
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
                        startExport();
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
                          const Size(200, 50)), // Modifier la largeur et la hauteur du bouton ici
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
