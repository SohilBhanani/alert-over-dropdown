import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> cars = [
    "Toyota Land Cruiser 200",
    "Ford Riviera",
    "Carrera GT 400",
    '#'
  ];

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: Center(
          child: FormBuilderDropdown(
            name: 'car',
            decoration: const InputDecoration(border: OutlineInputBorder()),
            hint: const Text('Select/Add a car'),
            initialValue: null,
            items: cars.map<DropdownMenuItem<String>>((String value) {
              if (value != '#') {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              } else {
                return DropdownMenuItem(
                  child: const Text(
                    "+ Add new car",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  alignment: Alignment.center,
                  onTap: () {
                    Navigator.pop(_formKey.currentContext!);
                    _formKey.currentState!.fields['car']!.reset();
                    showDialog(
                      context: _formKey.currentContext!,
                      builder: (BuildContext context) => const AlertDialog(
                        title: Text('data'),
                        content: Text("Hello"),
                      ),
                    );
                  },
                  value: "newCarOption",
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}
