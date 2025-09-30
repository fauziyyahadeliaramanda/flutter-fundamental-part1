import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyLayout(),
      ),
    );
  }
}

class MyLayout extends StatelessWidget {
  const MyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Show AlertDialog'),
              onPressed: () {
                showAlertDialog(context);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Show SimpleDialog'),
              onPressed: () {
                showSimpleDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// AlertDialog
showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("My Title"),
    content: const Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// SimpleDialog
showSimpleDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: const Text("Choose an option"),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Option 1");
            },
            child: const Text("Option 1"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Option 2");
            },
            child: const Text("Option 2"),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, "Option 3");
            },
            child: const Text("Option 3"),
          ),
        ],
      );
    },
  );
}
