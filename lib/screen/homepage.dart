
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/home/HomeRecordOfficer.dart';
import 'package:fyp/screen/home/HomeRoadGang.dart';
import 'package:fyp/screen/home/HomeSupervisor.dart';




class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex=0;
  Widget callPage(int currentIndex){
    switch (currentIndex){
      case 0: return HomeSupervisor();
      case 1: return HomeRoadGang();
      case 2: return HomeRecordOfficer();
      break;
    }
  }
  @override
  Widget build(BuildContext context) {
        return  MaterialApp(
          home: Scaffold(
              body: callPage(_currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (value){
                  _currentIndex=value;
                  setState(() {

                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.supervised_user_circle),
                    label: ('Penyelia'),
                    backgroundColor: Colors.blueAccent,

                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: ('Buruh kakitangan'),
                      backgroundColor: Colors.redAccent
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: ('Pegawai merekod'),
                    backgroundColor: Colors.orangeAccent,
                  ),
                ],
              ),
          ),
        );
    }
  }
  

  






