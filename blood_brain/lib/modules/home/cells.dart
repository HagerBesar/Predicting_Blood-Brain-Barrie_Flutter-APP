import 'package:flutter/material.dart';

class Cells extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: const Icon(Icons.android_sharp),
          title: const Text('Cells of the NVU'),
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
                        "Cells of the NVU ",
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15),
                            child: Text(" Endothelial cells",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w800)),
                          ),
                          Text(" The BBB endothelial cells (ECs) in the mature mammalian brain are characterized by different features, which make them phenotypically different from other ECs located at different parts of the body. ",style: TextStyle(fontSize: 17)),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15),
                            child: Text(" Pericytes",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w800)),
                          ),
                          Text(" Pericytes are essential constituents of the brain capillary with different frequencies in different vascular beds. ",style: TextStyle(fontSize: 17)),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15,bottom: 15),
                            child: Text(" Astrocytes",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w800)),
                          ),
                          Text(" ACs represent the most abundant cells in CNS and are involved in different physiological and biochemical tasks. These latter include compartmentalization of the neural parenchyma; maintenance of the ionic homeostasis of the extracellular space;  pH regulation; neurotransmitter uptake and processing by providing energy-rich substrates to the neurons; mediation of signals from neurons to the vasculature ."

                          ,style: TextStyle(fontSize: 17)),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),



          ]),
        )
    )

    ;
  }
}
