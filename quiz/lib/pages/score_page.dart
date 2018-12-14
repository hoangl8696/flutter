import 'package:flutter/material.dart';

import './landing_page.dart';

class ScorePage extends StatelessWidget {
  final int _score;
  final int _totalQuestion;

  ScorePage(this._score, this._totalQuestion);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Score: ',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50.0),
          ),
          Text(
            '${_score.toString()} / ${_totalQuestion.toString()}',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50.0),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => LandingPage()),
                (Route route) => route == null),
          )
        ],
      ),
    );
  }
}
