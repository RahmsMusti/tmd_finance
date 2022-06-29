import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tmd_finance/src/pages/budget_page_apr.dart';
import 'package:tmd_finance/src/pages/budget_page_aug.dart';
import 'package:tmd_finance/src/pages/budget_page_dec.dart';
import 'package:tmd_finance/src/pages/budget_page_feb.dart';
import 'package:tmd_finance/src/pages/budget_page_jul.dart';
import 'package:tmd_finance/src/pages/budget_page_jun.dart';
import 'package:tmd_finance/src/pages/budget_page_mar.dart';
import 'package:tmd_finance/src/pages/budget_page_may.dart';
import 'package:tmd_finance/src/pages/budget_page_nov.dart';
import 'package:tmd_finance/src/pages/budget_page_oct.dart';
import 'package:tmd_finance/src/pages/budget_page_sep.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'pages/budget_page_jan.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class TmdBudget extends StatelessWidget {
  const TmdBudget({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case BudgetPageDec.routeName:
                    return const BudgetPageDec(items: []);
                  case BudgetPageNov.routeName:
                    return const BudgetPageNov(items: []);
                  case BudgetPageOct.routeName:
                    return const BudgetPageOct(items: []);
                  case BudgetPageSep.routeName:
                    return const BudgetPageSep(items: []);
                  case BudgetPageAug.routeName:
                    return const BudgetPageAug(items: []);
                  case BudgetPageJul.routeName:
                    return const BudgetPageJul(items: []);
                  case BudgetPageJun.routeName:
                    return const BudgetPageJun(items: []);
                  case BudgetPageMay.routeName:
                    return const BudgetPageMay(items: []);
                  case BudgetPageApr.routeName:
                    return const BudgetPageApr(items: []);
                  case BudgetPageMar.routeName:
                    return const BudgetPageMar(items: []);
                  case BudgetPageFeb.routeName:
                    return const BudgetPageFeb(items: []);
                  case BudgetPageJan.routeName:
                  default:
                    return const BudgetPageJan(items: []);
                }
              },
            );
          },
        );
      },
    );
  }
}
