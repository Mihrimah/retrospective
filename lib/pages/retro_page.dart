import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrospective/core/grouped_list_view.dart';
import 'package:retrospective/localization/retrospective_localization.dart';
import 'package:retrospective/model/retro_data_model.dart';
import 'package:retrospective/model/retro_page_params.dart';
import 'package:retrospective/pages/waiting_content_page.dart';
import 'package:retrospective/repository/firebase_repository.dart';
import 'package:retrospective/repository/local_repository.dart';
import 'package:retrospective/core/mailer.dart' as Mail;
import 'add_new_content_page.dart';

class RetroPage extends StatefulWidget {
  final RetroPageParams retroPageParams;

  RetroPage(this.retroPageParams);

  @override
  _RetroPageState createState() => _RetroPageState();
}

class _RetroPageState extends State<RetroPage> with WidgetsBindingObserver {
  final FirebaseRepository _firebaseRepository = FirebaseRepository();
  LocalRepository _localRepository;
  Set likedRowsSet = new HashSet();
  int givenLikeCount = 0;
  List<RetroDataModel> list;
  int savedRecordlen = 0;
  TextEditingController _textEditingController = TextEditingController();
  bool isEnabled = false;
  int activeMember = 0;
  AppLifecycleState oldState;

  final snackBar = SnackBar(
    content: Text('Copied!'),
    duration: Duration(seconds: 1),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _localRepository = LocalRepository();
    _localRepository
        .getNumberOfSavedRecord()
        .then((value) => savedRecordlen = value);
    print("init state retro page");
    _firebaseRepository.increaseActiveMember(widget.retroPageParams.roomCode);
    _firebaseRepository
        .findRoomsDetail(widget.retroPageParams.roomCode)
        .listen((event) {
      setState(() {
        activeMember = event.data()["activeMember"];
      });
    });
    oldState = AppLifecycleState.resumed;
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _firebaseRepository.decreaseActiveMember(widget.retroPageParams.roomCode);
    print("dispose ran retro page");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("state : " + state.toString());
    if ((state == AppLifecycleState.inactive ||
            state == AppLifecycleState.detached ||
            state == AppLifecycleState.paused) &&
        oldState == AppLifecycleState.resumed) {
      _firebaseRepository.decreaseActiveMember(widget.retroPageParams.roomCode);
      print("didChangeAppLifecycleState ran retro page");
    } else if (state == AppLifecycleState.resumed) {
      _firebaseRepository.increaseActiveMember(widget.retroPageParams.roomCode);
    }
    oldState = state;
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
              flexibleSpace: appBarTitle(
                  RetrospectiveLocalization.of(context).shareCode,
                  activeMember,
                  context),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.mail,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text(
                              RetrospectiveLocalization.of(context).sendMail),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          content: TextFormField(
                            decoration: InputDecoration(
                              hintText: RetrospectiveLocalization.of(context)
                                  .emailAddress,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            controller: _textEditingController,
                          ),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
                            new FlatButton(
                                child: new Text(
                                    RetrospectiveLocalization.of(context).send,
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                onPressed: () {
                                  if (_textEditingController.value.text !=
                                          null &&
                                      _textEditingController.value.text != '')
                                    sendMail(context,
                                        _textEditingController.value.text);
                                  Navigator.of(context).pop();
                                }),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.save,
                    size: 30,
                  ),
                  onPressed: () {
                    if (savedRecordlen < 5) {
                      _localRepository.addRoomDataToStorage(
                          widget.retroPageParams.roomCode, list);
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content:
                            Text(RetrospectiveLocalization.of(context).save),
                        duration: Duration(seconds: 2),
                      ));
                    } else
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(RetrospectiveLocalization.of(context)
                            .maxSavedDataMessage),
                        duration: Duration(seconds: 2),
                      ));
                  },
                ),
              ],
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
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: getRoomDataStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return buildWaitingScreen();
                  if (snapshot.data.documents.length == 0)
                    return WaitingContentPage();
                  list = RetroDataModel.toBuilder(snapshot);
                  return GroupedListView(
                    groupBy: (RetroDataModel t) => t.templateTitle,
                    groupBuilder: (BuildContext context, String title) =>
                        _listGroupedHeaderWidget(title),
                    listBuilder: (BuildContext context, RetroDataModel t) =>
                        _listRowWidget(t),
                    list: list,
                  );
                },
              ),
            ),
          ],
        ));
  }

  sendMail(BuildContext context, String toAddress) async {
    Mail.Mailer m = Mail.Mailer(list: list, toAddress: toAddress);
    try {
      if (list == null || list.isEmpty) throw new NoListFoundException();

      await m.sendMail();
      Scaffold.of(context).showSnackBar(SnackBar(
        content:
            Text(RetrospectiveLocalization.of(context).successEmailRequest),
        duration: Duration(seconds: 2),
      ));
    } on NoListFoundException {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(RetrospectiveLocalization.of(context).noListFound),
        duration: Duration(seconds: 2),
      ));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(RetrospectiveLocalization.of(context).failEmailRequest +
            e.toString()),
        duration: Duration(seconds: 2),
      ));
    }
  }

  Stream getRoomDataStream() {
    return _firebaseRepository.getRoomDataStream(
        widget.retroPageParams.roomCode,
        widget.retroPageParams.template.getTemplateTypeId());
  }

  Widget _listGroupedHeaderWidget(String title) {
    return Container(
      color: Colors.blueAccent,
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
      return Icon(
        Icons.favorite,
      );
  }

  Widget appBarTitle(String code, int activeMember, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_rounded,
              size: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  activeMember.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
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

class NoListFoundException implements Exception {}
