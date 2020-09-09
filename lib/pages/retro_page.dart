import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrospektive/core/grouped_list_view.dart';
import 'package:retrospektive/model/fake_data_model.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/pages/waiting_content_page.dart';
import 'package:retrospektive/repository/fake_repository.dart';
import 'package:retrospektive/repository/firebase_repository.dart';

import 'add_new_content_page.dart';

class RetroPage extends StatelessWidget {
  RetroPageParams retroPageParams;
  final FakeRepository _fakeRepository = FakeRepository();
  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  final snackBar = SnackBar(
    content: Text('Copied!'),
    duration: Duration(seconds: 1),
  );

  RetroPage(this.retroPageParams);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Builder(
            builder: (context) => AppBar(
              title: appBarTitle(retroPageParams.roomCode, context),
              actions: [
                FlatButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddNewContentPage(retroPageParams,_fakeRepository)),
                    );
                    Navigator.pushNamed(context, "/add_new_content",arguments: retroPageParams);
                  },
                )
              ],
            ),
          ),
        ),
        body: StreamBuilder(
          stream: _firebaseRepository.getRoomDataStream(retroPageParams.roomCode,retroPageParams.template.getTemplateTypeId()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return buildWaitingScreen();
            if (snapshot.data.documents.length == 0) return WaitingContentPage();
            List<FakeDataModel> list = FakeDataModel.toBuilder(snapshot);
            return GroupedListView(
              groupBy: (FakeDataModel t) => t.templateTitle,
              groupBuilder: (BuildContext context, String title) =>
                  _headerWidget(title),
              listBuilder: (BuildContext context, FakeDataModel t) =>
                  _listWidget(t),
              list: list,
            );
          },
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

  Widget _listWidget(FakeDataModel fakeDataModel) {
    return ListTile(
      title: Text(
        fakeDataModel.textContent,
        style: TextStyle(fontSize: 16),
      ),
      trailing: _favouriteCountAndIcon(fakeDataModel.likeCount),
    );
  }

  Widget _favouriteCountAndIcon(int likeCount) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          likeCount.toString(),
          style: TextStyle(fontSize: 15),
        ),
        IconButton(
          icon: Icon(Icons.favorite,color: Colors.red,),
          onPressed: () {
            print("kalp!");
          },
        )
      ],
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

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
