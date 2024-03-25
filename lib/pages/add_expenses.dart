import 'package:evolving_flutter/models/combined_model.dart';
import 'package:evolving_flutter/utils/constants.dart';
import 'package:evolving_flutter/widgets/add_expenses_wt.dart/bottom_sheet_category.dart';
import 'package:evolving_flutter/widgets/add_expenses_wt.dart/bottom_sheet_keyboard.dart';
import 'package:evolving_flutter/widgets/add_expenses_wt.dart/comment_box.dart';
import 'package:evolving_flutter/widgets/add_expenses_wt.dart/date_picker.dart';
import 'package:flutter/material.dart';

class AddExpenses extends StatelessWidget {

  const AddExpenses({super.key});

  @override
  Widget build(BuildContext context) {

    final CombinedModel cM = CombinedModel();

    return Scaffold(
    
      appBar: AppBar(title: const Text('Agregar gasto')),
      body: Column(
    
        children: [
    
          BottomSheetKeyboard(cModel: cM),
    
          Expanded(
    
            child: Container(
            
              width: double.infinity,
              decoration: Constants.sheetBoxDecoration(context, null),
              child: Column(
    
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
    
                  DatePicker(cModel: cM),
    
                  BottomSheetCategory(cModel: cM),
    
                  CommentBox(cModel: cM),
    
                  Expanded(
                    
                    child: Center(
                      
                      child: GestureDetector(
                        
                        onTap: () {

                          //
    
                        },
                        
                        child: const Text('Botón OK'),
                        
                      )
                      
                    )
                    
                  ),
    
                ],
    
              ),
            
            ),
    
          ),
    
        ],
    
      )
    
    );

  }

}

