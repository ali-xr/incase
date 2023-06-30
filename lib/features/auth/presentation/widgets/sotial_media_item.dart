import 'package:flutter/material.dart';
import 'package:Incase/assats/colors/colors.dart';
import 'package:Incase/features/common/widgets/w_scale.dart';

class SocialMediaItem extends StatelessWidget {
  final Widget icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback onTap;
  final Widget text;

  const SocialMediaItem(
      {required this.icon,
      required this.onTap,
      this.borderColor,
      this.backgroundColor,
      required this.text,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => WScaleAnimation(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor ?? black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            text,
          ],
        ),
      ));
}
