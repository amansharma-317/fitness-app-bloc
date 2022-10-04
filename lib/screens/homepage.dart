import 'package:fitness_app/bloc/app_bloc.dart';
import 'package:fitness_app/model/task.dart';
import 'package:fitness_app/services/tasks.dart';
import 'package:fitness_app/tasks/bloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> words = ['Pizza', ]
  List<String> savedWords = List<String>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Fitness App'),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider<AppBloc>(
                create: (BuildContext context) => AppBloc(),
              ),
              BlocProvider<TaskBloc>(
                create: (BuildContext context) => TaskBloc(RepositoryProvider.of<TasksService>(context))..add(EventLoadTasks()),
              ),
            ],
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Activity List'),
                      Spacer(),
                      Icon(Icons.question_mark_outlined),
                    ],
                  ),
                  BlocBuilder<TaskBloc, TaskState>(
                      builder: (context, state) {
                        if(state is TaskInitial) {
                          return Container(child: Text('TaskInitial'));
                        } else if(state is TaskLoadedState){
                          return ListView(
                            children: state.tasks.map((e) => ListTile(
                              title: Text(e.task),
                              trailing: Checkbox(value: e.completed, onChanged: (val) {}),
                            )).toList(),
                          );
                        } else if(state is TaskLoading){
                          return Text('TaskLoading state');
                        } else if(state is TaskLoadingError){
                          return Text(state.error);
                        } else {
                          return Text('Nope!');
                        }
                      },
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}


