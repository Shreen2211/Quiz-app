import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_images/app_images.dart';
import '../../../../core/constants/color/color_const.dart';
import '../../view_model/providers/user_data_provider.dart';
import 'custom_header_text.dart';
import 'edit_name_dialog.dart';

class UserHeader extends ConsumerWidget  {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final name = ref.watch(userName);
    final rate = ref.watch(userRate);
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(AppImages.logo),
            ),
            CustomHeaderText(text: name),
            IconButton(
              onPressed: () {
                showEditNameDialog(context, ref);
              },
              icon: Icon(Icons.edit, color: ColorConst.white),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          decoration: BoxDecoration(
            color: ColorConst.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            spacing: 5,
            children: [
              Icon(
                Icons.bolt,
                color: ColorConst.orangeBackground,
                size: 22,
              ),
              Text(
                rate.toString(),
                style: TextStyle(
                  color:ColorConst.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
