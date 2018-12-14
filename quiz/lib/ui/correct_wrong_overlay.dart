import 'package:flutter/material.dart';
import 'dart:math';

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;

  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  State<StatefulWidget> createState() {
    return _CorrectWrongOverlayState();
  }
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {

Animation<double> _iconAnimation;
AnimationController _iconAnimationControler;

@override
  void initState() {
    super.initState();
    _iconAnimationControler = AnimationController(duration: Duration(seconds: 2), vsync: this);
    _iconAnimation = CurvedAnimation(parent: _iconAnimationControler, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationControler.forward();
  }

  @override
    void dispose() {
      _iconAnimationControler.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: () => widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Icon(widget._isCorrect ? Icons.done : Icons.clear, size: _iconAnimation.value * 80.0),
              ),
            ),
            Padding (padding: EdgeInsets.only(bottom: 20.0),),
            Text(
              widget._isCorrect ? 'Correct!' : 'Wrong',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            )
          ],
        ),
      ),
    );
  }
}
