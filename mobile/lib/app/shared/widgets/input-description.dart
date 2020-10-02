import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter_tags/flutter_tags.dart';

class MediaDetails extends StatefulWidget {
  final _formKey;

  MediaDetails(this._formKey);

  @override
  _MediaDetailsState createState() => _MediaDetailsState();
}

class _MediaDetailsState extends State<MediaDetails> {
  AutoCompleteTextField searchTextField;
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  bool loading = true;
  List<String> marked = [];
  List<String> suggestions = [
    "Fábio Castro",
    "Vinícius Dias",
    "Vinícius Dias 2",
    "Carlos Barros",
  ];

  SimpleAutoCompleteTextField textField;
  bool showWhichErrorText = false;
  double _fontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _tags,
          Divider(
            color: Colors.white,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Legenda',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Esta informação é necessária.';
              }
              return null;
            },
          ),
          Divider(
            color: Colors.white,
          ),
          Column(
            children: <Widget>[
              searchTextField = AutoCompleteTextField<String>(
                key: key,
                clearOnSubmit: false,
                suggestions: suggestions,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                decoration: InputDecoration(
                  labelText: 'Marcar Pessoa',
                  hintStyle: TextStyle(color: Colors.black),
                ),
                itemFilter: (item, query) {
                  return item.toLowerCase().startsWith(query.toLowerCase());
                },
                itemSorter: (a, b) {
                  return a.compareTo(b);
                },
                itemSubmitted: (item) {
                  setState(() {
                    marked.add(item);
                    searchTextField.textField.controller.text = "";
                  });
                },
                itemBuilder: (context, item) {
                  // ui for the autocompelete row
                  return row(item);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _tags {
    return Tags(
      key: _tagStateKey,
      symmetry: false,
      columns: 0,
      horizontalScroll: false,
      //verticalDirection: VerticalDirection.up, textDirection: TextDirection.rtl,
      heightHorizontalScroll: 60 * (_fontSize / 14),
      itemCount: marked.length,
      itemBuilder: (index) {
        final item = marked[index];

        return ItemTags(
          key: Key(index.toString()),
          index: index,
          title: item,
          pressEnabled: true,
          activeColor: Colors.blueGrey[600],
          singleItem: false,
          splashColor: Colors.green,
          combine: ItemTagsCombine.withTextBefore,
          removeButton: ItemTagsRemoveButton(
            onRemoved: () {
              setState(() {
                marked.removeAt(index);
              });
              return true;
            },
          ),
          textScaleFactor:
              utf8.encode(item.substring(0, 1)).length > 2 ? 0.8 : 1,
          textStyle: TextStyle(
            fontSize: _fontSize,
          ),
          onPressed: (item) => print(item),
        );
      },
    );
  }

  Widget row(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "  " + text,
          style: TextStyle(
            fontSize: 16.0,
            height: 2,
          ),
        ),
        Divider()
      ],
    );
  }
}
