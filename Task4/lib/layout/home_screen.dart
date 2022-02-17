import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee_app/shared/components/components.dart';
import 'package:ieee_app/shared/cubit/cubit.dart';
import 'package:ieee_app/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';



class HomeLayout extends StatelessWidget
{
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state){
          if(state is AppInsertDatabaseState){
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title:  Text(
                cubit.titles[cubit.currentIndex],
              ),
              centerTitle: true,
              backgroundColor: Color.fromARGB(255,71,80,230),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Color.fromARGB(255,71,80,230),
              onPressed: () {
                if(cubit.isBottomSheet)
                {
                  if(formKey.currentState!.validate()){
                    cubit.insertDatabase(title: titleController.text, note: noteController.text, date: dateController.text, time: timeController.text);
                  }
                }
                else {
                  scaffoldKey.currentState!.showBottomSheet(
                        (context) =>
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(controller: titleController,
                                    inputType: TextInputType.text,
                                    validate: (value) {
                                      if (value != null && value.isEmpty) {
                                        return "Title mustn't be empty";
                                      }
                                      return null;
                                    },
                                    label: "Task Title",
                                    prefix: Icons.title),
                                const SizedBox(height: 20.0,),
                                defaultFormField(controller: noteController,
                                    inputType: TextInputType.text,
                                    validate: (value) {
                                      if (value != null && value.isEmpty) {
                                        return "Note mustn't be empty";
                                      }
                                      return null;
                                    },
                                    label: "Note",
                                    prefix: Icons.note),
                                const SizedBox(height: 20.0,),
                                defaultFormField(controller: timeController,
                                    inputType: TextInputType.datetime,
                                    onTap: () async
                                    {
                                      try {
                                        TimeOfDay? value = await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now());
                                        timeController.text =
                                            value!.format(context);
                                        print(value.format(context));
                                      } catch (error) {
                                        print("Error is ${error.toString()}");
                                      }
                                    },
                                    validate: (value) {
                                      if (value != null && value.isEmpty) {
                                        return "Title mustn't be empty";
                                      }
                                      return null;
                                    },
                                    label: "Task Time",
                                    prefix: Icons.watch_later_sharp),
                                const SizedBox(height: 20.0,),
                                defaultFormField(controller: dateController,
                                    inputType: TextInputType.datetime,
                                    onTap: () async
                                    {
                                      try {
                                        var value = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.parse(
                                                "2022-03-16"));
                                        print(
                                            DateFormat.yMMMd().format(value!));
                                        dateController.text =
                                            DateFormat.yMMMd().format(value);
                                      } catch (error) {
                                        print("Error is ${error.toString()}");
                                      }
                                    },
                                    validate: (value) {
                                      if (value != null && value.isEmpty) {
                                        return "Date mustn't be empty";
                                      }
                                      return null;
                                    },
                                    label: "Task Date",
                                    prefix: Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                    elevation: 20.0,
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);

                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notes,
                  ),
                  label: "New Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check,
                  ),
                  label: "Completed Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: "Archived Tasks",
                ),
              ],
            ),
            body: state is AppGetDatabaseLoadingState? Center(child: CircularProgressIndicator()) : cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }

}
