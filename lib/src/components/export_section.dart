import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_mailer/flutter_mailer.dart';

const hSizedBox20 = SizedBox(height: 20);

class ExportSection extends StatefulWidget {
  const ExportSection({Key? key}) : super(key: key);

  @override
  State<ExportSection> createState() => _ExportSectionState();
}

class _ExportSectionState extends State<ExportSection> {
  bool _isExporting = false;
  Timer? _setStateTimer;

  @override
  void dispose() {
    _setStateTimer?.cancel();
    super.dispose();
  }

  Future<void> startExport() async {
    final Directory tempDir = await getTemporaryDirectory();

    List<Map<String, dynamic>> taskJsonList = [];
    for (final task in taskBox.values) {
      taskJsonList.add(task.toMap());
    }
    String filePath = '${tempDir.path}/tasks.json';
    String jsonStr = jsonEncode(taskJsonList);
    var file = File(filePath);
    await file.writeAsString(jsonStr);

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);

    final MailOptions mailOptions = MailOptions(
      subject: 'Export de mes tâches',
      body: 'Voici le fichier JSON contenant mes tâches à la date du $formattedDate.',
      recipients: [],
      isHTML: false,
      attachments: [filePath],
    );

    try {
      await FlutterMailer.send(mailOptions);
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    } catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Erreur d\'envoi'),
              content: const Text('Une erreur s\'est produite lors de l\'envoi de l\'e-mail.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    _setStateTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    });
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
