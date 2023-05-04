import 'package:flutter/material.dart';

class Abstract extends StatelessWidget {
  const Abstract({Key? key}) : super(key: key);

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
                      "Abstract of  blood–brain barrier ",
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
                        child: Text(" The blood–brain barrier is playing a critical role in controlling the influx and efflux of biological substances essential for the brain’s metabolic activity as well as neuronal function.",style: TextStyle(fontSize: 17)),
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
                        child: Text(" Thus, the functional and structural integrity of the BBB is pivotal to maintain the homeostasis of the brain microenvironment. ",style: TextStyle(fontSize: 17)),
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
                        child: Text(" The different cells and structures contributing to developing this barrier are summarized along with the different functions that BBB plays at the brain–blood interface. We also explained the role of shear stress in maintaining BBB integrity. ",
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
