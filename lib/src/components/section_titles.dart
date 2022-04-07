import 'package:flutter/material.dart';

class SectionTitles extends StatelessWidget {
  const SectionTitles({Key? key, required this.colour, required this.section})
      : super(key: key);

  final String section;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            color: colour,
            child: Center(
              child: Text(
                section,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: colour,
            child: const Center(
              child: Text(
                'Budget',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: colour,
            child: const Center(
              child: Text(
                'Actual',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: colour,
            child: const Center(
              child: Text(
                'Difference',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
