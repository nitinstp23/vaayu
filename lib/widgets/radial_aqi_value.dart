import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

import 'package:vaayu/themes/colors.dart';

class RadialAqiValue extends StatefulWidget {
  final double aqiValue;

  const RadialAqiValue({Key key, this.aqiValue}) : super(key: key);

  @override
  _RadialAqiValueState createState() => _RadialAqiValueState();
}

class _RadialAqiValueState extends State<RadialAqiValue> with SingleTickerProviderStateMixin {
  AnimationController _radialAqiValueAnimationController;
  Animation<double> _progressAnimation;

  final double progressMultiplier = 0.5;
  final Duration fadeInDuration = Duration(milliseconds: 500);
  final Duration fillDuration = Duration(seconds: 1);

  double progressDegrees = 0;

  @override
  void initState() {
    super.initState();

    _radialAqiValueAnimationController =
        AnimationController(vsync: this, duration: fillDuration);

    _progressAnimation = Tween(begin: 0.0, end: widget.aqiValue).animate(CurvedAnimation(
        parent: _radialAqiValueAnimationController, curve: Curves.easeIn))
      ..addListener(() {
        setState(() {
          progressDegrees = progressMultiplier * _progressAnimation.value;
        });
      });

    _radialAqiValueAnimationController.forward();
  }

  @override
  void dispose() {
    _radialAqiValueAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${widget.aqiValue}',
              style: TextStyle(
                color: greyColor,
                fontSize: 40.0,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Container(
              height: 5.0,
              width: 80.0,
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              '(AQI)',
              style: TextStyle(
                fontSize: 14.0,
                color: greyColor,
                letterSpacing: 1.5
              ),
            ),
          ],
        ),
      ),
      painter: RadialPainter(progressDegrees),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;

  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
              colors: [
                secondColor,
                secondColor,
              ])
          .createShader(Rect.fromCircle(center: center, radius: size.width / 2))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
