// ignore_for_file: avoid_print

import 'dart:math';

import 'package:evolving_flutter/widgets/balance_page_wt.dart/back_sheet.dart';
import 'package:evolving_flutter/widgets/balance_page_wt.dart/custom_floating_action_button.dart';
import 'package:evolving_flutter/widgets/balance_page_wt.dart/front_sheet.dart';
import 'package:flutter/material.dart';

class BalancePage extends StatefulWidget {

  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();

}

class _BalancePageState extends State<BalancePage> {

  final _scrollController = ScrollController();
  double _offset = 0;

  void _listener() {

    setState((){ _offset = _scrollController.offset / 100; });

  }

  @override
  void initState() {
    
    super.initState();
    _max;
    _scrollController.addListener(_listener);

  }

  @override
  void dispose() {

    super.dispose();
    _scrollController.dispose();
    _scrollController.removeListener(_listener);

  }

  double get _max => max(90 - _offset * 90, 0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: const CustomFAB(),
      body: CustomScrollView(
      
        controller: _scrollController,
        slivers: [
      
          const SliverAppBar(
      
            elevation: 0,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
      
              background: Column(
      
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
      
                  Text(
                    
                    '\$2,500.00',
                    style: TextStyle(
      
                      fontSize: 30,
                      color: Colors.green
      
                    ),
                    
                  ),
      
                  Text(
                    
                    'Balance',
                    style: TextStyle(
      
                      fontSize: 14,
      
                    ),
                    
                  ),
      
                ],
      
              ),
      
            ),
      
          ),
      
          SliverList(
            
            delegate: SliverChildListDelegate(
            
              [
      
                Stack(
      
                  children: [
      
                    const BackSheet(),
      
                    Padding(
      
                      padding: EdgeInsets.only(top: _max),
                      child: const FrontSheet(),
      
                    )
      
                  ],
      
                )
      
              ]
            
            )
            
          )
      
        ],
      
      ),

    );

  }

}

