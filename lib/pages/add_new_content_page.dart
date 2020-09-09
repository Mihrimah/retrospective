import 'package:flutter/material.dart';
import 'package:retrospektive/model/retro_page_params.dart';
import 'package:retrospektive/repository/fake_repository.dart';
import 'package:retrospektive/repository/firebase_repository.dart';
import 'package:retrospektive/template/abstract_base_template.dart';

class AddNewContentPage extends StatefulWidget {
  AddNewContentPage(this._retroPageParams, this._fakeRepository, this._firebaseRepository);

  RetroPageParams _retroPageParams;
  FakeRepository _fakeRepository;
  FirebaseRepository _firebaseRepository;

  @override
  _AddNewContentPageState createState() => _AddNewContentPageState();
}

class _AddNewContentPageState extends State<AddNewContentPage> {
  TextEditingController _addContentTextController = TextEditingController();
  TextEditingController _selectTitleTextController = TextEditingController();
  String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget._retroPageParams.template.titles[0];
  }

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
                        width: double.infinity,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: widget._retroPageParams.template.titles
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                        width: double.infinity,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Add Content',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          controller: _addContentTextController,
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
                          onPressed: () {
                            widget._firebaseRepository.createDocument(
                                _addContentTextController.text,
                                dropdownValue,
                                widget._retroPageParams.roomCode,
                                widget._retroPageParams.template);
                            Navigator.pop(context);
                          },
                          child: Text("Add"),
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
}
