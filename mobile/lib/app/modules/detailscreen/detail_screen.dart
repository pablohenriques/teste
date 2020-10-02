import 'dart:io';

import 'package:ceulp.exitus/app/shared/widgets/custom_media_picker.dart';
import 'package:ceulp.exitus/app/shared/widgets/input-description.dart';
import 'package:ceulp.exitus/app/shared/widgets/publish-button.dart';
import 'package:flutter/material.dart';

import 'widget/custom_image.dart';
import 'widget/custom_video.dart';

class DetailPage extends StatefulWidget {
  final dataType, data;

  const DetailPage(this.dataType, this.data);

  @override
  _DetailPageState createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  ScrollController _scroll;
  FocusNode _focus = new FocusNode();
  final _formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode;

  @override
  void initState() {
    super.initState();

    _scroll = new ScrollController();
    _focus.addListener(() {
      _scroll.jumpTo(-1.0);
    });
    this.passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    this.passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Nova Publicação",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: new DropdownButtonHideUnderline(
        child: new SafeArea(
          top: false,
          bottom: false,
          child: new ListView(
            controller: _scroll,
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              (widget.dataType as ResultType == ResultType.IMAGE_PATH)
                  ? CustomImage(widget.data as File)
                  : CustomVideo(widget.data as File),
              Container(
                padding: EdgeInsets.all(20),
              ),
              MediaDetails(_formKey),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: PublishButton(_formKey),
      ),
    );
  }
}
