import 'dart:html';

import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ListTile(
              title: const Text('January'),
              onTap: () => Navigator.of(context).pushNamed('/'),
            ),
            ListTile(
              title: const Text('February'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('March'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('April'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('May'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('June'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('July'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('August'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('September'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('October'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('November'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('December'),
              onTap: () {},
            ),
            const Divider(
              color: Colors.black,
            )
          ],
        ),
      );
}
