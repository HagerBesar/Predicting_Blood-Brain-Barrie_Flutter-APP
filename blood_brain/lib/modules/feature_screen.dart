import 'dart:convert';

import 'package:blood_brain/modules/prediction_screen.dart';
import 'package:blood_brain/modules/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/components.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

// ignore: must_be_immutable
class FeatureScreen extends StatelessWidget {
  var formFeatureKey = GlobalKey<FormState>();
  var data;

  String url = '';
  List<List> featuresName =
  [['x1', 'pmv1'], ['x2', 'pmv2'], ['x3', 'pmv3'], ['x4', 'pmv4'], ['x5', 'pmv5'], ['LUMO', 'HOMO'], ['GapHL', 'Dipole_Moment'],
    ['ASA', 'a_aro'], ['a_count', 'a_heavy'], ['balabanJ', 'chi0'], ['KierFlex', 'lip_acc'], ['lip_don', 'logS'], ['mr', 'rings'],
    ['vdw_area', 'vdw_vol'], ['Weight', 'weinerPath'], ['weinerPol', 'zagreb'], ['apol', 'bpol'], ['McGowan_Volume', 'PetitjeanNumber'],
    ['CPCM1', 'CPCM2'], ['CPCM3', 'CPCM4'], ['CPCM5', 'SMD1'], ['SMD2', 'SMD3'], ['SMD4', 'SMD5']];

  List<List> featuresValue1_1 =
  [[37.9795837, 169.997406], [52.71661, 404.245483], [139.412445, 140.044617], [4.29764366, 292.944], [28.0230923, 170.786041],
    [-0.05165, -0.45777], [-11.05117499, 0], [259.09637, 0], [8, 8], [4.0203915, 7], [3.0993681, 0], [0, -2.6396999], [1.992434, 0],
    [115.88725, 107.23528], [170.92, 58], [9, 38], [10.108, 5.652], [0.706, 0.333333333], [-17.95679188, -17.65209769],
    [-17.65824341, -18.07708874], [-18.17377111, -18.63016551], [-17.90294279, -17.7271889], [-18.05194319, -13.80553872]];

  List<List> featuresValue1_2=[[88.6448746,447.137421],[91.9254227,942.184082],[394.358002,416.518616],[-2.29801702,494.787903],
    [63.2734833,446.738617],[-0.00138,-0.31809],[-8.618185836,4.0065],[562.79694,6],[44,20],[1.856899,14.53517],
    [4.2544293,4],[2,-2.39977],[8.0578222,2],[303.1651,403.15671],[276.38,862],[28,98],[47.967032,29.834968],[2.2908,0.5],
    [-248.7238915,-246.5759905],[-246.6181585,-249.606254],[-250.3307291,-256.6121917],[-253.5165459,-253.1464084],
    [-255.8830825,-252.155303]];
  List<List> featuresValue1_3=[[91.4142075,479.836212],[79.8553467,956.378906],[430.847443,464.662506],[-7.52304173,427.277924],
    [67.181778,482.856262],[0.02621,-0.36869],[-10.74586084,4.0896],[534.72583,0],[56,24],[1.6586603,17.275656],[3.5558493,3],
    [1,-4.1265802],[9.3630695,4],[325.12802,482.20435],[332.48398,1149],[51,142],[60.703376,36.898624],[2.7232,0.454545455],
    [-326.1865594,-323.85471],[-323.899875,-327.163978],[-327.9755559,-332.4652109],[-329.9070016,-329.5322144],
    [-333.7302536,-329.8516851]];

  List<List> featuresValue0=[[100.536804,503.627777],[106.788132,1054.31079],[444.594971,469.344208],[-1.62798262,562.08551],
    [68.5013046,501.555145],[0.00382,-0.3331],[-9.168132272,3.0414],[590.35345,6],[45,25],[1.5508246,18.353006],[4.0171709,7],
    [2,-3.82217],[9.3457937,3],[349.49222,449.09174],[364.422,1587],[39,136],[52.36586,31.57414],[2.5767,0.461538462],
    [-236.7423309,-233.3288759],[-233.3961737,-238.1357966],[-239.2759605,-242.9653711],[-239.5827658,-239.1875471],
    [-243.8778849,-244.0763392]];

  List<List> featuresValue0_1=[[95.2047424,491.246094],[88.7428741,988.717834],[440.263153,471.756836],[-5.54095554,470.922455],
    [68.0661621,493.132111],[0.00062,-0.36744],[-10.0155015,5.1097],[540.17743,0],[54,26],[1.6677375,18.689871], [3.7947009,5],
    [2,-2.59273],[9.628211,4],[337.18268,486.00369],[360.44998,1436],[56,150],[59.640204,33.483796],[2.7546,0.5],
    [-306.7337262,-303.2339851],[-303.3022137,-308.1860245],[-309.3848863,-312.7977316],[-309.1639775,-308.8030488],
    [-316.1671881,-315.8462926]];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrainCubit, BrainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          BrainCubit cubit = BrainCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: formFeatureKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                        child: Text(
                      'Features',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 30,
                      ),
                    )),
                    SizedBox(
                      height: 20.0,
                    ),
                    ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => rowFeatureItem(
                            featuresName[index], featuresValue0_1[index]),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20.0,
                            ),
                        itemCount: 23),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: cubit.load? CircularProgressIndicator()  : null ,
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      width: 140.0,
                      height: 45.0,
                      child: ElevatedButton(
                          onPressed: () {
                            cubit.loading(true);
                            if (formFeatureKey.currentState!.validate()) {

                              print('http://127.0.0.1:5000/api?status=' +
                                  featureList.join(','));
                              url = 'https://7694-197-34-220-79.eu.ngrok.io/api?status=' +
                                  featureList.join(',');

                              fetchData(url).then((value) {
                                data = value;
                                data = jsonDecode(data);
                                cubit.modelsResult(data);
                                cubit.changePredictScreen(2);
                                cubit.loading(false);

                              });
                            }
                            featureList.clear();
                          },
                          child: Text('Predict')),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
