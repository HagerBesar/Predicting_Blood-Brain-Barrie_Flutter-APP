import 'package:flutter/material.dart';
import '../shared/components.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Team Members',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                    color: Colors.lightBlue[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: contactItem(
                        imagePath: 'assets/images/hager1.jpg',
                        memberName: 'Hager Besar',
                         memberSkill1: 'Back End Developer',
                        memberSkill2: 'Flutter Developer',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: contactItem(
                        imagePath: 'assets/images/hemat.jpg',
                        memberName: 'Hemat Shawky',
                        memberSkill1: 'Front End Developer',
                        memberSkill2: 'Flutter Developer',
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: contactItem(
                        imagePath: 'assets/images/mariam.jpg',
                        memberName: 'Mariam Zahana',
                        memberSkill1: 'Front End Developer',
                        memberSkill2: ' ',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: contactItem(
                        imagePath: 'assets/images/omnia.jpg',
                        memberName: 'Omnia Ashraf',
                        memberSkill1: 'Back End Developer',
                        memberSkill2: 'Flutter Developer',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: contactItem(
                        imagePath: 'assets/images/angil.jpg',
                        memberName: 'Angil Azmy',
                        memberSkill1: 'Front End Developer',
                        memberSkill2: '',
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: Container(
                        height: 300.0,
                        color: Colors.grey[200],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          //footer
          Container(
            height: 110.0,
            width: double.infinity,
            // color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text('Contact Us',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'we would be happy to receive any messages from you'
                        ' about any inquiry into the program.',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Thanks a lot for using our application',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
