import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee_app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:ieee_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:ieee_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:ieee_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens =
  [
    newTaskScreen(),
    doneTaskScreen(),
    archivedTaskScreen(),
  ];

  List<String> titles =
  [
    'New Tasks',
    'Completed Tasks',
    'Archived Tasks'
  ];
  late Database database;
  List<Map> newTasks = [];
  List<Map> completedTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() async
  {
    openDatabase(
      "todo_tasks.db",
      version: 1,
      onCreate: (database, version) async
      {
        print("database created");
        try{
          await database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, note TEXT, date TEXT, time TEXT, status TEXT)');
          print("Table create");
        }catch(error){
          print("error when creating table ${error.toString()}");
        }
      },
      onOpen: (database)
      {
        getDatabase(database);
        print("database opened");
      },

    ).then((value){
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertDatabase({required String title, required String note, required String date, required String time,}) async
  {
    await database.transaction((txn) async
    {
      try {
        var value = await txn.rawInsert('INSERT INTO tasks(title, note, date, time, status) VALUES("$title", "$note","$date", "$time", "new")');
        print("$value inserted Successfully");
        emit(AppInsertDatabaseState());

        getDatabase(database);

      } catch(error){
        print('Error when Inserting new record ${error.toString()}');
      }
    });
  }

  void getDatabase(database) async
  {
    newTasks = [];
    completedTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value){
      value.forEach((element) {
        if(element['status'] == 'new') {
          newTasks.add(element);
        }
        else if(element['status'] == 'Completed') {
          completedTasks.add(element);
        }
        else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetDatabaseState());
    });
  }

  void updateDatabase({required String status, required int id})
  {
    database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', '$id'],
    ).then((value){
      getDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteDatabase({required int id})
  {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value){
      getDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  bool isBottomSheet = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({required bool isShow, required IconData icon}){
    isBottomSheet = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }
}