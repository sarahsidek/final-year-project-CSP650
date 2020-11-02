import 'package:flutter/material.dart';
import 'dart:async';

import 'package:background_locations/background_locations.dart' as bg;


class Geofencing extends StatefulWidget {
  @override
  _GeofencingState createState() => _GeofencingState();
}

class _GeofencingState extends State<Geofencing> {
  bool _moving = false;
  String _odometer = '0.0';
  String _location = '-';
  String _providerState = 'unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {


    if (!mounted) return;

    setState(() {
    });

    bg.BackgroundLocation.onLocation((loc) async {
      print('onLocation');
      _odometer = (await bg.BackgroundLocation.odometer).toString();
      setState(() {});
    });

    bg.BackgroundLocation.onMotionChange((val) {
      setState(() {
        _moving = val;
      });
    });

    bg.BackgroundLocation.onProviderChange((val) {
      print(val.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              RaisedButton(
                  child: Text('Ready'),
                  onPressed: () async {
                    var state = await bg.BackgroundLocation.ready(bg.Config(
                      enableHeadless: true,
                    ));

                    print(state.toString());
                  }),
              RaisedButton(
                child: Text('start'),
                onPressed: () async {
                  var state = await bg.BackgroundLocation.ready(bg.Config(
                    enableHeadless: true,
                    firebaseConfig: bg.FirebaseConfig(
                        appName: 'test',
                        apiKey: 'XXXXXXXXXXXXXX',
                        applicationId: '00000000000',
                        databaseRefPaths: [
                          bg.DatabaseRefPath(
                              path: 'test/1/location',
                              method: bg.DatabaseRefPath.UPDATE_METHOD_VALUE),
                          bg.DatabaseRefPath(
                              path: 'test/1/trip/1/path',
                              method: bg.DatabaseRefPath.UPDATE_METHOD_ADD),
                        ],
                        databaseUrl: 'https://[project].firebaseio.com',
                        email: 'test@pml.com',
                        password: 'test@pml'),
                  ));

                  print(state.toString());
                  await bg.BackgroundLocation.start();
                },
              ),
              RaisedButton(
                child: Text('stop'),
                onPressed: () async {
                  await bg.BackgroundLocation.stop();
                },
              ),
              RaisedButton(
                child: Text('current location'),
                onPressed: () async {
                  var loc = await bg.BackgroundLocation.getCurrentPosition();
                  setState(() {
                    _location = loc.toString();
                  });
                },
              ),
              Text('ODOMETER $_odometer'),
              Text(
                'MOVING',
                style: TextStyle(
                  backgroundColor: _moving ? Colors.green : Colors.orange,
                  color: Colors.white,
                ),
              ),
              Text('LOCATION $_location'),
              SizedBox(height: 16.0),
              Text('$_providerState'),
              RaisedButton(
                child: Text('Check Provider State'),
                onPressed: () {
                  bg.BackgroundLocation.providerState.then((val) {
                    setState(() {
                      _providerState = val.toString();
                    });
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
