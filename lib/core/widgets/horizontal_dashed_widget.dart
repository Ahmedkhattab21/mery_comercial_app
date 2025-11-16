import 'package:flutter/material.dart';
import 'package:mery_comercial_app/core/utils/app_colors_white_theme.dart';

class HorizontalDashedWidget extends StatelessWidget {
  final double width;
  final double space;

  const HorizontalDashedWidget(
      {required this.width, required this.space, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: double.infinity,
      child: CustomPaint(
        painter: DashedLinePainter(space: space, width: width),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final double width;
  final double space;

  DashedLinePainter({required this.width, required this.space});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.greyColor97
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    double dashWidth = width;
    double dashSpace = space;

    double startX = 10.0;
    double endX = size.width - 10;

    double currentX = startX;

    while (currentX < endX) {
      canvas.drawLine(
          Offset(currentX, 0.0), Offset(currentX + dashWidth, 0.0), paint);
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
