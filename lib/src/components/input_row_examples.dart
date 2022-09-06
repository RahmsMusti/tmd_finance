import 'package:flutter/material.dart';

class InputRowExamples extends StatefulWidget {
  const InputRowExamples({
    Key? key,
    this.titleExample,
    this.budgetExample,
    this.actualExample,
  }) : super(key: key);

  final String? titleExample;
  final String? budgetExample;
  final String? actualExample;

  @override
  State<InputRowExamples> createState() => _InputRowExamplesState();
}

class _InputRowExamplesState extends State<InputRowExamples> {
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
      difference = actual - budget;
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
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(22),
                  border: const OutlineInputBorder(),
                  hintText: widget.titleExample,
                  hintStyle: const TextStyle(fontSize: 13),
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
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(22),
                  border: const OutlineInputBorder(),
                  hintText: widget.budgetExample,
                  hintStyle: const TextStyle(fontSize: 13),
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
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(22),
                  border: const OutlineInputBorder(),
                  hintText: widget.actualExample,
                  hintMaxLines: 2,
                  hintStyle: const TextStyle(fontSize: 13),
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
                style: TextStyle(
                  color: difference >= 0 ? Colors.black : Colors.red,
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
