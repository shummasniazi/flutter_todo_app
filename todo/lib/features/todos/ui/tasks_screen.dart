import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../authentication/models/request/task.dart';
import '../todos_bloc/todos_bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController titleController = TextEditingController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodosBloc>(context)
        .add(LoadTodosEvent(10, currentPage * 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              BlocProvider.of<TodosBloc>(context).add(LoadRandomTodoEvent());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TodosBloc, TodosState>(
              builder: (context, state) {
                if (state is TodosLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TodosLoaded) {
                  return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return ListTile(
                        title: Text(task.title),
                        trailing: Checkbox(
                          value: task.completed,
                          onChanged: (value) {
                            BlocProvider.of<TodosBloc>(context).add(
                              UpdateTodoEvent(
                                  task.id, task..completed = value!),
                            );
                          },
                        ),
                        onTap: () {
                          // Handle edit task
                        },
                        onLongPress: () {
                          BlocProvider.of<TodosBloc>(context)
                              .add(DeleteTodoEvent(task.id));
                        },
                      );
                    },
                  );
                } else if (state is TodosError) {
                  return Center(
                      child: Text(state.message,
                          style: const TextStyle(color: Colors.red)));
                } else if (state is TodoLoaded) {
                  return ListTile(
                    title: Text(state.task.title),
                    trailing: Checkbox(
                      value: state.task.completed,
                      onChanged: (value) {
                        BlocProvider.of<TodosBloc>(context).add(
                          UpdateTodoEvent(
                              state.task.id, state.task..completed = value!),
                        );
                      },
                    ),
                    onTap: () {
                      // Handle edit task
                    },
                    onLongPress: () {
                      BlocProvider.of<TodosBloc>(context)
                          .add(DeleteTodoEvent(state.task.id));
                    },
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Task Title'),
                  ),
                ),
                SizedBox(width: 8.w),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      final task = Task(
                          id: 0,
                          title: titleController.text,
                          completed: false,
                          userId: 1);
                      BlocProvider.of<TodosBloc>(context)
                          .add(AddTodoEvent(task));
                      titleController.clear();
                    }
                  },
                  child: const Text('Add Task'),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentPage++;
            BlocProvider.of<TodosBloc>(context)
                .add(LoadTodosEvent(10, currentPage * 10));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
