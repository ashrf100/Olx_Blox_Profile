import 'package:animate_do/animate_do.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:olx_bloc/core/const/assets.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/const/strings.dart';

class AnimatedLogoWidget extends StatelessWidget {
  final double cw, ch, lw, lh;

  const AnimatedLogoWidget({
    Key? key,
    required this.cw,
    required this.ch,
    required this.lw,
    required this.lh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cw,
      height: ch,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const FlareActor(AppAssets.circle, animation: "Alarm"),
          ZoomIn(
            duration: const Duration(milliseconds: 1500),
            child: Hero(
                tag: AppKeys.LOGO_TAG,
                child: Image.asset(AppAssets.logo, width: lw, height: lh)),
          ),
        ],
      ),
    );
  }
}
