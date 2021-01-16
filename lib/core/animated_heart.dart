import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:retrospective/model/retro_data_model.dart';
import 'package:retrospective/repository/firebase_repository.dart';

typedef void PressCallback();

class AnimatedHeart extends StatefulWidget {

  final bool liked;
  final RetroDataModel retroDataModel;
  AnimatedHeart({this.liked,this.retroDataModel});

  @override
  _AnimatedHeartState createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 15.0, end: 21.0).animate(_animationController),
      child: IconButton(
        icon: Icon(
          Icons.favorite,
          color: isLiked ? Colors.red : Colors.grey,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: () {
          print("onpressed");
          !isLiked ? doLike() : doUnlike();
        },
        iconSize: 2.0,
      ),
    );
  }

  doLike() {
    _animationController.forward();
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap =
      await transaction.get(widget.retroDataModel.document.reference);
      await transaction.update(freshSnap.reference, {
        'likeCount': freshSnap.data()['likeCount'] + 1,
      });
    });
    setState(() {
      isLiked = true;
    });

  }

  doUnlike() {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot freshSnap =
      await transaction.get(widget.retroDataModel.document.reference);
      await transaction.update(freshSnap.reference, {
        'likeCount': freshSnap.data()['likeCount'] - 1,
      });
    });
    setState(() {
      isLiked = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationController
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _animationController.reverse();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
