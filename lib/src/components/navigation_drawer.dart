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
        color: Colors.blue,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('January'),
              onTap: () => Navigator.of(context).pushNamed('/'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              iconColor: Colors.white,
              title: const Text('February'),
              textColor: Colors.white,
              onTap: () => Navigator.of(context).pushNamed('feb'),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('March'),
              onTap: () => Navigator.of(context).pushNamed('mar'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('April'),
              onTap: () => Navigator.of(context).pushNamed('apr'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('May'),
              onTap: () => Navigator.of(context).pushNamed('may'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('June'),
              onTap: () => Navigator.of(context).pushNamed('jun'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('July'),
              onTap: () => Navigator.of(context).pushNamed('jul'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('August'),
              onTap: () => Navigator.of(context).pushNamed('aug'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('September'),
              onTap: () => Navigator.of(context).pushNamed('sep'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('October'),
              onTap: () => Navigator.of(context).pushNamed('oct'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('November'),
              onTap: () => Navigator.of(context).pushNamed('nov'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('December'),
              onTap: () => Navigator.of(context).pushNamed('dec'),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            const Divider(
              color: Colors.white,
            )
          ],
        ),
      );
}
