import 'package:flutter/material.dart';
import 'package:tmd_finance/src/components/navigation_drawer.dart';

import '../settings/settings_view.dart';
import 'package:tmd_finance/src/sample_feature/sample_item.dart';
import 'package:tmd_finance/src/components/section_titles.dart';
import 'package:tmd_finance/src/components/input_row_examples.dart';
// import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class BudgetPageApr extends StatefulWidget {
  const BudgetPageApr({Key? key, required this.items}) : super(key: key);

  static const routeName = 'apr';

  final List<SampleItem> items;

  @override
  State<BudgetPageApr> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPageApr> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Budget'),
    const Tab(text: 'Monthly Summary'),
  ];

  var incomeList = <Widget>[
    const InputRowExamples(
        titleExample: 'Salary', budgetExample: '£2134', actualExample: '£2200')
  ];
  var fixedExpensesList = <Widget>[];
  var savingsList = <Widget>[];
  var variableExpensesList = <Widget>[];
  var miscelleneousExpensesList = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        drawer: const Drawer(
          child: NavigationDrawer(),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.edit_calendar),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          centerTitle: true,
          title: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // SizedBox(
                  //   width: 20,
                  // ),
                  Text(
                    'tmd: budget',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'January',
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
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
                Column(
                  children: incomeList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          incomeList.add(
                            const InputRowExamples(),
                          );
                        });
                      },
                      backgroundColor: const Color.fromARGB(255, 67, 160, 71),
                      label: const Text('Add Income'),
                      icon: const Icon(Icons.add),
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
                  section: 'Fixed Expenses',
                ),
                Column(
                  children: fixedExpensesList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          fixedExpensesList.add(
                            const InputRowExamples(),
                          );
                        });
                      },
                      backgroundColor: const Color.fromARGB(255, 0, 172, 193),
                      label: const Text('Add Expense'),
                      icon: const Icon(Icons.add),
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
                  section: 'Savings',
                ),
                Column(
                  children: savingsList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          savingsList.add(
                            const InputRowExamples(),
                          );
                        });
                      },
                      backgroundColor: const Color.fromARGB(255, 1, 87, 155),
                      label: const Text('Add Savings'),
                      icon: const Icon(Icons.add),
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
                  section: 'Variable Expenses',
                ),
                Column(
                  children: variableExpensesList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          variableExpensesList.add(
                            const InputRowExamples(),
                          );
                        });
                      },
                      backgroundColor: const Color.fromARGB(255, 255, 138, 101),
                      label: const Text('Add Expense'),
                      icon: const Icon(Icons.add),
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
                  section: 'Misc. Expenses',
                ),
                Column(
                  children: miscelleneousExpensesList,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          miscelleneousExpensesList.add(
                            const InputRowExamples(),
                          );
                        });
                      },
                      backgroundColor: const Color.fromARGB(255, 109, 76, 65),
                      label: const Text('Add Expense'),
                      icon: const Icon(Icons.add),
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
                  section: 'Fixed Expenses',
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
