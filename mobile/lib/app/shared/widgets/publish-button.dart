import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _buttonColor = Colors.blue[25];
final _fontColor = Colors.white;
final double _height = 50.0;
final double _fontSize = 18;

class PublishButton extends StatelessWidget {
  final _formKey;
  const PublishButton(this._formKey);

  Widget build(BuildContext context) {
    return ButtonTheme(
      height: _height,
      minWidth: 30.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: RaisedButton.icon(
        color: _buttonColor,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Fluttertoast.showToast(msg: "Publicando ... ");
          }
        },
        icon: FaIcon(
          FontAwesomeIcons.paperPlane,
          color: Colors.white,
        ),
        label: Text(
          "Publicar",
          style: TextStyle(
              fontSize: _fontSize,
              color: _fontColor,
              fontStyle: FontStyle.normal),
        ),
      ),
    );
  }
}
