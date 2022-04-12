import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'package:tmd_finance/src/components/section_titles.dart';
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

  get onPressed => null;

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
                        child: Center(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Income Type',
                              hintStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                          // child: Text(
                          //   'Salary',
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(color: Colors.black),
                          // ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            '£2550',
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
                            '£2600',
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            "Business Income",
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
                            '£700',
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
                            '£800',
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
                            '£100',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: onPressed,
                      child: const Icon(Icons.add),
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'Mortgage/Rent',
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
                            '£500',
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
                            '£600',
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
                            '£-100',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            "Council Tax",
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
                            '£70',
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
                            '0',
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
                            '£70',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: onPressed,
                      child: const Icon(Icons.add),
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
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: onPressed,
                      child: const Icon(Icons.add),
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
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      onPressed: onPressed,
                      child: const Icon(Icons.add),
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
                const SizedBox(
                  height: 5,
                ),
                FloatingActionButton(
                  onPressed: onPressed,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(
                  height: 5,
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
              children: const [
                SectionTitles(
                  colour: Color.fromARGB(255, 67, 160, 71),
                  section: 'Income',
                ),
                SizedBox(
                  height: 10,
                ),
                SectionTitles(
                    colour: Color.fromARGB(255, 0, 172, 193),
                    section: 'Fixed Expenses'),
                SizedBox(
                  height: 10,
                ),
                SectionTitles(
                    colour: Color.fromARGB(255, 1, 87, 155),
                    section: 'Savings'),
                SizedBox(
                  height: 10,
                ),
                SectionTitles(
                    colour: Color.fromARGB(255, 255, 138, 101),
                    section: 'Variable Expenses'),
                SizedBox(
                  height: 10,
                ),
                SectionTitles(
                    colour: Color.fromARGB(255, 109, 76, 65),
                    section: 'Misc. Expenses'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
