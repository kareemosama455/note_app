import 'package:flutter/material.dart';
import 'package:note_app/shared/components/components.dart';
import 'package:note_app/shared/components/constants.dart';
import 'package:note_app/shared/network/local/database.dart';

class NewTasksScreen extends StatefulWidget {
  const NewTasksScreen({super.key});

  @override
  State<NewTasksScreen> createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  SqlDB sqlDB4 = SqlDB();

  Future readData() async {
    List<Map> response = await sqlDB4.readData('SELECT * FROM notes');
    tasks.addAll(response);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    readData();
    super.initState();
    print(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => buildtaskitem(tasks[index]),
      separatorBuilder: (BuildContext context, int index) =>
          Container(height: 0.5, width: double.infinity, color: Colors.grey),
      itemCount: tasks.length,
    );
  }
}
