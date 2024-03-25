import 'package:evolving_flutter/models/combined_model.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {

  final CombinedModel cModel;

  const DatePicker({super.key, required this.cModel});

  @override
  State<DatePicker> createState() => _DatePickerState();

}

class _DatePickerState extends State<DatePicker> {

  String selectedDate = 'Hoy';
  DateTime date = DateTime.now();

  @override
  void initState() {

    if (widget.cModel.day == 0) {

      widget.cModel.year = date.year;
      widget.cModel.month = date.month;
      widget.cModel.day = date.day;

    } else {

      selectedDate = 'Otro día';

    }

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    var widgets = <Widget>[];

    calendar() {

      showDatePicker(
        
        context: context, 
        locale: const Locale('es', 'ES'),
        initialDate: date.subtract(const Duration(days: 2)), // Antier
        firstDate: date.subtract(const Duration(days: 30)), // Hasta 1 mes antes
        lastDate: date.subtract(const Duration(days: 2)), // Antier
        
      ).then((value) => setState((){ 

        if (value != null) {

          widget.cModel.year = value.year;
          widget.cModel.month = value.month;
          widget.cModel.day = value.day;

        } else {

          setState(() {
            
            selectedDate = 'Hoy';

          });

        }
        
      }));

    }

    Map<String, DateTime> items = {

      'Ayer'     : date.subtract(const Duration(days: 1)),
      'Hoy'      : date,
      'Otro día' : date

    };

    widgets.add(const Icon(Icons.window_outlined, size: 35));

    widgets.add(const SizedBox(width: 10));

    items.forEach((name, d){

      widgets.add(
        
        Expanded(

          child: GestureDetector(
          
            onTap: () {

              setState(() {
                
                selectedDate = name;
                widget.cModel.year = d.year;
                widget.cModel.month = d.month;
                widget.cModel.day = d.day;

                if (name == 'Otro día') calendar();

              });

            },
          
            child: DateContainer(
              
              cM: widget.cModel, 
              name: name, 
              isSelected: name == selectedDate
              
            ),
          
          ),

        )
        
      );

    });

    return Padding(

      padding: const EdgeInsets.all(18),
      child: Row(
      
        children: widgets,
      
      ),

    );

  }

}

class DateContainer extends StatelessWidget {

  final CombinedModel cM;
  final String name;
  final bool isSelected;

  const DateContainer({super.key, required this.cM, required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        Padding(

          padding: const EdgeInsets.all(8.0),
          child: Container(
            
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              
              color: isSelected 
              ? Colors.green 
              : Theme.of(context).scaffoldBackgroundColor, 
              borderRadius: BorderRadius.circular(25)
              
            ),
          
            child: Center(
              
              child: Text(name)
              
            ),
            
          ),

        ),

        isSelected

        ? FittedBox(

          fit: BoxFit.fitWidth,
          child: Text('${cM.year}/${cM.month}/${cM.day}'),

        )

        :

        const Text('')

      ],

    );

  }

}

