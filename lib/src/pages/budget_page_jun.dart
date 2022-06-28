import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'package:tmd_finance/src/sample_feature/sample_item.dart';
import 'package:tmd_finance/src/components/section_titles.dart';
import 'package:tmd_finance/src/components/input_row_examples.dart';
import 'package:tmd_finance/src/components/input_row.dart';
// import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class BudgetPageJun extends StatefulWidget {
  const BudgetPageJun({Key? key, required this.items}) : super(key: key);

  static const routeName = '/jun';

  final List<SampleItem> items;

  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  @override
  State<BudgetPageJun> createState() => _BudgetPageJunState();
}

class _BudgetPageJunState extends State<BudgetPageJun> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Budget'),
    const Tab(text: 'Monthly Summary'),
  ];

  String dropdownValue = BudgetPageJun.months[5];

  var incomeList = <Widget>[];
  var fixedExpensesList = <Widget>[];
  var savingsList = <Widget>[];
  var variableExpensesList = <Widget>[];
  var miscelleneousExpensesList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'tmd: budget',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    alignment: AlignmentDirectional.center,
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    dropdownColor: Colors.grey,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: BudgetPageJun.months.map((name) {
                      return DropdownMenuItem<String>(
                        alignment: AlignmentDirectional.center,
                        value: name,
                        child: Text(name),
                      );
                    }).toList(),
                  ),
                ],
              )
            ],
          ),
          bottom: TabBar(
            tabs: myTabs,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: TabBarView(
          children: [
            ListView(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'sampleItemListView',
              children: [
                const SectionTitles(
                  colour: Color.fromARGB(255, 67, 160, 71),
                  section: 'Income',
                ),
                const InputRowExamples(
                  titleExample: 'Salary',
                  budgetExample: '£2134',
                  actualExample: '£2200',
                ),
                Column(
                  children: incomeList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          incomeList.add(
                            InputRow(),
                          );
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        setState(() {
                          incomeList.removeLast();
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 0, 172, 193),
                    section: 'Fixed Expenses'),
                const InputRowExamples(
                    titleExample: 'Mortgage/Rent',
                    budgetExample: 'e.g £500',
                    actualExample: 'e.g £600'),
                Column(
                  children: fixedExpensesList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          fixedExpensesList.add(
                            InputRow(),
                          );
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        setState(() {
                          fixedExpensesList.removeLast();
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 1, 87, 155),
                    section: 'Savings'),
                const InputRowExamples(
                    titleExample: 'savings',
                    budgetExample: '£',
                    actualExample: '£'),
                Column(
                  children: savingsList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          savingsList.add(
                            InputRow(),
                          );
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        setState(() {
                          savingsList.removeLast();
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 255, 138, 101),
                    section: 'Variable Expenses'),
                const InputRowExamples(
                    titleExample: 'Food',
                    budgetExample: '£',
                    actualExample: '£'),
                Column(
                  children: variableExpensesList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          variableExpensesList.add(
                            InputRow(),
                          );
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        setState(() {
                          variableExpensesList.removeLast();
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 109, 76, 65),
                    section: 'Misc. Expenses'),
                const InputRowExamples(
                    titleExample: 'Presents',
                    budgetExample: '£',
                    actualExample: '£'),
                Column(
                  children: miscelleneousExpensesList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          miscelleneousExpensesList.add(
                            InputRow(),
                          );
                        });
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {
                        setState(() {
                          miscelleneousExpensesList.removeLast();
                        });
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ],

              // ListTile(
              //     title: Text('SampleItem ${item.id}'),
              //     leading: const CircleAvatar(
              //       // Display the Flutter Logo image asset.
              //       foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              //     ),
              //     onTap: () {
              //       // Navigate to the details page. If the user leaves and returns to
              //       // the app after it has been killed while running in the
              //       // background, the navigation stack is restored.
              //       Navigator.restorablePushNamed(
              //         context,
              //         SampleItemDetailsView.routeName,
              //       );
              //     });
            ),
            ListView(
              // Providing a restorationId allows the ListView to restore the
              // scroll position when a user leaves and returns to the app after it
              // has been killed while running in the background.
              restorationId: 'sampleItemListView',
              children: [
                const SectionTitles(
                  colour: Color.fromARGB(255, 67, 160, 71),
                  section: 'Income',
                ),
                Row(
                  children: [
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
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 0, 172, 193),
                    section: 'Fixed Expenses'),
                Row(
                  children: [
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
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 1, 87, 155),
                    section: 'Savings'),
                Row(
                  children: [
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
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 255, 138, 101),
                    section: 'Variable Expenses'),
                Row(
                  children: [
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
                ),
                const SizedBox(
                  height: 10,
                ),
                const SectionTitles(
                    colour: Color.fromARGB(255, 109, 76, 65),
                    section: 'Misc. Expenses'),
                Row(
                  children: [
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
