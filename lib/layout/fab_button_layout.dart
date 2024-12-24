import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/shared/components/components.dart';
import 'package:note_app/shared/components/constants.dart';
import 'package:note_app/shared/network/local/database.dart';

class FabButtonLayout extends StatefulWidget {
  const FabButtonLayout({super.key});

  @override
  State<FabButtonLayout> createState() => _FabButtonLayoutState();
}

class _FabButtonLayoutState extends State<FabButtonLayout> {
  SqlDB sqlDB = SqlDB();
   TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  bool isBottomSheetyShown = false;
  IconData fabIcon = Icons.edit;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          if (isBottomSheetyShown) {
            sqlDB
                .insertData('''INSERT INTO notes("title","date","time","status")
            VALUES ('$titleController','$dateController','$timeController','$statusController')''');
            print('data inserted');
            Navigator.pop(context);
            isBottomSheetyShown = false;
            setState(() {
              fabIcon = Icons.edit;
            });
          } else {
            scaffoldKey.currentState?.showBottomSheet((context) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    defaultformfield(
                      controller: titleController,
                      type: TextInputType.text,
                      hinttext: 'Task Title',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultformfield(
                        controller: timeController,
                        type: TextInputType.datetime,
                        hinttext: 'Task Time',
                        ontap: () => showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now())
                                .then((onValue) {
                              timeController.text =
                                  onValue!.format(context).toString();
                              print(onValue.format(context).toString());
                            })),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultformfield(
                        controller: dateController,
                        type: TextInputType.datetime,
                        hinttext: 'Task Date',
                        ontap: () => showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2024-12-12'))
                                .then((onValue) {
                              dateController.text =
                                  DateFormat.yMMMd().format(onValue!);
                              print(DateFormat.yMMMd().format(onValue));
                            })),
                    const SizedBox(
                      height: 5,
                    ),
                    defaultformfield(
                        controller: statusController,
                        type: TextInputType.text,
                        hinttext: 'Task Status')
                  ],
                ));
            isBottomSheetyShown = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(fabIcon),
      );
  }
}
