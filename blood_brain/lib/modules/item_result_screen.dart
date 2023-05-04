import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class ItemResultScreen extends StatelessWidget {
  // const ItemResultScreen(id, {Key? key}) : super(key: key);
  // final int id;
  // ItemResultScreen({required this.id})
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<BrainCubit, BrainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BrainCubit cubit = BrainCubit.get(context);
          // List<Map> allTasks= cubit.newTasks;
          Map task= cubit.newTasks[cubit.id];

          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Center(
                    child: Text(
                      'Prediction Result',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 30,
                      ),
                    )),
                SizedBox(
                  height: 15.0,
                ),
                Center(
                    child: Text(
                      '${task['title']}',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 25,
                      ),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 35.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadiusDirectional.circular(8.0)),
                  child: Row(
                    children: [
                      Text('Active(1) = Blood Pass',
                          style: TextStyle(
                            color: Colors.lightBlue,
                          )),
                      SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: Text('Not Active(2) = Blood Not Pass',
                              style: TextStyle(
                                color: Colors.lightBlue,
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                DataTable(columns: [
                  DataColumn(label: Text('Model')),
                  DataColumn(label: Text('RESULT')),
                  DataColumn(label: Text('Accuracy')),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('GBC MODEL')),
                    DataCell(textItem(value: '${task['gbc']}')),
                    DataCell(Text('0.908')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('LOG MODEL')),
                    DataCell(textItem(value: '${task['log']}')),
                    DataCell(Text('0.837')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('VOT MODEL')),
                    DataCell(textItem(value: '${task['vot']}')),
                    DataCell(Text('0.85')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('SVC MODEL')),
                    DataCell(textItem(value: '${task['svc']}')),
                    DataCell(Text('0.891')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('KNN MODEL')),
                    DataCell(textItem(value: '${task['knn']}')),
                    DataCell(Text('0.901')),
                  ]),
                ]),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.grey[300],
                  width: double.infinity,
                  height: 1.0,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  ' ${task['result']}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  ' ${task['blood']}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                    width: 140.0,
                    height: 45.0,
                    child: ElevatedButton(
                        onPressed: (){
                          cubit.changePredictScreen(0);
                        },
                        child: Text('Done'))
                ),
              ],
            ),
          );
        });
  }
}
