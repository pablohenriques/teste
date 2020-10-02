import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  var label = "";

  CustomInput({
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      // controller: bloc.heigthCtrl,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
