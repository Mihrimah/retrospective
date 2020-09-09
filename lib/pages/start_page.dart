import 'package:flutter/material.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/template/abstract_base_template.dart';
import 'package:retrospektive/template/mad_glad_sad.dart';
import 'package:retrospektive/template/starfish.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String code;
  TextEditingController _textEditingController = TextEditingController();
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 50, left: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/choose_template");
                          },
                          child: Text("Create Room",
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Room code',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          controller: _textEditingController,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: double.infinity,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: RaisedButton(
                          onPressed: isEnabled ? (){
                            Navigator.pushNamed(context, "/retro", arguments: RetroPageParams(_parseRoomCode(_textEditingController.text), _textEditingController.text));
                          } : null,
                          child: Text("Join Room"),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _textEditingController.addListener(_checkButtonEnable);
  }

  _checkButtonEnable() {
    if (_textEditingController == null ||
        _textEditingController.text == '' ||
        _textEditingController.text == null) {
      setState(() {
        isEnabled = false;
      });
    } else {
      setState(() {
        isEnabled = true;
      });
    }
  }

  AbstractBaseTemplate _parseRoomCode(String roomCode){
    int firstNumber =int.parse(roomCode.substring(0,1));
    if(firstNumber == 1) return  MadGladSad();
    else if (firstNumber == 2) return  Starfish();
    else return  MadGladSad();
  }
/*RaisedButton joinButton(BuildContext context, String value) {
    var onPress;
    if (value == null)
      onPress = null;
    else
      onPress = () {
        print("value " + value);
        Navigator.pushNamed(context, "/join_room");
      };*/
}
