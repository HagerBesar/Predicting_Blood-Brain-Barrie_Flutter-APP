import 'package:blood_brain/modules/contact_screen.dart';
import 'package:blood_brain/modules/data_screen.dart';
import 'package:blood_brain/modules/feature_screen.dart';
import 'package:blood_brain/modules/home/home_screen.dart';
import 'package:blood_brain/modules/result_screen.dart';
import 'package:blood_brain/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/item_result_screen.dart';
import '../../modules/prediction_screen.dart';

class BrainCubit extends Cubit<BrainStates>{
  BrainCubit() : super(BrainInitialState());
  static BrainCubit get(context) => BlocProvider.of(context);


  ////LoginScreen
  bool isPassword = true;

  void changePasswordIcon(){
    isPassword = !isPassword;
    emit(ChangePassIconState());
  }

  ////LayoutScreen
  int currentIndex = 0;
  List<Widget> screens = [HomeScreen(), PredictionScreen(), ContactScreen()];

  List<String> barTitle = [
    'Home',
    'Prediction',
    'Contact',
  ];
  List<IconData> appBarIcons=[Icons.home_outlined,Icons.featured_play_list_outlined,Icons.perm_contact_calendar_outlined];

  void changeScreen(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  ////PredictionScreen
  int predictionIndex = 0;
  List<Widget> predictionScreen = [DataScreen(),FeatureScreen(), ResultScreen(),ItemResultScreen()];

  var id;
  void getItemScreen(index) {
    id = index;
    emit(GetItemState());
  }
   void changePredictScreen(index ) {
    predictionIndex = index;
    emit(ChangePredictionState());
  }
  ////DATA SCREEN
  bool isButtonSheetShow = false;
  IconData fabIcon = Icons.edit;

  void changeButtonIcon({required isShow, required icon}) {
    isButtonSheetShow = isShow;
    fabIcon = icon;
    emit(ChangeIconButtonState());
  }



  ////PredictionResultScreen
  // List<String> models=[];
  var finalResult='';
  var gbc='';
  var log='';
  var vot='';
  var svc='';
  var knn='';
  var blood='';

  void modelsResult(data){
    // models=(data["prediction"].toString()).replaceAll('.0', ' ');
    gbc=data["prediction"][0].replaceAll('.0', ' ');
    log=data["prediction"][1].replaceAll('.0', ' ');
    vot=data["prediction"][2].replaceAll('.0', ' ');
    svc=data["prediction"][3].replaceAll('.0', ' ');
    knn=data["prediction"][4].replaceAll('.0', ' ');
    finalResult=data["final_result"];
    blood=data['blood'];
    // emit(ModelsResultState());
  }
  bool load = false;
  void loading(value){
    load = value;
    emit(LoadingPredictionState());
  }


  ////Database
  late Database database;
  List<Map> newTasks = [];
  void createData() {
    openDatabase(
      'ToDo.db',
      version: 1,
      onCreate: (database, version) {
        database.execute(
            "CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, gbc TEXT, log TEXT, vot TEXT, svc TEXT, knn TEXT, result TEXT, blood TEXT) "
        ).then((value) {
          print('Table created');
        }).catchError((onError) {
          print('Create Error is : ${onError.toString()}');
        });
      },
      onOpen: (database){
        getData(database);


      },
    ).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  insert({
    required title,
    required date,
    required time,
    required gbc ,
    required log ,
    required vot ,
    required svc ,
    required knn ,
    required result ,
    required blood
  })async
  {
    await database.transaction((txn){
      return txn.rawInsert('INSERT INTO tasks (title, date, time, gbc, log , vot , svc , knn , result , blood  ) VALUES ("$title", "$date", "$time","$gbc", "$log" , "$vot" , "$svc" , "$knn" , "$result" , "$blood")'
      ).then((value) {
        print('insert $value done');
        emit(InsertDatabaseState());
        getData(database);

      }).catchError((onError) {
        print('Insert Error is : ${onError.toString()}');
      });

    });
  }
  void getData(database){
    newTasks = [];

    emit(GetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
          newTasks.add(element);
      });

      emit(GetDatabaseState());
    });
  }



  ////Dark mode
  bool isDark = false;

  void changeAppMode()
  {
    isDark = !isDark;
    emit(ChangeModeState());
  }
}