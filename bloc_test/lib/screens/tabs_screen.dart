import 'package:bloc_test/screens/completed_tasks_screen.dart';
import 'package:bloc_test/screens/favorite_tasks_screen.dart';
import 'package:bloc_test/screens/pending_screen.dart';
import 'package:flutter/material.dart';

import 'add_task_screen.dart';
import 'my_drawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({super.key});

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': FavoriteTasksScreen(), 'title': 'Favorite Tasks'},
    {'pageName': CompletedTasksScreen(), 'title': 'Compeleted Tasks'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AddTaskScreen(),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Pending Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorited Task')
        ],
      ),
    );
  }
}
