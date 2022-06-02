import 'package:flutter/material.dart';

class InputRowExamples extends StatelessWidget {
  const InputRowExamples(
      {Key? key,
      required this.titleExample,
      required this.budgetExample,
      required this.actualExample})
      : super(key: key);

  final String titleExample;
  final String budgetExample;
  final String actualExample;

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
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(22),
                  border: const OutlineInputBorder(),
                  hintText: titleExample,
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
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(22),
                  border: const OutlineInputBorder(),
                  hintText: budgetExample,
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
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(22),
                  border: const OutlineInputBorder(),
                  hintText: actualExample,
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
            child: const Center(
              child: Text(
                '£50',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
