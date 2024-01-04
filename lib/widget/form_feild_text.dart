import 'package:flutter/material.dart';
class From_Feild_Text extends StatelessWidget {
  final String errorText;
  final TextEditingController textController;
  final String hinText;
   From_Feild_Text({
    super.key,
    required this.textController, required this.hinText, required this.errorText,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: textController,
      validator: (String?value){
        if(value?.isEmpty ?? true){
          return "Enter $errorText";
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.greenAccent,
          filled: true,
          hintText: hinText,
          border: OutlineInputBorder(

              borderSide: BorderSide.none

          )
      ),

    );
  }
}
