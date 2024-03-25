import 'package:evolving_flutter/models/combined_model.dart';
import 'package:flutter/material.dart';

class CommentBox extends StatelessWidget {

  final CombinedModel cModel;

  const CommentBox({super.key, required this.cModel});

  @override
  Widget build(BuildContext context) {

    String textComment = '';
    textComment = cModel.comment;

    return Padding(

      padding: const EdgeInsets.all(18),
      child: Row(
      
        children: [
      
          const Icon(
            
            Icons.sticky_note_2_outlined, 
            size: 35,
            
          ),

          const SizedBox(width: 18),
      
          Expanded(
            
            child: TextFormField(
      
              initialValue: textComment,
              cursorColor: Colors.green,
              keyboardType: TextInputType.text,
              maxLength: 10,
              decoration: InputDecoration(
      
                counterText: '',
                hintText: 'Agregar comentario (Opcional)',
                hintStyle: const TextStyle(
                  
                  fontSize: 12
                  
                ),
      
                border: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(30)
                  
                ),
      
                focusedBorder: OutlineInputBorder(
                  
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    
                    color: Colors.green
                    
                  )
                  
                ),
      
              ),

              onChanged: (String txt) {

                cModel.comment = txt;

              },
      
            )
            
          )
      
        ],
      
      ),

    );

  }

}

