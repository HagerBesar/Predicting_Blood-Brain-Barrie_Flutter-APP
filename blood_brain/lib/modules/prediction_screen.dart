import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<BrainCubit, BrainStates>(
    listener: (context, state) {},
    builder: (context, state) {
    var myCubit = BrainCubit.get(context);
    return myCubit.predictionScreen[myCubit.predictionIndex];

    });
  }

}
