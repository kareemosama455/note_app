import 'package:flutter/material.dart';
import 'package:note_app/layout/fab_button_layout.dart';
import 'package:note_app/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:note_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:note_app/modules/new_tasks/new_task_screen.dart';
import 'package:note_app/shared/components/constants.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [
    const NewTasksScreen(),
    const DoneTasksScreen(),
    const ArchiveTasksScreen()
  ];
  List<String> title = ['New Tasks', 'Done Tasks', 'Archived Tasks'];
  int currentIndex = 0;
  bool isBottomSheetyShown = false;
  IconData fabIcon = Icons.edit;
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController statusController = TextEditingController();
    
   
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        shadowColor: Colors.white,
        backgroundColor: Colors.purple,
        title: Text(
          title[currentIndex],
          style: const TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
      floatingActionButton: 
      const FabButtonLayout(),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline), label: 'Done'),
          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined), label: 'Archived')
        ],
      ),
      body:screens[currentIndex],
    );
  }
}
