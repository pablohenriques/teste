import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomForm extends StatefulWidget {
  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

class ListItem {
  String value;
  String label;

  ListItem({
    @required this.value,
    @required this.label,
  });
}

class CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  String _nome;
  String _sobrenome;
  String _sobre;
  String _sexo;
  String _telefone;
  String _pais;
  String _uf;
  String _cidade;
  String _foto;

  List<ListItem> _dropdownItems = [
    ListItem(value: 'masculino', label: "Masculino"),
    ListItem(value: 'feminino', label: "Feminino"),
    ListItem(value: 'outros', label: "Outros"),
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
          child: Text(listItem.label),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Widget _buildNome() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(labelText: 'Nome'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, informe o nome';
        }
        return null;
      },
      onSaved: (value) {
        _nome = value;
      },
    );
  }

  Widget _buildSobrenome() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sobrenome'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Por favor, informe o sobrenome';
        }
        return null;
      },
      onSaved: (value) {
        _sobrenome = value;
      },
    );
  }

  Widget _buildSobre() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Sobre'),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Por favor, informe o sobre';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        _sobre = value;
      },
    );
  }

  Widget _buildSexo() {
    return DropdownButton<ListItem>(
        isExpanded: true,
        value: _selectedItem,
        items: _dropdownMenuItems,
        onChanged: (value) {
          setState(() {
            _sexo = value.value;
          });
        });
  }

  Widget _buildTelefone() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Telefone/WhatsApp'),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Por favor, informe o Telefone/WhatsApp';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        _telefone = value;
      },
    );
  }

  Widget _buildPais() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'País'),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Por favor, informe o país';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        _pais = value;
      },
    );
  }

  Widget _buildUF() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Estado UF'),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Por favor, informe a UF';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        _uf = value;
      },
    );
  }

  Widget _buildCidade() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Cidade'),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Por favor, informe o nome';
      //   }
      //   return null;
      // },
      onSaved: (value) {
        _cidade = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildNome(),
              _buildSobrenome(),
              _buildSobre(),
              _buildSexo(),
              _buildTelefone(),
              _buildPais(),
              _buildUF(),
              _buildCidade(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Aguarde...')));
                      }
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.checkCircle,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Salvar",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
