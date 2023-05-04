import 'package:blood_brain/shared/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
// var scaffoldKey =GlobalKey<ScaffoldState>();
Future fetchData(String url) async {
  http.Response response = await http.get(Uri.parse(url));
  print(response.body);
  return response.body;
}



var name='hager' , date , time;
List featureList=[];
Widget screenBuilder({required IconData icon, required String title,}) {
  return Center(
    child: Container(

      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Icon(icon,
            color: Colors.grey,
            size: 60.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '$title',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}


Widget inputFeature(String featureName,var featureValue) {
  return TextFormField(
    keyboardType: TextInputType.number,
    initialValue: featureValue.toString(),
    decoration: InputDecoration(
      labelText: featureName,
      labelStyle: TextStyle(
        color: Colors.lightBlue[700],
      ),
      border: OutlineInputBorder(),
    ),
    validator: (value) {
      if(value!.isEmpty){
        return "Feature is empty";
      }
      else{
        featureList.add(value);
        return null;
      }
    },

  );
}

Widget rowFeatureItem(var featuresName, var featureValue){
  return  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child:
        Container(
          color: Colors.grey[200],
            child: inputFeature(featuresName[0],featureValue[0])
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Expanded(
        child:
        Container(
            color: Colors.grey[200],
            child: inputFeature(featuresName[1],featureValue[1])
        ),
      ),

    ],
  );
}


Widget contactItem({
  required String imagePath,
  required String memberName,
  required String memberSkill1,
  required String memberSkill2,

}){
  return Container(
    height: 300.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.grey[300],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //first part
        Row(
          children: [
            //image
            Container(
              height: 220.0,
              width: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage('$imagePath'),
                  fit: BoxFit.cover,
                ),

              ),
            ),

            //socialIcons
            Expanded(
              child: Column(
                children: [

                  IconButton(
                    onPressed: () {  },
                    icon: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.grey[700]),

                  ),
                  IconButton(
                    onPressed: () {  },
                    icon: Icon(FontAwesomeIcons.linkedinIn,
                        color: Colors.grey[700]),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesomeIcons.twitter,
                        color: Colors.grey[700]),
                  ),
                  IconButton(
                    onPressed: () {  },
                    icon: Icon(FontAwesomeIcons.youtube,
                        color: Colors.grey[700]),
                  ),

                ],
              ),
            ),

          ],
        ),
        //2sd part
        Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 8.0),
          child: Column(
            children: [
              Text(
                '$memberName',
                style: TextStyle(
                  color:Colors.lightBlue[700],
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                '$memberSkill1',
                style: TextStyle(
                  color:Colors.grey[800],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                '$memberSkill2',
                style: TextStyle(
                  color:Colors.grey[800],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),

      ],
    ),
  );
}

Widget textItem({
  required String value
}){
  return Text('$value',
      style: TextStyle(
        fontWeight: FontWeight.bold
      )
  );
}


Widget itemBuilder(Map task,context ,index){
  BrainCubit cubit = BrainCubit.get(context);
  return InkWell(
    onTap: (){
      cubit.getItemScreen(index);
      cubit.changePredictScreen(3);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadiusDirectional.circular(8.0)),

        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(

            children: [
              CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.lightBlue,
                  child: Text('${task['id']}', style: TextStyle(color: Colors.white),)),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${task["title"]}',
                      style: Theme.of(context).textTheme.bodyText1,
                      // style: TextStyle(
                      //   fontSize: 22.0,
                      //   fontWeight: FontWeight.w500,
                      // ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('${task["date"]}',
                      style: TextStyle(
                        // fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text('${task["time"]}',
                      style: TextStyle(
                        // fontSize: 10.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}




// {required List<Map> tasks}
Widget tasksBuilder(List<Map> tasks,context){
  return ConditionalBuilder(
    condition: tasks.length>0,
    builder: (BuildContext context) {
      return ListView.separated(
        itemBuilder:(context, index) => itemBuilder(tasks[index],context,index),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all( 10.0),
          child: Container(
            color: Colors.grey[300],
            width: double.infinity,
            height: 1.0,
          ),
        ),
        itemCount: tasks.length,
      );
    },
    fallback: (context){
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Result Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );


    },

  );
}

////// Contact Screen

// Widget contactItem(){
//   return Stack(
//     children: [
//       Container(
//         height: 300.0,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           color: Colors.grey[300],
//         ),
//       ),
//       Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           //first part
//           Row(
//             children: [
//               //image
//               Container(
//                 height: 220.0,
//                 width: 140.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(10),
//                     topLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10),
//                   ),
//                   color: Colors.grey,
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/hager1.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//
//                 ),
//               ),
//               SizedBox(width: 8.0,),
//               //socialIcons
//               Expanded(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 15.0,),
//                     IconButton(
//                       onPressed: () {  },
//                       icon: Icon(FontAwesomeIcons.facebookF,
//                           color: Colors.grey[700]),
//                     ),
//                     SizedBox(height: 20.0,),
//                     IconButton(
//                       onPressed: () {  },
//                       icon: Icon(FontAwesomeIcons.linkedinIn,
//                           color: Colors.grey[700]),
//                     ),
//                     SizedBox(height: 20.0,),
//                     IconButton(
//                       onPressed: (){},
//                       icon: Icon(FontAwesomeIcons.twitter,
//                           color: Colors.grey[700]),
//                     ),
//                     SizedBox(height: 20.0,),
//                     IconButton(
//                       onPressed: () {  },
//                       icon: Icon(FontAwesomeIcons.youtube,
//                           color: Colors.grey[700]),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           //2sd part
//           Padding(
//             padding: const EdgeInsets.only(left: 20.0),
//             child: Column(
//               children: [
//                 Text(
//                   'Hager Besar',
//                   style: TextStyle(
//                     color:Colors.lightBlue[700],
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   'Full Stack Developer',
//                   style: TextStyle(
//                     color:Colors.grey[800],
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//                 Text(
//                   'Flutter Developer',
//                   style: TextStyle(
//                     color:Colors.grey[800],
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.w300,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
