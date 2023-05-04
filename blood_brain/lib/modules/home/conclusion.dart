import 'package:flutter/material.dart';

class Conclusion extends StatelessWidget {


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
                        "Conclusion ",
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
                      child: Text(" The BBB is a fundamental component of the CNS. Its functional and structural integrity is vital in maintaining the homeostasis of the brain microenvironment.",style: TextStyle(fontSize: 17)),
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
                      child: Text(" Deterioration in BBB function may play a significant role in the pathogenesis of disease since the BBB dynamically responds to many events associated with flow disturbances, free radical release, and cytokine generation.  ",style: TextStyle(fontSize: 17)),
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
                      child: Text(" Furthermore, many neurological disorders and lesions are associated with increased BBB permeability such as neoplasia, hypertension, dementia, epilepsy, infection, multiple sclerosis, and trauma. ",
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
