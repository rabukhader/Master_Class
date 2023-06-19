import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:master_class/config/themes/app_colors.dart';

class BackgroundDecoretion extends StatelessWidget {
  final Widget child;
  final bool showGradient;
  const BackgroundDecoretion(
      {super.key, required this.child, this.showGradient = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              color: showGradient ? null : Theme.of(context).primaryColor,
              gradient: showGradient ? mainGradient() : null),
          child: CustomPaint(painter: BackgroundPainter()),
        )),
        Positioned(child: child)
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    // !Ibraheem Comment here! //
    // The Above line means that: creating an object from that object you take the color object type and then assign a color
    // this is same as:
    // Paint paint1 = Paint();
    // paint1.color = Colors.white;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();
    //In Above CODE we draw the first sloped line for the opposite color
    final path1 = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width * 0.8, 0);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    //In Above CODE we draw the second sloped line for the opposite color
    //It should look like this | / /  |
    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
