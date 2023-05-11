import 'package:apprentissage/src/components/customTextFormField%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FloatingAddTaskButton extends StatelessWidget {
  FloatingAddTaskButton({super.key, required this.tabIndex});
  final ValueNotifier<int> tabIndex;

  final taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: tabIndex,
      builder: (context, selectedIndex, child) {
        return Visibility(
          visible: selectedIndex == 0,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: const Color.fromRGBO(251, 250, 255, 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Nouvelle tâche 🍃',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            CustomTextField(
                              label: 'Intitulé',
                              hint: 'Code',
                              controller: taskNameController,
                            ),
                            CustomTextField(
                              label: 'Description',
                              hint: 'Correction de bug',
                              controller: taskNameController,
                            ),
                            CustomTextField(
                              label: 'Temps estimé sur la tache',
                              hint: '89 heures',
                              controller: taskNameController,
                            ),
                            CustomTextField(
                              label: 'Personne',
                              hint: 'Dorian',
                              controller: taskNameController,
                            ),
                            CustomTextField(
                              label: 'Tags',
                              hint: 'Front',
                              controller: taskNameController,
                            ),
                            CustomTextField(
                              label: 'Début',
                              hint: '23/05/2023',
                              controller: taskNameController,
                            ),
                            CustomTextField(
                              label: 'Fin',
                              hint: 'C29/05/2023ode',
                              controller: taskNameController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
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
