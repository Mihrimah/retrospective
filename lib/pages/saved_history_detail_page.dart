import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:retrospektive/core/grouped_list_view.dart';
import 'package:retrospektive/model/retro_data_model.dart';
import 'package:retrospektive/pages/waiting_content_page.dart';
import 'package:retrospektive/repository/local_repository.dart';
import 'package:retrospektive/template/abstract_base_template.dart';
import 'package:retrospektive/template/fourls.dart';
import 'package:retrospektive/template/lean_coffee.dart';
import 'package:retrospektive/template/mad_glad_sad.dart';
import 'package:retrospektive/template/sailorboat.dart';
import 'package:retrospektive/template/starfish.dart';
import 'package:retrospektive/template/stop_start_continue.dart';
import 'package:retrospektive/template/what_went_well.dart';
import 'package:retrospektive/template/wrap.dart';

class SavedHistoryDetailPage extends StatefulWidget {
  final String roomCode;
  final AbstractBaseTemplate template;
  final LocalRepository localRepository;

  SavedHistoryDetailPage(this.roomCode, this.localRepository, this.template);

  @override
  _SavedHistoryDetailPageState createState() => _SavedHistoryDetailPageState();
}

class _SavedHistoryDetailPageState extends State<SavedHistoryDetailPage> {
  List<RetroDataModel> list;

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
                widget.template.getTemplateName(),
                style: TextStyle(fontSize: 20),
              ),
              flexibleSpace: appBarTitle(widget.roomCode, context),
            ),
          ),
        ),
        body: FutureBuilder(
          future: retrieveSavedRoomData(widget.roomCode),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return buildWaitingScreen();
            if (snapshot.data.length == 0) return WaitingContentPage();
            return GroupedListView(
              groupBy: (RetroDataModel t) => t.templateTitle,
              groupBuilder: (BuildContext context, String title) =>
                  _listGroupedHeaderWidget(title),
              listBuilder: (BuildContext context, RetroDataModel t) =>
                  _listRowWidget(t),
              list: snapshot.data,
            );
          },
        ));
  }

  Future<List<RetroDataModel>> retrieveSavedRoomData(String roomCode) async {
    return await widget.localRepository.getRoomDataFromStorage(roomCode);
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
          onPressed: () {},
        ),
      ],
    );
  }

  Widget favouriteIcon(RetroDataModel retroDataModel) {
    return Icon(
      Icons.favorite,
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
                Clipboard.setData(ClipboardData(text: widget.roomCode));
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Copied!'),
                  duration: Duration(seconds: 1),
                ));
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
