import 'package:evolving_flutter/models/combined_model.dart';
import 'package:evolving_flutter/utils/utils.dart';
import 'package:evolving_flutter/widgets/add_expenses_wt.dart/category_list.dart';
import 'package:flutter/material.dart';

class BottomSheetCategory extends StatefulWidget {

  final CombinedModel cModel;

  const BottomSheetCategory({super.key, required this.cModel});

  @override
  State<BottomSheetCategory> createState() => _BottomSheetCategoryState();

}

class _BottomSheetCategoryState extends State<BottomSheetCategory> {

  @override
  Widget build(BuildContext context) {

    bool hasColor = false;
    bool hasIcon = false;

    if (widget.cModel.category != 'Selecciona categoría') {

      hasColor = true;

    }

    if (widget.cModel.icon.isNotEmpty) {

      hasIcon = true;

    }

    categorySelected() {

      void itemSelected(String category, String color) {

        setState(() {
          
          widget.cModel.category = category;
          widget.cModel.color = color;

        });

      }

      void iconSelected(String icon) {

        setState(() {
          
          widget.cModel.icon = icon;

        });

      }

      var catList = CategoryList().catList;

      var widgetList = [

        ListView.builder(
          
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: catList.length,
          itemBuilder: (_, i) {

            var item = catList[i];

            return ListTile(

              onTap: () {

                itemSelected(
                  
                  item.category, 
                  item.color
                  
                );

                iconSelected(
                  
                  item.icon
                  
                );

                Navigator.of(context).pop();

              },

              leading: Icon(
                
                item.icon.toIcon(),
                color: item.color.toColor(),
                size: 35,
                
              ),

              title: Text(
                
                item.category
                
              ),

              trailing: const Icon(
                
                Icons.arrow_forward_ios_outlined,
                size: 20,
                
              ),

            );

          }
          
        ),

        const Divider(

          thickness: 2,

        ),

        ListTile(

          leading: const Icon(
            
            Icons.create_new_folder_outlined, 
            size: 35
            
          ),

          title: const Text('Crear nueva categoría'),
          trailing: const Icon(
            
            Icons.arrow_forward_ios, 
            size: 20
            
          ),

          onTap: () {

            Navigator.of(context).pop();

          },

        ),

        ListTile(

          leading: const Icon(
            
            Icons.edit_outlined, 
            size: 35
            
          ),

          title: const Text('Editar / Gestionar categoría'),
          trailing: const Icon(
            
            Icons.arrow_forward_ios, 
            size: 20
            
          ),

          onTap: () {

            Navigator.of(context).pop();

          },

        ),

      ];

      showModalBottomSheet(
        
        isScrollControlled: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(

          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),

        ),

        context: context, 
        builder: (context) {

          return SizedBox(

            height: MediaQuery.of(context).size.height / 1.5,
            child: ListView(

              children: widgetList,

            ),

          );

        }
        
      );

    }

    return GestureDetector(

      onTap: () {

        categorySelected();

      },

      child: Padding(

        padding: const EdgeInsets.all(18),
        child: Row(
        
          children: [
        
            Icon(
              
              (hasIcon)
              ? widget.cModel.icon.toIcon()
              : Icons.category_outlined, 
              color: (hasColor) 
              ? widget.cModel.color.toColor()
              : Theme.of(context).dividerColor,
              size: 35
              
            ),

            const SizedBox(width: 12),
        
            Expanded(

              child: Container(
                      
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                      
                  border: Border.all(
                    
                    color: (hasColor) 
                    ? widget.cModel.color.toColor()
                    : Theme.of(context).dividerColor,
                    width: 5
                    
                  ),

                  borderRadius: BorderRadius.circular(30),
                      
                ),
                      
                child: Center(
                      
                  child: Text(widget.cModel.category),
                      
                ),
                      
              ),

            )
        
          ],
        
        ),

      ),

    );

  }

}

