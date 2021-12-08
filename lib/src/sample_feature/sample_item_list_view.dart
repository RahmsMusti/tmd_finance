import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  SampleItemListView({
    Key? key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  }) : super(key: key);

  static const routeName = '/';

  final List<SampleItem> items;

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Budget'),
    const Tab(text: 'Monthly Summary'),
  ];

  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
  ];

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
              const Text(
                'tmd: budget',
              ),
              DropdownButton<String>(
                icon: const Icon(Icons.arrow_drop_down_sharp),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.red),
                items: months.map((name) {
                  return DropdownMenuItem<String>(
                    value: name,
                    child: Text(name),
                  );
                }).toList(),
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
        body: ListView.builder(
          // Providing a restorationId allows the ListView to restore the
          // scroll position when a user leaves and returns to the app after it
          // has been killed while running in the background.
          restorationId: 'sampleItemListView',
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];

            return ListTile(
                title: Text('SampleItem ${item.id}'),
                leading: const CircleAvatar(
                  // Display the Flutter Logo image asset.
                  foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                ),
                onTap: () {
                  // Navigate to the details page. If the user leaves and returns to
                  // the app after it has been killed while running in the
                  // background, the navigation stack is restored.
                  Navigator.restorablePushNamed(
                    context,
                    SampleItemDetailsView.routeName,
                  );
                });
          },
        ),
      ),
    );
  }
}
