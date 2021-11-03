import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio_x/colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: VxBox(
              child: VStack([
        ZStack(
          [
            PictureWidget(),
            Row(
              children: [
                VStack([
                  if (context.isMobile) 50.heightBox else 10.heightBox,
                  // CustomAppBar().shimmer(primaryColor: Coolors.accentColor),
                  30.heightBox,
                  20.heightBox,
                  // VxBox()
                  //     .color(Coolors.accentColor)
                  //     .size(60, 10)
                  //     .make()
                  //     .px4()
                  //     .shimmer(primaryColor: Coolors.accentColor),
                  // 30.heightBox,
                ]).pSymmetric(
                  h: context.percentWidth * 10,
                  v: 32,
                ),
                Expanded(
                  child: VxResponsive(
                    medium: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    large: IntroductionWidget()
                        .pOnly(left: 120)
                        .h(context.percentHeight * 60),
                    fallback: const Offstage(),
                  ),
                )
              ],
            ).w(context.screenWidth)
          ],
        )
      ]))
          .size(context.screenWidth, context.percentHeight * 60)
          .color(Coolors.secondaryColor)
          .make(),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameWidget = "KUMPALI"
        .text
        .white
        .xl6
        .lineHeight(1)
        .size(context.isMobile ? 15 : 20)
        .bold
        .make()
        .shimmer(
            primaryColor: Colors.deepPurple,
            secondaryColor: Colors.cyan.shade50);
    final tagline = " ~ love to assist you ~".text.gray500.xl3.make();
    return VStack(
      [
        [
          nameWidget,
          tagline,
          " We are on the way".text.white.xl3.make().w(context.isMobile
              ? context.screenWidth
              : context.percentWidth * 40),
          // "We are on the way.".text.white.xl3.make().w(context.isMobile
          //     ? context.screenWidth
          //     : context.percentWidth * 40),
          20.heightBox,
        ].vStack(),
        RaisedButton(
          onPressed: () {
            launch("https://kumpali.com");
          },
          hoverColor: Vx.purple700,
          shape: Vx.roundedSm,
          color: Coolors.accentColor,
          textColor: Coolors.primaryColor,
          child: "Visit kumpali.com".text.make(),
        ).h(50),
        20.heightBox,
        SocialAccounts(),
      ],
      crossAlignment: CrossAxisAlignment.center,
      alignment: MainAxisAlignment.center,
    );
  }
}

// class CustomAppBar extends StatelessWidget {
//   const CustomAppBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Icon(
//       FontAwesomeIcons.accusoft,
//       size: 50,
//       color: Coolors.accentColor,
//     );
//   }
// }

class PictureWidget extends StatelessWidget {
  const PictureWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      origin: Offset(context.percentWidth * 2, 0),
      transform: Matrix4.rotationY(0),
      child: Image.asset(
        "assets/logo1.png",
        fit: BoxFit.cover,
        height: context.percentHeight * 60,
      ),
    );
  }
}

class SocialAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return [
      Icon(
        FontAwesomeIcons.twitter,
        color: Colors.white,
      ).mdClick(() {
        launch("https://twitter.com/leanersumit");
      }).make(),
      20.widthBox,
      Icon(
        FontAwesomeIcons.instagram,
        color: Colors.white,
      ).mdClick(() {
        launch("https://www.instagram.com/amit_sharan1/");
      }).make(),
      20.widthBox,
      Icon(
        FontAwesomeIcons.facebook,
        color: Colors.white,
      ).mdClick(() {
        launch("https://www.facebook.com/amit.sharan.1840");
      }).make(),
      20.widthBox,
      Icon(
        FontAwesomeIcons.github,
        color: Colors.white,
      ).mdClick(() {
        launch("https://github.com/amitsharan120977");
      }).make()
    ].hStack();
  }
}
