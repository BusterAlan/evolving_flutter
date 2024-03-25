import 'package:evolving_flutter/models/combined_model.dart';
import 'package:evolving_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomSheetKeyboard extends StatefulWidget {

  final CombinedModel cModel;

  const BottomSheetKeyboard({super.key, required this.cModel});

  @override
  State<BottomSheetKeyboard> createState() => _BottomSheetKeyboardState();

}

class _BottomSheetKeyboardState extends State<BottomSheetKeyboard> {

  String import = '0.00';

  @override
  void initState() {

    import = widget.cModel.amount.toStringAsFixed(2);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    void numPad() {

      if (import == '0.00') import = '';

      expenseChange(String amount) {

        if (amount.isEmpty) amount = '0.00'; 
        widget.cModel.amount = double.parse(amount);

      }

      num(String t, double h) {

        return GestureDetector(

          behavior: HitTestBehavior.opaque,
          onTap: () {

            setState(() {

              import += t;
              widget.cModel.amount = double.parse(import);
              
            });

          },

          child: SizedBox(
          
            height: h,
            child: Center(
          
              child: Text(
                
                t, 
                style: const TextStyle(
                  
                  fontSize: 35
                  
                ),
              
              ),
              
            ),
          
          ),

        );

      }

      showModalBottomSheet(
      
        barrierColor: Colors.transparent,
        isDismissible: false,
        isScrollControlled: true,
        enableDrag: false,
        context: context, 
        builder: (BuildContext context) {

          return PopScope(

            canPop: false,
            child: Container(

              width: double.infinity,
              decoration: Constants.sheetBoxDecoration(context, Theme.of(context).scaffoldBackgroundColor),
              child: SizedBox(
              
                height: 350,
                child: LayoutBuilder(
                  
                  builder: (BuildContext context, BoxConstraints boxConstraints) {
                
                    var height = boxConstraints.biggest.height / 5;
                
                    return Column(
                
                      children: [
                
                        Table(
                
                          border: TableBorder.symmetric(
                            
                            inside: const BorderSide(width: 0.1)
                              
                          ),
                
                          children: [
                
                            TableRow(
                              
                              children: [
                
                                num('1', height),
                
                                num('2', height),
                
                                num('3', height),
                
                              ]
                              
                            ),
                
                            TableRow(
                              
                              children: [
                
                                num('4', height),
                
                                num('5', height),
                
                                num('6', height),
                
                              ]
                              
                            ),
                
                            TableRow(
                              
                              children: [
                
                                num('7', height),
                
                                num('8', height),
                
                                num('9', height),
                
                              ]
                              
                            ),
                
                            TableRow(
                              
                              children: [
                
                                num('.', height),
                
                                num('0', height),
                
                                GestureDetector(
              
                                  onTap: () {
              
                                    setState(() {
                                      
                                      if (import.isNotEmpty) {
                                        
                                        import = import.substring(0, import.length - 1);
                                        expenseChange(import);
              
                                        
                                      }
              
                                    });
              
                                  },
              
                                  onLongPress: () {
              
                                    setState(() {
                                      
                                      import = '';
                                      expenseChange(import);
              
                                    });
              
                                  },
              
                                  behavior: HitTestBehavior.opaque,
                                  child: SizedBox(
              
                                    height: height,
                                    child: const Icon(
                                      
                                      Icons.backspace,
                                      size: 35,
                                      
                                    ),
              
                                  ),
              
                                )
                
                              ]
                              
                            ),
                
                          ],
                
                        ),
              
                        Row(
              
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [ 
              
                            Expanded(
              
                              child: GestureDetector(
                              
                                child: Constants.customButton(
                                
                                  Colors.transparent, 
                                  Colors.red, 
                                  'Cancelar'
                                
                                ),
              
                                onTap: () {
              
                                  setState(() {
              
                                    import = '0.00';
                                    expenseChange(import);
                                    Navigator.pop(context);
                                    
                                  });
              
                                },
                              
                              ),
              
                            ),
              
                            Expanded(
              
                              child: GestureDetector(
                              
                                child: Constants.customButton(
                                
                                  Colors.green, 
                                  Colors.transparent, 
                                  'Aceptar'
                                
                                ),
              
                                onTap: () {
              
                                  setState(() {
              
                                    if (import.isEmpty) import = '0.00';
                                    expenseChange(import);
                                    Navigator.pop(context);
                                    
                                  });
              
                                },
                              
                              ),
              
                            ),
                            
                          ],
              
                        ),
                
                      ],
                
                    );
                
                  }
                  
                ),
              
              ),

            ),

          );

        }
        
      );

    }

    // Código para dar formato de moneda

    String Function(Match) mathFunc;
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    mathFunc = (Match match) => '${match[1]},';

    return GestureDetector(

      onTap: () => numPad(),
      child: Padding(
      
        padding: const EdgeInsets.all(18.0),
        child: Column(
        
          children: [
        
            const Text('Cantidad ingresada'),
        
            Text(
              
              '\$${import.replaceAllMapped(reg, mathFunc)}',
              style: const TextStyle(
        
                fontSize: 30,
                letterSpacing: 2,
                fontWeight: FontWeight.bold
        
              ),
              
            ),
        
          ],
        
        ),
      
      ),

    );

  }

}

