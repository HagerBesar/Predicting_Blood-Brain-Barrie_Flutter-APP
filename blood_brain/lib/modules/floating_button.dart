import 'package:blood_brain/layout/brain_layout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/components.dart';
import '../shared/cubit/cubit.dart';

class FloatingButton extends StatefulWidget {
  final BrainCubit myCubit;
  FloatingButton({required this.myCubit});

  @override
  _FloatingButtonState createState() => _FloatingButtonState(myCubit: myCubit);
}

class _FloatingButtonState extends State<FloatingButton> {
  bool isButtonSheetShow = false;
  IconData fabIcon = Icons.edit;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  final BrainCubit myCubit;
  _FloatingButtonState({required this.myCubit});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
   dispose() {
    super.dispose();
    nameController.dispose();
    dateController.dispose();
    timeController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // child:Icon(Icons.add) ,
      onPressed: () {
        if (isButtonSheetShow) {
          if (formKey.currentState!.validate()) {
            setState(() {
              isButtonSheetShow = false;
              fabIcon = Icons.edit;
            });
            name = nameController.text;
            date = dateController.text;
            time = timeController.text;
            nameController.text = '';
            dateController.text = '';
            timeController.text = '';

            Navigator.pop(context);

            myCubit.changePredictScreen(1);
          }
        } else {
          BrainLayout.scaffoldKey.currentState!
              .showBottomSheet((context) => Container(
                    color: Colors.grey[100],
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'The value is empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(
                                Icons.title_sharp,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: dateController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'The value is empty';
                              }
                              return null;
                            },
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1))
                                  .then((value) {
                                dateController.text =
                                    DateFormat.yMMMMd().format(value!);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'DATE',
                              prefixIcon: Icon(
                                Icons.date_range,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: timeController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'The value is empty';
                              }
                              return null;
                            },
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                timeController.text =
                                    value!.format(context).toString();
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Time',
                              prefixIcon: Icon(
                                Icons.access_time,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .closed
              .then((value) {
            setState(() {
              isButtonSheetShow = false;
              fabIcon = Icons.edit;
            });
          });
          isButtonSheetShow = true;
          setState(() {
            fabIcon = Icons.add;
          });
        }
      },
      child: Icon(fabIcon),
    );
  }
}
