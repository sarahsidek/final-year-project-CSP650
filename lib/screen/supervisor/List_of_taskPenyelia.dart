import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';



class List_ofTask extends StatefulWidget {
  @override
  _List_ofTaskState createState() => _List_ofTaskState();
}

Stream<QuerySnapshot> getListOfTask(BuildContext context) {
  return Firestore.instance.collection("Task").snapshots();
}
String uid;
List<NetworkImage> _listOfImages = <NetworkImage>[];
class _List_ofTaskState extends State<List_ofTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: getListOfTask(context),
        builder: (context, snapshot){
          if(snapshot.hasError || snapshot.hasData){
            return Loading();
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                _listOfImages =[];
                for(int i =0; i <snapshot.data.documents[index].data['urls'].length; i++){
                  _listOfImages.add(NetworkImage(snapshot.data.documents[index].data['urls'][i]));
                }
                final task = snapshot.data.documents[index];
                return Card(
                    child:ListTile(
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 5.0),
                            Container(alignment: Alignment.centerLeft,
                              child: Text(task['sumberAduan']),
                            ),
                            SizedBox(height: 5.0),
                            Container(alignment: Alignment.centerLeft,
                              child: Text(task['noAduan']),
                            ),
                            SizedBox(height: 5.0),
                            Container(alignment: Alignment.centerLeft,
                              child: Text(task['kategori']),
                            ),
                            SizedBox(height: 5.0),
                            Container(alignment: Alignment.centerLeft,
                              child: Text(task['verified']),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(10.0),
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.white
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  child: Carousel(
                                    boxFit: BoxFit.cover,
                                    images: _listOfImages,
                                    autoplay: false,
                                    indicatorBgPadding: 5.0,
                                    dotPosition: DotPosition.bottomCenter,
                                    animationCurve: Curves.fastLinearToSlowEaseIn,
                                    animationDuration: Duration(milliseconds: 2000),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                );
              }
            );
          }
        }
      ),
    );
  }
}
