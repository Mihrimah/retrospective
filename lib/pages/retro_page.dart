import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrospektive/core/grouped_list_view.dart';
import 'package:retrospektive/model/retro_data_model.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/pages/waiting_content_page.dart';
import 'package:retrospektive/repository/firebase_repository.dart';

import 'add_new_content_page.dart';

class RetroPage extends StatefulWidget {
  final RetroPageParams retroPageParams;

  RetroPage(this.retroPageParams);

  @override
  _RetroPageState createState() => _RetroPageState();
}

class _RetroPageState extends State<RetroPage>{
  final FirebaseRepository _firebaseRepository = FirebaseRepository();

  Set likedRowsSet = new HashSet();
  int givenLikeCount = 0;

  final snackBar = SnackBar(
    content: Text('Copied!'),
    duration: Duration(seconds: 1),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Builder(
            builder: (context) => AppBar(
              title: Text(
                widget.retroPageParams.template.getTemplateName(),
                style: TextStyle(fontSize: 20),
              ),
              flexibleSpace:
                  appBarTitle(widget.retroPageParams.roomCode, context),
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
                  builder: (context) => AddNewContentPage(
                      widget.retroPageParams, _firebaseRepository)),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: StreamBuilder(
          stream: getRoomDataStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return buildWaitingScreen();
            if (snapshot.data.documents.length == 0)
              return WaitingContentPage();
            List<RetroDataModel> list = RetroDataModel.toBuilder(snapshot);
            return GroupedListView(
              groupBy: (RetroDataModel t) => t.templateTitle,
              groupBuilder: (BuildContext context, String title) =>
                  _listGroupedHeaderWidget(title),
              listBuilder: (BuildContext context, RetroDataModel t) =>
                  _listRowWidget(t),
              list: list,
            );
          },
        ));
  }

  Stream getRoomDataStream() {
    return _firebaseRepository.getRoomDataStream(
        widget.retroPageParams.roomCode,
        widget.retroPageParams.template.getTemplateTypeId());
  }

  Widget _listGroupedHeaderWidget(String title) {
    return Container(
      color: Colors.lightBlue,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(0),
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

  Widget _listRowWidget(RetroDataModel retroDataModel) {
    return ListTile(
      title: Text(
        retroDataModel.textContent,
        style: TextStyle(fontSize: 16),
      ),
      trailing: _favouriteCountAndIcon(retroDataModel),
    );
  }

  Widget _favouriteCountAndIcon(RetroDataModel retroDataModel) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          retroDataModel.likeCount.toString(),
          style: TextStyle(fontSize: 15),
        ),
        //Text(givenLikeCount.toString()),
        IconButton(
            icon: favouriteIcon(retroDataModel),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              favouriteIconOnPress(retroDataModel);
            },
          ),
      ],
    );
  }

  favouriteIconOnPress(RetroDataModel retroDataModel) {
    if (likedRowsSet.contains(retroDataModel.document.id)) {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot freshSnap =
            await transaction.get(retroDataModel.document.reference);
        await transaction.update(freshSnap.reference, {
          'likeCount': freshSnap.data()['likeCount'] - 1,
        });
      });
      likedRowsSet.remove(retroDataModel.document.id);
      setState(() {
        givenLikeCount = givenLikeCount - 1;
      });
    } else {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot freshSnap =
            await transaction.get(retroDataModel.document.reference);
        await transaction.update(freshSnap.reference, {
          'likeCount': freshSnap.data()['likeCount'] + 1,
        });
      });
      likedRowsSet.add(retroDataModel.document.id);
      setState(() {
        givenLikeCount = givenLikeCount + 1;
      });
    }
  }

  Widget favouriteIcon(RetroDataModel retroDataModel) {
    if (likedRowsSet.contains(retroDataModel.document.id))
      return Icon(Icons.favorite, color: Colors.red);
    else
      return Icon(Icons.favorite,);
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
                    ClipboardData(text: widget.retroPageParams.roomCode));
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
