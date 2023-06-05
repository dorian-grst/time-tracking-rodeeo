import 'package:apprentissage/src/components/list_view_cell.dart';
import 'package:apprentissage/src/components/tag_view.dart';
import 'package:apprentissage/src/extensions/context_extension.dart';
import 'package:apprentissage/src/hive/tag.dart';
import 'package:apprentissage/src/hive/task.dart';
import 'package:flutter/material.dart';

class ListViewCellCard extends StatelessWidget {
  const ListViewCellCard({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: context.colorScheme.onBackground,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 17,
            left: 17,
            top: 15,
            bottom: 15,
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.colorScheme.primary,
                              child: Icon(
                                Icons.computer,
                                color: context.colorScheme.onBackground,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        wSizedBox15,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Wrap(
                              children: [
                                TagView(tag: Tag.participant(
                                  nameTag: task.participants.isEmpty
                                      ? 'Aucun participant'
                                      : task.participants[0].nameTag,
                                )),
                                if (task.participants.length > 1) ...[
                                  wSizedBox5,
                                  TagView(tag: Tag.participant(
                                  nameTag: '...',
                                )),
                                ],
                                wSizedBox5,
                                TagView(tag: Tag.label(
                                  nameTag: task.tags.isEmpty ? 'Aucun tag' : task.tags[0].nameTag,
                                )),
                                if (task.tags.length > 1) ...[
                                  wSizedBox5,
                                  TagView(tag: Tag.label(
                                  nameTag: '...',
                                )),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              wSizedBox10,
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_outward,
                      color: context.colorScheme.onSurface,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
