import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
// import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatefulWidget {
  const SampleItemListView({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const routeName = '/';

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
  State<SampleItemListView> createState() => _SampleItemListViewState();
}

class _SampleItemListViewState extends State<SampleItemListView> {
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Budget'),
    const Tab(text: 'Monthly Summary'),
  ];

  String dropdownValue = SampleItemListView.months[0];

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
                children: const [
                  SizedBox(
                    width: 105,
                  ),
                  Text(
                    'tmd: budget',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 115,
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_drop_down_sharp),
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
                    items: SampleItemListView.months.map((name) {
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.green[600],
                        child: const Center(
                          child: Text(
                            'Income',
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
                        color: Colors.green[600],
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
                        color: Colors.green[600],
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
                        color: Colors.green[600],
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
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  color: Colors.cyan[600],
                  child: const Center(
                    child: Text(
                      'Fixed Expenses',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  color: Colors.lightBlue[900],
                  child: const Center(
                    child: Text(
                      'Savings',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  color: Colors.deepOrange[300],
                  child: const Center(
                    child: Text(
                      'Variable Expenses',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  color: Colors.brown[600],
                  child: const Center(
                    child: Text(
                      'Miscelleanous Expenses',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.green[600],
                        child: const Center(
                          child: Text(
                            'Income',
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
                        color: Colors.green[600],
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
                        color: Colors.green[600],
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
                        color: Colors.green[600],
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
                ),
                Container(
                  height: 50,
                  color: Colors.cyan[600],
                  child: const Center(
                      child: Text(
                    'Fixed Expenses',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
                Container(
                  height: 50,
                  color: Colors.lightBlue[900],
                  child: const Center(
                      child: Text(
                    'Savings',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
                Container(
                  height: 50,
                  color: Colors.deepOrange[300],
                  child: const Center(
                      child: Text(
                    'Variable Expenses',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
                Container(
                  height: 50,
                  color: Colors.brown[600],
                  child: const Center(
                    child: Text(
                      'Miscelleanous Expenses',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
