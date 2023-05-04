import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../layout/brain_layout.dart';
import '../shared/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

// ignore: must_be_immutable
class DataScreen extends StatelessWidget {
  // const DataScreen({Key? key}) : super(key: key);
  // var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrainCubit, BrainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BrainCubit cubit = BrainCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: tasksBuilder(cubit.newTasks, context),
          );
        });
  }
}
