import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/shared/Loading.dart';

class ListOfTaskApprove extends StatefulWidget {
  @override
  _ListOfTaskApproveState createState() => _ListOfTaskApproveState();
}

class _ListOfTaskApproveState extends State<ListOfTaskApprove> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senarai Aduan telah Diluluskan"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: StreamBuilder(
            stream: Firestore.instance.collection("Task").where('verified', isEqualTo:'Sah').snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasError || !snapshot.hasData) {
                return Loading();
              } else{
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      final List<DocumentSnapshot> tk = snapshot.data.documents;
                      _listOfImages =[];
                      for(int i =0; i <snapshot.data.documents[index].data['url'].length; i++){
                        _listOfImages.add(NetworkImage(snapshot.data.documents[index].data['url'][i]));
                      }
                      return Card(
                          child:ListTile(
                            title: Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['sumberAduan']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['noAduan']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['kategori']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(tk[index].data['verified']),
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
                            subtitle: Text(tk[index].data['comments']),
                          )
                      );
                    });
              }
            }),
      ),
    );

  }
}