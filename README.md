# cronwork

A Cron work for flutter

## Purpose

When you want to make some managable cron task on your app, it mapping states for callback

## Usage

The usage is simple, just construct the `CronWork<T>` as usual with `CronWorkConfiguration<T>` parameter

```dart
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
```

Then you can control your cron easily

```dart
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
```
Thats it, Happy Fluttering, @Cybernetics Core

