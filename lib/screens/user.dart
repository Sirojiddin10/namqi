import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namqi_project/screens/reception_screen.dart';
import 'package:namqi_project/screens/university_info_screen.dart';
import 'package:namqi_project/widgets/user_component.dart';

class UserScreen extends StatelessWidget {
  final String imagePath;
  const UserScreen({this.imagePath = '', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                UserComponent(
                  text: 'Raxbar Qabulxonasi',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ReceptionScreen(
                            imagePath: imagePath,
                          ))),
                ),
                UserComponent(
                  text: 'Insitut haqida ma`lumot',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const UniversityInfoScreen())),
                ),
                UserComponent(
                  text: 'Fakultetlar haqida ma`lumot',
                  onTap: () {},
                ),
                UserComponent(
                  text: 'Yo\'nalishlar haqida ma`lumot',
                  onTap: () {},
                ),
                UserComponent(
                  text: 'Iqtidorli talabalar haqida ma`lumot',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
