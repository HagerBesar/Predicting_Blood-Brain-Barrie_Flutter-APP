import 'package:flutter/material.dart';

class BBB extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(Icons.android_sharp),
          title: const Text('Abstract'),
          backgroundColor: Colors.lightBlue,
          elevation: 4,
        ),
        body: SingleChildScrollView(
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
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 250,
                      child: Text(
                        "BBB disruption  ",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [

                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(" BBB dysfunction is reported in many CNS pathological conditions including multiple sclerosis ; hypoxic and ischemic insult ; Parkinson’s and Alzheimer’s disease ; brain tumors ; glaucoma , and lysosomal storage diseases . ",style: TextStyle(fontSize: 17)),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [

                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(" The observed barrier dysfunction can range from mild and transient changes in BBB permeability, resulting from tight junction opening, to chronic barrier breakdown, and changes in transport systems and enzymes can also occur.  ",style: TextStyle(fontSize: 17)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                children: [

                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(" This process can also be associated with the degradation of the basement membrane. Microglial activation and infiltration of different plasma components and immune cells into the brain parenchyma result in disturbance of CNS homeostasis and variable damage to the surrounding brain. ",
                        style: TextStyle(fontSize: 17),),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
          ]),
        )
    )

    ;
  }
}
