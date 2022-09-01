import 'package:flutter/material.dart';

class InputRow extends StatefulWidget {
  InputRow(
      {Key? key, this.titleExample, this.budgetExample, this.actualExample})
      : super(key: key);

  String? titleExample;
  String? budgetExample;
  String? actualExample;

  @override
  State<InputRow> createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  TextEditingController budgetController = TextEditingController();
  TextEditingController actualController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  double difference = 0;
  double budget = 0;
  double actual = 0;

  findDifference() {
    setState(() {
      budget = double.parse(budgetController.text);
      actual = double.parse(actualController.text);
      difference = budget - actual;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
            child: Center(
              child: TextFormField(
                style: const TextStyle(fontSize: 13),
                controller: titleController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(22),
                  border: OutlineInputBorder(),
                  // hintText: titleExample,
                  // hintStyle: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
            child: Center(
              child: TextFormField(
                style: const TextStyle(fontSize: 13),
                keyboardType: TextInputType.number,
                controller: budgetController,
                onChanged: ((value) {
                  if (value.isEmpty) {
                    setState(() => budget = 0);
                  } else {
                    setState(() {
                      findDifference();
                    });
                  }
                }),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(22),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
            child: Center(
              child: TextFormField(
                style: const TextStyle(fontSize: 13),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                controller: actualController,
                onChanged: ((value) {
                  if (value.isEmpty) {
                    setState(() => actual = 0);
                  } else {
                    setState(() {
                      findDifference();
                    });
                  }
                }),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(22),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.white,
            child: Center(
              child: Text(
                '£${difference.toInt()}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
