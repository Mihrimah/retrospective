import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrospektive/core/grouped_list_view.dart';
import 'package:retrospektive/model/fake_data_model.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/pages/waiting_content_page.dart';
import 'package:retrospektive/repository/firebase_repository.dart';

import 'add_new_content_page.dart';

class RetroPage extends StatelessWidget {
  RetroPageParams retroPageParams;
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
          preferredSize: Size.fromHeight(90),
          child: Builder(
            builder: (context) => AppBar(
              title: Text(
                retroPageParams.template.getTemplateName(),
                style: TextStyle(fontSize: 20),
              ),
              flexibleSpace: appBarTitle(retroPageParams.roomCode, context),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddNewContentPage(retroPageParams, _firebaseRepository)),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: StreamBuilder(
          stream: _firebaseRepository.getRoomDataStream(
              retroPageParams.roomCode,
              retroPageParams.template.getTemplateTypeId()),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return buildWaitingScreen();
            if (snapshot.data.documents.length == 0)
              return WaitingContentPage();
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
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(3),
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
      trailing: _favouriteCountAndIcon(fakeDataModel),
    );
  }

  Widget _favouriteCountAndIcon(FakeDataModel fakeDataModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          fakeDataModel.likeCount.toString(),
          style: TextStyle(fontSize: 15),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onPressed: () {
            FirebaseFirestore.instance.runTransaction((transaction) async {
              DocumentSnapshot freshSnap =
              await transaction.get(fakeDataModel.document.reference);
              await transaction.update(freshSnap.reference, {
                'likeCount': freshSnap.data()['likeCount'] + 1,
              });
            });
          },
        )
      ],
    );
  }

  Widget appBarTitle(String code, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              code,
              style: TextStyle(fontSize: 20),
            ),
            IconButton(
              icon: Icon(
                Icons.content_copy,
                size: 20,
              ),
              onPressed: () {
                Clipboard.setData(
                    ClipboardData(text: retroPageParams.roomCode));
                Scaffold.of(context).showSnackBar(snackBar);
              },
            ),
          ],
        ),
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
