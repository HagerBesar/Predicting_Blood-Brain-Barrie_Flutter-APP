import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrainCubit, BrainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BrainCubit cubit = BrainCubit.get(context);
          // var data;
          // fetchData(url).then((value)
          // {
          //   data=value;
          //   data = jsonDecode(data);
          //   cubit.modelsResult(data);
          // });
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
                  '$name',
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
                  height: 15.0,
                ),
                DataTable(columns: [
                  DataColumn(label: Text('Model')),
                  DataColumn(label: Text('RESULT')),
                  DataColumn(label: Text('Accuracy')),
                ], rows: [
                  DataRow(cells: [
                    DataCell(Text('GBC MODEL')),
                    DataCell(textItem(value: '${cubit.gbc}')),
                    DataCell(Text('0.908')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('LOG MODEL')),
                    DataCell(textItem(value: '${cubit.log}')),
                    DataCell(Text('0.837')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('VOT MODEL')),
                    DataCell(textItem(value: '${cubit.vot}')),
                    DataCell(Text('0.85')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('SVC MODEL')),
                    DataCell(textItem(value: '${cubit.svc}')),
                    DataCell(Text('0.891')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('KNN MODEL')),
                    DataCell(textItem(value: '${cubit.knn}')),
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
                  ' ${cubit.finalResult}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  ' ${cubit.blood}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  height: 22.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      child: Container(
                          width: 140.0,
                          height: 45.0,
                          child: ElevatedButton(
                              onPressed: (){
                                cubit.insert(
                                    title: name,
                                    date: date,
                                    time: time,
                                    gbc: cubit.gbc,
                                    log: cubit.log,
                                    vot: cubit.vot,
                                    svc: cubit.svc,
                                    knn: cubit.knn,
                                    result: cubit.finalResult,
                                    blood: cubit.blood);

                                cubit.changePredictScreen(0);
                              },
                              child: Text('Save'))
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Container(
                        width: 140.0,
                        height: 45.0,
                        child: ElevatedButton(
                            onPressed: (){
                              cubit.changePredictScreen(0);
                            },
                            child: Text('Cancel'))
                    ),
                    SizedBox(
                      width: 25.0,
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
