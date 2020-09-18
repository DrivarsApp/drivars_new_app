import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gogame/ui/loaders/color_loader_5.dart';
import 'package:gogame/ui/shared/app_colors.dart';
import 'package:gogame/ui/shared/app_theme.dart';
import 'package:gogame/viewmodels/base_model.dart';

class BaseCommonWidget {
  void showErrorMessage(BuildContext context, String message, bool isError) {
    try {
      if (message != null) {
        Flushbar(
          message: message,
          flushbarStyle: FlushbarStyle.GROUNDED,
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor:
              isError ? Colors.red : AppColors.enabledButtonBackgroundColor,
        )..show(context);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget getProgressBar(ViewState viewState) {
    if (viewState == ViewState.Busy) {
      return Container(
        color: Colors.white.withAlpha(204),
        child: Center(
          child: ColorLoader5(
            dotOneColor: Colors.blue,
            dotTwoColor: Colors.lightBlue,
            dotThreeColor: Colors.lightBlueAccent,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  colorIcon(String image, double height, double width) {
    return Image.asset(
      image,
      width: height,
      height: width,
    );
  }

  backPress(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget getBorder() {
    return Container();
  }

  Widget loadRoundNetworkImage(
      {String path,
      double height,
      double borderWidth = 0,
      Color borderColor = Colors.transparent}) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: borderWidth),
        shape: BoxShape.circle,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: path != null
                ? NetworkImage(path)
                : AssetImage(AppTheme.imageProfilePlaceHolder)),
      ),
    );
  }

  Widget loadRoundFileImage(File path, double height) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(fit: BoxFit.cover, image: FileImage(path)),
      ),
    );
  }

  Widget loadCachedNetworkImage(
      {String imageUrl, double height, double width}) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          height: height,
          width: width,
          child: Image.asset('assets/images/user_profile_place_holder.png')),
      errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          child: Image.asset('assets/images/user_profile_place_holder.png')),
    );
  }

  Widget loadBannerImage(String imageUrl, double height) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
          height: height,
          width: height,
          child: Image.asset('assets/images/user_profile_place_holder.png')),
      errorWidget: (context, url, error) => Container(
          height: height,
          width: height,
          child: Image.asset('assets/images/user_profile_place_holder.png')),
    );
  }

  getListOfRow(
      {Widget widget, int itemCount, Axis scrollDirection, double height}) {
    return Container(
//      color: AppColors.subtitleColor,
      height: height,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        itemCount: itemCount,
//            crossAxisSpacing: SizeConfig.relativeWidth(1),
//            mainAxisSpacing: SizeConfig.relativeWidth(1),
        itemBuilder: (BuildContext cnt, int index) {
          return widget;
        },
      ),
    );
  }

  chatEmployee(
      {String imagePath,
      double imageHeight,
      double iconWidth,
      double iconHeight,
      Color colors,
      double bottom,
      double top,
      double left,
      double right}) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            loadRoundNetworkImage(
              path: imagePath,
              height: imageHeight,
            ),
            Positioned(
              child: ClipOval(
                child: Container(
                  height: iconHeight,
                  width: iconWidth,
                  color: colors,
                ),
              ),
              bottom: bottom,
              right: right,
              top: top,
              left: left,
            )
          ],
        ),
      ],
    );
  }
}
