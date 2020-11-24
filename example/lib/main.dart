import 'package:cronwork/cronwork.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cron testing",
      home: HomeMainView(),
    );
  }
}

class HomeMainView extends StatefulWidget {
  @override
  _HomeMainViewState createState() => _HomeMainViewState();
}

class _HomeMainViewState extends State<HomeMainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cronwork"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              FlatButton(
                child: Text("Print task"),
                onPressed: () {
                  CronJob.instance.cronWork.startCron(Tasks.print);
                },
              ),
              FlatButton(
                child: Text("Increment task"),
                onPressed: () {
                  CronJob.instance.cronWork.startCron(Tasks.increment);
                },
              ),
              FlatButton(
                child: Text("Stop Task"),
                onPressed: () {
                  CronJob.instance.cronWork.stopCron();
                },
              ),
              FlatButton(
                child: Text("Resume Task"),
                onPressed: () {
                  CronJob.instance.cronWork.resumeCron();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum Tasks { print, increment }

class CronJob {
  final CronWork<Tasks> cronWork = new CronWork<Tasks>(
    CronworkConfiguration<Tasks>(
      Duration(seconds: 3),
      [
        CronworkStates(state: Tasks.print, callback: () {
          print("This is print task");
        }),
        CronworkStates(state: Tasks.increment, callback: () {
          print("This is increment task");
        })
      ]
    )
  );

  static final CronJob _singleton = CronJob._();
  CronJob._();

  static CronJob get instance => _singleton;
}