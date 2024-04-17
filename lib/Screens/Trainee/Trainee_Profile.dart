// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, unused_import, non_constant_identifier_names, unused_element, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:karate/Screens/Trainee/Trainee_Edit_Screen.dart';
import 'package:karate/Widgets/Trainee_nav_bar_widget.dart';
import 'package:karate/Widgets/Trainee_Appbar.dart';

class TraineeProfile extends StatefulWidget {
  const TraineeProfile({Key? key});

  @override
  State<TraineeProfile> createState() => _TraineeProfileState();
}

class _TraineeProfileState extends State<TraineeProfile> {
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TraineeAppbar(),
      bottomNavigationBar: Trainee_Navbar_Widget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () => {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditScreen()),
                  )},
                  child: Icon(Icons.edit,size: 40,),
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                )),
              Image.asset(
                "assets/icons/profile-appbar.png",
                height: 100,
                width: 100,
              ),
              Text(
                "Ali Abdallah",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000)),
              ),
              Text(
                "White Belt",
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff999999)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "P.S.E",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff000000)),
                  ),
                  Container(
                    height: 7,
                    width: 250,
                    child: LinearProgressIndicator(
                      value: isChecked ? 1.0 : 0.0,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xffB53847)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _RowCard("assets/icons/telephone.png", "81847663",
                      Color(0xff967CFD)),
                  _RowCard("assets/icons/weighing-machine.png", "88 kg",
                      Color(0xffFFBF1A)),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text(
                    "Uploaded Videos",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
              _Card("assets/icons/kata.png", "Pinam Sono Ichi"),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _Card(String URL, String text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  URL,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _RowCard(String URL, String text, Color colorbg) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorbg,
                image: DecorationImage(
                    image: AssetImage(URL), fit: BoxFit.contain),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }


  Widget CArddddds(){
    return InkWell(
      onTap: () => setState(() {
        
      }),
    );
  }
}
