import 'package:apprentissage/src/components/action_button.dart';
import 'package:apprentissage/src/components/edit_task_newcontainer.dart';
import 'package:apprentissage/src/components/edit_task_form.dart';
import 'package:apprentissage/src/components/edit_task_addbutton.dart';
import 'package:apprentissage/src/extensions/validator_extensions.dart';
import 'package:apprentissage/src/hive/boxes.dart';
import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/task_state.dart';
import 'package:apprentissage/src/utils/extensions/build_context_ext.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const wSizedBox10 = SizedBox(width: 10);
const hSizedBox10 = SizedBox(height: 10);
const hSizedBox30 = SizedBox(height: 30);

class EditTaskView extends StatefulWidget {
  const EditTaskView({
    super.key,
    required this.task,
    required this.onFinishEditingTask,
    this.createMode = true,
  });
  final bool createMode;
  final void Function(Task?) onFinishEditingTask;
  final Task task;

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  late final TextEditingController taskNameController;
  late final TextEditingController taskDescriptionController;
  late final TextEditingController taskTimeController;
  late final TextEditingController taskPersonController;
  late final TextEditingController taskTagsController;
  late final TextEditingController taskStartDateController;
  late final TextEditingController taskEndDateController;

  bool areFieldsFilled = true;
  bool isTimeValid = true;
  bool isDateValid = true;
  bool isPersonFieldFilled = false;
  bool isTagFieldFilled = false;
  List<Tag> personList = [];
  List<Tag> tagList = [];
  bool isDateLogical = true;
  bool isEndDateValid = true;
  bool isStartDateValid = true;

  TextEditingController createAndAddListener(String text, VoidCallback listener) {
    TextEditingController controller = TextEditingController(text: text);
    controller.addListener(listener);
    return controller;
  }

  @override
  void initState() {
    super.initState();
    taskNameController = createAndAddListener(widget.task.name, () => updateFieldsFilledState());
    taskDescriptionController =
        createAndAddListener(widget.task.description, () => updateFieldsFilledState());
    taskTimeController =
        createAndAddListener(widget.task.timePrevision, () => updateFieldsFilledState());
    taskStartDateController =
        createAndAddListener(widget.task.startDate, () => updateFieldsFilledState());
    taskEndDateController =
        createAndAddListener(widget.task.endDate, () => updateFieldsFilledState());
    taskPersonController = createAndAddListener('', () => updatePersonFieldState());
    taskTagsController = createAndAddListener('', () => updateTagFieldState());
    areFieldsFilled = isFieldsNotEmpty();
    //Boxes.getTags().values.whereType<Tag>().toList();
    personList.addAll(widget.task.participants);
    tagList.addAll(widget.task.tags);
  }

  @override
  void dispose() {
    List<TextEditingController> textControllers = [
      taskDescriptionController,
      taskNameController,
      taskTimeController,
      taskStartDateController,
      taskEndDateController,
    ];

    for (TextEditingController controller in textControllers) {
      controller.removeListener(updateFieldsFilledState);
      controller.dispose();
    }

    taskPersonController.removeListener(updatePersonFieldState);
    taskTagsController.removeListener(updateTagFieldState);

    super.dispose();
  }

  bool isFieldsNotEmpty() {
    return taskDescriptionController.text.isNotEmpty &&
        taskNameController.text.isNotEmpty &&
        taskTimeController.text.isNotEmpty &&
        taskStartDateController.text.isNotEmpty &&
        taskEndDateController.text.isNotEmpty;
  }

  void updateFieldsFilledState() {
    final isNotEmpty = isFieldsNotEmpty();
    final isTimeValid = taskTimeController.text.validateTimeFormat == null;
    final isStartDateValid = taskStartDateController.text.validateDateFormat == null;
    final isEndDateValid = taskEndDateController.text.validateDateFormat == null;

    final startDateText = taskStartDateController.text;
    final endDateText = taskEndDateController.text;

    DateTime? startDate;
    DateTime? endDate;
    bool isDateLogical = true;

    if (isStartDateValid) {
      startDate = DateFormat('dd/MM/yyyy').parse(startDateText, true);
    }

    if (isEndDateValid) {
      endDate = DateFormat('dd/MM/yyyy').parse(endDateText, true);
    }

    if (startDate != null && endDate != null) {
      if (startDate.isAfter(endDate)) {
        isDateLogical = false;
      }
    }

    if (isNotEmpty != areFieldsFilled ||
        isTimeValid != this.isTimeValid ||
        isStartDateValid != this.isStartDateValid ||
        isEndDateValid != this.isEndDateValid ||
        isDateLogical != this.isDateLogical) {
      setState(() {
        areFieldsFilled = isNotEmpty;
        this.isTimeValid = isTimeValid;
        this.isStartDateValid = isStartDateValid;
        this.isEndDateValid = isEndDateValid;
        this.isDateLogical = isDateLogical;
      });
    }
  }

  void updatePersonFieldState() {
    setState(() {
      isPersonFieldFilled = taskPersonController.text.isNotEmpty;
    });
  }

  void updateTagFieldState() {
    setState(() {
      isTagFieldFilled = taskTagsController.text.isNotEmpty;
    });
  }

  void addPersonButtonPressed() {
    setState(() {
      personList.add(Tag.participant(
        nameTag: taskPersonController.text,
      ));
      taskPersonController.clear();
      isPersonFieldFilled = false;
      // ignore: avoid_print
      print(personList);
    });
  }

  void addTagButtonPressed() {
    setState(() {
      tagList.add(Tag.label(
        nameTag: taskTagsController.text,
      ));
      taskTagsController.clear();
      isTagFieldFilled = false;
      // ignore: avoid_print
      print(tagList);
    });
  }

  void removePersonButtonPressed(Tag person) {
    setState(() {
      personList.remove(person);
      // ignore: avoid_print
      print(personList);
    });
  }

  void removeTagButtonPressed(Tag tag) {
    setState(() {
      tagList.remove(tag);
      // ignore: avoid_print
      print(tagList);
    });
  }

  // void onPressed() {
  //   if (areFieldsFilled && isTimeValid && isStartDateValid && isDateLogical) {
  //     final newTask = widget.task.copyWith(
  //       name: taskNameController.text,
  //       timePrevision: taskTimeController.text,
  //       startDate: taskStartDateController.text,
  //       endDate: taskEndDateController.text,
  //       description: taskDescriptionController.text,
  //       participants: personList,
  //       tags: tagList,
  //     );
  //     Navigator.of(context).pop(newTask);
  //   }
  // }

  void onPressed() {
    if (areFieldsFilled && isTimeValid && isStartDateValid && isDateLogical) {
      setState(
        () {
          final newTask = Task(
            name: taskNameController.text,
            timePrevision: taskTimeController.text,
            timeSpent: '0h',
            startDate: taskStartDateController.text,
            endDate: taskEndDateController.text,
            doneSubtasks: '0',
            globalAdvancement: '0%',
            description: taskDescriptionController.text,
            participants: personList,
            tags: tagList,
            state: TaskState.notStarted,
            durationSecond: 0,
            activityStartedAt: 0,
          );
          if (widget.createMode) {
            taskBox.add(
              newTask,
            );
          } else {
            taskBox.put(
              widget.task.key,
              newTask,
            );
          }
        },
      );
      Navigator.of(context).pop();
      debugPrint(personList.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor = areFieldsFilled && isTimeValid && isStartDateValid && isDateLogical
        ? context.colorScheme.primary
        : context.colorScheme.errorContainer;
    Color buttonText = areFieldsFilled && isTimeValid && isStartDateValid && isDateLogical
        ? context.colorScheme.onPrimary
        : context.colorScheme.background;
    return ListView(
      children: [
        Text(
          widget.createMode ? 'Nouvelle tâche 🍃' : 'Modifier la tâche 🍃',
          style: context.textTheme.titleLarge,
        ),
        EditTaskForm(
          keyboardType: TextInputType.text,
          center: false,
          label: 'Intitulé',
          hint: 'Code',
          controller: taskNameController,
        ),
        EditTaskForm(
          keyboardType: TextInputType.text,
          center: false,
          label: 'Description',
          hint: 'Correction de bug',
          controller: taskDescriptionController,
        ),
        EditTaskForm(
          validator: (value) => value?.validateTimeFormat,
          keyboardType: TextInputType.text,
          center: false,
          label: 'Temps estimé sur la tache',
          hint: '89h30',
          controller: taskTimeController,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: EditTaskForm(
                keyboardType: TextInputType.text,
                center: false,
                label: 'Personne(s)',
                hint: 'Dorian',
                controller: taskPersonController,
              ),
            ),
            wSizedBox10,
            EditTaskAddButton(
              onPressed: isPersonFieldFilled ? addPersonButtonPressed : null,
              isEnabled: isPersonFieldFilled,
            ),
          ],
        ),
        Column(
          children: personList
              .map(
                (person) => Row(
                  children: [
                    EditTaskNewcontainer(
                        label: person.nameTag, onPressed: () => removePersonButtonPressed(person)),
                  ],
                ),
              )
              .toList(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: EditTaskForm(
                keyboardType: TextInputType.text,
                center: false,
                label: 'Tag(s)',
                hint: 'Front',
                controller: taskTagsController,
              ),
            ),
            wSizedBox10,
            EditTaskAddButton(
              onPressed: isTagFieldFilled ? addTagButtonPressed : null,
              isEnabled: isTagFieldFilled,
            ),
          ],
        ),
        Column(
          children: tagList
              .map(
                (tag) => Row(
                  children: [
                    EditTaskNewcontainer(
                        label: tag.nameTag, onPressed: () => removeTagButtonPressed(tag)),
                  ],
                ),
              )
              .toList(),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: EditTaskForm(
                    validator: (value) => value?.validateDateFormat,
                    keyboardType: TextInputType.datetime,
                    center: false,
                    label: 'Début',
                    hint: '23/05/23',
                    controller: taskStartDateController,
                  ),
                ),
                wSizedBox10,
                Flexible(
                  child: EditTaskForm(
                    validator: (value) => value?.validateDateFormat,
                    keyboardType: TextInputType.datetime,
                    center: false,
                    label: 'Fin',
                    hint: '29/05/23',
                    controller: taskEndDateController,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 7, bottom: 10),
              child: Row(
                children: [
                  if (!isDateLogical)
                    Text(
                      'La date de fin doit être postérieure à la date de début',
                      style: TextStyle(
                        color: context.colorScheme.error,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
        hSizedBox10,
        ActionButton(
            textColor: buttonText,
            backgroundColor: buttonColor,
            text: widget.createMode ? 'Créer la tâche' : 'Modifier la tâche',
            onPressed: onPressed),
        hSizedBox30,
      ],
    );
  }
}
