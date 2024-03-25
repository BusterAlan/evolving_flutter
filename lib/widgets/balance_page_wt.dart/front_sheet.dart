import 'package:evolving_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class FrontSheet extends StatelessWidget {

  const FrontSheet({super.key});

  @override
  Widget build(BuildContext context) {

    var list = List.generate(10, (index) => Padding(
      
      padding: const EdgeInsets.all(10),
      child: Container(

        height: 150,
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).primaryColorDark

        )

      ),
      
    ));

    return Container(
                      
      height: 800,
      decoration: Constants.sheetBoxDecoration(context, null),
      child: ListView(

        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: list,

      ),
      
    );

  }

}

