
import 'package:blood_brain/modules/home/abstract.dart';
import 'package:blood_brain/modules/home/background.dart';
import 'package:blood_brain/modules/home/bbb.dart';
import 'package:blood_brain/modules/home/cells.dart';
import 'package:blood_brain/modules/home/conclusion.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            AspectRatio(
              aspectRatio: 18 / 12,
              child: Image.asset(
                "assets/images/background.jpg",
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Inventive prosses of\nfinding new modification",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120, left: 20),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Learn More"),
                  )),
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Articles",
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Abstract",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Container(
                              width: 250,
                              height: 120,
                              child: Text(
                                  "The blood–brain barrier is controlling the influx and efflux of biological substances essential for the brain’s metabolic activity as well as neuronal function.",style: TextStyle(fontSize: 17))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(color: Colors.blue,
                                child: MaterialButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Abstract()));
                                },child: Text("Read More",style: TextStyle(color: Colors.white),),)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Background",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Container(
                              width: 250,
                              height: 120,
                              child: Text(
                                  "A highly controlled microenvironment is required to promote the normal functioning of the central nervous system (CNS). ",style: TextStyle(fontSize: 19)),)
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(color: Colors.blue,
                                child: MaterialButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Background()));
                                },child: Text("Read More",style: TextStyle(color: Colors.white),),)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Cells of the NVU",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Container(
                              width: 250,
                              height: 120,
                              child: Text("Tcharacterized by different features, which make them phenotypically different from other ECs located at different parts of the body.",style: TextStyle(fontSize: 18)),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(color: Colors.blue,
                                child: MaterialButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cells()));
                                },child: Text("Read More",style: TextStyle(color: Colors.white),),)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "BBB disruption",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Container(
                              width: 250,
                              height: 120,
                              child: Text(" is reported in many CNS pathological conditions including multiple sclerosis ; hypoxic and ischemic insult ; glaucoma  and lysosomal storage diseases ",style: TextStyle(fontSize: 17.4)),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(color: Colors.blue,
                                child: MaterialButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BBB()));
                                },child: Text("Read More",style: TextStyle(color: Colors.white),),)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            "Concolusion",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.blue),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20),
                            child: Container(
                              width: 250,
                              height: 120,
                              child: Text("The BBB is a fundamental component of the CNS. Its functional and structural integrity is vital in maintaining the homeostasis of the brain microenvironment. ",style: TextStyle(fontSize: 17),),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(color: Colors.blue,
                                child: MaterialButton(onPressed: (){

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Conclusion()));
                                },child: Text("Read More",style: TextStyle(color: Colors.white),),)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          )
        ])
    );

  }
}