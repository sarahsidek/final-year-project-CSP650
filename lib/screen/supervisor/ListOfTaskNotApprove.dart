import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp/shared/Loading.dart';

class ListOfTaskNotApprove extends StatefulWidget {
  @override
  _ListOfTaskNotApproveState createState() => _ListOfTaskNotApproveState();
}

class _ListOfTaskNotApproveState extends State<ListOfTaskNotApprove> {
  List<NetworkImage> _listOfImages = <NetworkImage>[];
  String catatan;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Senarai Aduan Tidak Diluluskan"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        child: StreamBuilder(
            stream:Firestore.instance.collection("Task").where('verified', isEqualTo:'TidakSah').snapshots(),
            builder: (context, snapshot){
              if (snapshot.hasError || !snapshot.hasData) {
                return Loading();
              } else{

                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index){
                      final List<DocumentSnapshot> ba = snapshot.data.documents;
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
                                    child: Text(ba[index].data['sumberAduan']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(ba[index].data['noAduan']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                    child: Text(ba[index].data['kategori']),
                                  ),
                                  SizedBox(height: 5.0),
                                  Container(alignment: Alignment.centerLeft,
                                   child: Text(ba[index].data['verified']),
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
                              subtitle: Container(
                                child: Row(
                                  children: [
                                    SizedBox(height: 5.0),
                                    Container(alignment: Alignment.centerLeft,
                                      child: Text(ba[index].data['comments']),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {updateComments(ba[index].data['id']);}
                          )
                      );
                    });
              }
            }),
      ),
    );
  }
  void updateComments(String id) {
     showModalBottomSheet(
       shape: RoundedRectangleBorder(
           borderRadius: new BorderRadius.only(
               topLeft: const Radius.circular(10.0),
               topRight: const Radius.circular(10.0)
           )
       ),
         context: context,
         builder: (builder){
         return StreamBuilder(
         stream: Firestore.instance.collection('Task').document(id).snapshots(),
           builder: (context, snapshot) {
             if (!snapshot.hasData) {
               return Loading();
             }
             return new Container(
               height: 500,
               padding: EdgeInsets.all(10),
               child: Visibility(
                 visible: (snapshot.data['comments'].toString() == 'Tiada catatan')? true:false,
                 child: Column(
                   children: [
                     SizedBox(height: 25.0),
                     TextFormField(
                       decoration: InputDecoration(
                           hintText: 'Catatan',
                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                       maxLines: 5,
                       minLines: 3,
                       keyboardType: TextInputType.text,
                       onChanged: (value) {
                         setState(() => catatan = value);
                       },
                     ),
                     RaisedButton(
                         color: Colors.redAccent,
                         textColor: Colors.black,
                         child: Text("Hantar"),
                         onPressed: () async {
                           Firestore.instance.collection('Task').document(id).updateData({
                             'comments':catatan
                           }).whenComplete((){
                             Navigator.pop(context);
                           });
                         }
                     ),
                   ],
                 ),
               ),
              );
             }
           );
         }
     );

  }
}

