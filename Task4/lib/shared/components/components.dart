import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ieee_app/shared/cubit/cubit.dart';

Widget defaultFormField({
  void Function()? suffixPressed,
  required TextEditingController controller,
  required TextInputType inputType,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  void Function()? onTap,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  bool isSuffix = false,
  void Function()? onPressed,
})
=> TextFormField(
  controller: controller,
  keyboardType: inputType,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator:validate,
  onTap: onTap,
  obscureText: isPassword,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? IconButton(
      onPressed: suffixPressed,
      icon: Icon(suffix,),
    ) : null,
    border: OutlineInputBorder(),
  ),
);

Widget buildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(
    padding: const EdgeInsetsDirectional.only(
      top: 15.0,
      start: 20.0,
      end: 20.0,
    ),
    child: Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color.fromARGB(255,255,174,60),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${model['title']}",
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.0,),
                    Text(
                      "${model['time']}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0,),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5.0,),
                    Text(
                      "${model['date']}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0,),
                Text(
                  "${model['note']}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              MaterialButton(
                onPressed: ()
                {
                  AppCubit.get(context).updateDatabase(status: 'Completed', id: model['id']);
                },
                color: Color.fromARGB(255,71,80,230),
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              MaterialButton(
                onPressed: ()
                {
                  AppCubit.get(context).updateDatabase(status: 'Archived', id: model['id']);
                },
                color: Color.fromARGB(255,71,80,230),
                child: Text(
                  'Archive',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ),
  onDismissed: (direction){
    AppCubit.get(context).deleteDatabase(id: model['id']);
  },
);

Widget tasksBuilder({required List<Map> tasks}) => tasks.length > 0? ListView.separated(
    itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
    separatorBuilder: (context, index) => SizedBox(height: 2.0,),
    itemCount: tasks.length
) : Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Icon(
        Icons.menu,
        color: Colors.grey,
        size: 100.0,
      ),
      SizedBox(height: 5.0,),
      Text(
        "No Tasks Yet, Please enter New Tasks",
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey
        ),
      )
    ],
  ),
);