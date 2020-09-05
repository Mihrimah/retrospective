import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrospektif/core/code_generator.dart';
import 'package:retrospektif/core/grouped_list_view.dart';
import 'package:retrospektif/model/fake_data_model.dart';
import 'package:retrospektif/repository/fake_repository.dart';
import 'package:retrospektif/template/abstract_base_template.dart';

class RetroPage extends StatelessWidget {
  String code;
  final CodeGenerator _codeGenerator = CodeGenerator();
  final snackBar = SnackBar(content: Text('Copied!'),duration: Duration(seconds: 1),);

  @override
  Widget build(BuildContext context) {
    final AbstractBaseTemplate template =
        ModalRoute.of(context).settings.arguments;
    code = _codeGenerator.generateRoomCode(template.getTemplateTypeId());

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Builder(
            builder: (context) => AppBar(title: appBarTitle(code, context),),
          ),
        ),
        body: GroupedListView(
          groupBy: (FakeDataModel t) => t.title,
          groupBuilder: (BuildContext context, String title) =>
              _headerWidget(title),
          listBuilder: (BuildContext context, FakeDataModel t) =>
              _listWidget(t.text),
          list: FakeRepository().generateData(),
        ));
  }

  Widget _headerWidget(String title) {
    return Container(
      color: Colors.lightBlue,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }

  Widget _listWidget(String text) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget appBarTitle(String code, BuildContext context) {
    return Row(
      children: [
        Text(code),
        FlatButton(
          child: Icon(Icons.content_copy),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: code));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        )
      ],
    );
  }
}
