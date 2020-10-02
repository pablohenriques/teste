import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ceulp.exitus/app/shared/widgets/custom_media_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:multi_image_picker/multi_image_picker.dart';

// ignore: must_be_immutable
class NewOpportunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar Oportunidade"),
      ),
      body: Center(
        child: OpportunityForm(),
      ),
    );
  }
}

// Define  um widget Form customizado
class OpportunityForm extends StatefulWidget {
  @override
  OpportunityFormState createState() {
    return OpportunityFormState();
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}

// Define a classe State que vai tratar os dados do Form
class OpportunityFormState extends State<OpportunityForm> {
  get _formKey => GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  List<ListItem> _dropdownItems = [
    ListItem(1, "Estágio"),
    ListItem(2, "CLT"),
    ListItem(3, "Evento"),
    ListItem(4, "Voluntariado")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (_image != null)
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage(_image.path),
                        ),
                      ),
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.95),
                ),
              Divider(
                color: Colors.white,
              ),
              if (_image == null)
                RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  color: Colors.blue,
                  onPressed: getImage,
                  icon: FaIcon(
                    FontAwesomeIcons.arrowAltCircleUp,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Inserir Capa",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Título',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Esta informação é necessária.';
                    }
                    return null;
                  },
                ),
              ),
              Divider(
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Descrição',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Esta informação é necessária.';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton<ListItem>(
                    isExpanded: true,
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    }),
              ),
              Divider(
                color: Colors.white,
              ),
              Container(
                child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  color: Colors.blue,
                  onPressed: () => {},
                  icon: FaIcon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Cadastrar",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
            ]),
      );
}
