import 'package:flutter/material.dart';

class Background extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(Icons.android_sharp),
          title: const Text('Background'),
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
                        "Background of  blood–brain barrier ",
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
                      child: Text(" A highly controlled microenvironment is required to promote the normal functioning of the central nervous system (CNS). ",style: TextStyle(fontSize: 17)),
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
                      child: Text(" The existence of a biological barrier at the blood to brain interface effectively separating the brain from the rest of the body was established after the finding of Paul Ehrlich when he noticed that a peripherally infused dye did not stain the brain tissue. His finding was further supported by later observation from his associate Goldmann as he applied the same dye to the cerebrospinal fluid. It did stain only the brain tissue without extravasating in the periphery .",style: TextStyle(fontSize: 17)),
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
                      child: Text(" These biological barriers are established by different cells at three key interfaces: the blood–brain barrier (BBB), blood–CSF barrier (BCB), and the arachnoid barrier . ",
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
