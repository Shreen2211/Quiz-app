import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/color/color_const.dart';
import 'custom_header_text.dart';

class DailyTaskCard extends StatelessWidget {
  const DailyTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            ColorConst.lightPurple,
            ColorConst.periwinkle,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [BoxShadow(color: ColorConst.black, blurRadius: 8, offset: Offset(2, 4))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomHeaderText(text: 'Daily Task'),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: ColorConst.white.withValues(alpha: 0.3),
                        child: Icon(Icons.more_horiz, color: ColorConst.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('20 Questions', style: TextStyle(color: ColorConst.softWhite, fontSize: 14)),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 10 / 20,
                    minHeight: 8,
                    backgroundColor: ColorConst.white.withValues(alpha: 0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(ColorConst.orangeBackground),
                  ),
                  SizedBox(height: 8),
                  Text('Progress 10/14', style: TextStyle(color: ColorConst.softWhite, fontSize: 12)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
