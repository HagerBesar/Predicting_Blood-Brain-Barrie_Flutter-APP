// ignore: must_be_immutable
import 'package:blood_brain/modules/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../modules/floating_button.dart';
import '../shared/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';
// import 'package:dispose/dispose.dart';

// ignore: must_be_immutable
class BrainLayout extends StatelessWidget {
  static var scaffoldKey = GlobalKey<ScaffoldState>();
  // var formKey = GlobalKey<FormState>();
  // var nameController = TextEditingController();
  // var dateController = TextEditingController();
  // var timeController = TextEditingController();
  // late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrainCubit, BrainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var myCubit = BrainCubit.get(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  myCubit.appBarIcons[myCubit.currentIndex],
                ),
                onPressed: () {},
              ),
              title: Text(myCubit.barTitle[myCubit.currentIndex]),
              actions: [
                IconButton(
                    onPressed: () {
                      myCubit.changeAppMode();
                    },
                    icon: Icon(
                      Icons.brightness_6_outlined,
                      size: 20.0,
                    )),

              ],
            ),
            body: myCubit.screens[myCubit.currentIndex],
            floatingActionButton: FloatingButton(myCubit: myCubit,),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_outlined),
                  label: 'Prediction',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contacts_outlined),
                  label: 'Contact',
                ),
              ],
              currentIndex: myCubit.currentIndex,
              onTap: (index) {
                myCubit.changeScreen(index);
              },
            ),
          );
        });
  }


}

