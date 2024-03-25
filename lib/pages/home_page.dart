import 'package:evolving_flutter/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:evolving_flutter/providers/ui_provider.dart';

import 'package:evolving_flutter/widgets/home_page_wt.dart/custom_navigation_bar.dart';

import 'package:evolving_flutter/pages/balance_page.dart';
import 'package:evolving_flutter/pages/charts_page.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(

      bottomNavigationBar: CustomNavBar(),
      body: _HomePage(),

    );

  }

}

class _HomePage extends StatelessWidget {

  const _HomePage();

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndex = uiProvider.bnbIndex;

    switch (currentIndex) {

      case 0:

        return const BalancePage();

      case 1:

        return const ChartsPage();

      case 2:

        return const SettingPage();

      default:

        return const BalancePage();

    }

  }

}

