import 'package:flutter/material.dart';

class InputRow extends StatelessWidget {
  const InputRow({Key? key}) : super(key: key);

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
