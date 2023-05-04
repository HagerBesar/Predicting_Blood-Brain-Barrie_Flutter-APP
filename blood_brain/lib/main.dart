import 'package:blood_brain/layout/brain_layout.dart';
import 'package:blood_brain/shared/cubit/cubit.dart';
import 'package:blood_brain/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'modules/login_screen.dart';
import 'shared/blocObserver.dart';


void main() {

  BlocOverrides.runZoned(
        () {
      // Use cubits...
          runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BrainCubit()..createData(),
      child: BlocConsumer<BrainCubit, BrainStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BrainCubit.get(context);
            return MaterialApp(
              theme: ThemeData(
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  // bodyText2: TextStyle(
                  //   fontSize: 18.0,
                  //   fontWeight: FontWeight.w600,
                  //   color: Colors.black,
                  // ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.lightBlue,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('2b2d2e'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('2b2d2e'),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.lightBlue,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.lightBlue,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                  backgroundColor: HexColor('2b2d2e'),
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[300],
                  ),
                  bodyText2: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: LoginScreen(),
              debugShowCheckedModeBanner: false,
            );
          }),
    );




  }


}
