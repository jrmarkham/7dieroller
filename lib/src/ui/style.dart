// FONTS
import 'dart:io';

import 'package:seven_die/src/data/global_data.dart';
import 'package:flutter/material.dart';

const String MAIN_FONT = 'Roboto';
// CONSTs
// COLORS
const Color colorGreen = Colors.green;
const Color colorRed = Colors.red;
const Color colorBlue = Colors.blue;
const Color colorLightGray = Colors.grey;
const Color colorLightestGray = Colors.white60;
const Color colorGray = Colors.white12;
const Color colorWhiteOff = const Color(0xFFECEFF1);
const Color colorWhite = Colors.white;
const Color colorBlack = Colors.black;
//

const double CONTENT_HEIGHT_PERCENTAGE = 0.8;
const double INDICATOR_SIZE_PERCENTAGE = 0.85;
const double INDICATOR_STROKE_SIZE = 10.0; // maybe increate by size
const double LARGE_ICON_FACTOR = 2.0;
//final Color ColorGREEN = const Color(0x00CC00);
//
// Icon and Icon Button Settings
const Color iconColor = colorRed;
const Color selectedColor = colorLightGray;
double iconSize;

double imageWidthDisplayPercentage = 0.4;
double imageHeightDisplayPercentage = 0.5;
// TEXT SIZES

double dieTextSize = 150;
double titleTextSize;
double labelTextSize;
double bodyTextSize;

// SPACINGS
double corePadding;
double coreButtonSpacing;
double tinySpacing;

//
// SetDevice
double deviceWidth;
double deviceHeight;
double mainButtonWidth;
double mainButtonHeight;
double medButtonWidth;
double smallButtonWidth;
double formElementsWidth;
double borderRadius = 25.0;

void setDeviceDimensions(double w, double h) {
    deviceWidth = w;
    deviceHeight = h;
    formElementsWidth = deviceWidth * 0.75;

    mainButtonWidth = deviceWidth * 0.8;
    medButtonWidth = deviceWidth * 0.55;
    smallButtonWidth = deviceWidth * 0.4;
    mainButtonHeight = deviceHeight * 0.09;
    // set values
    if (deviceWidth > 900) {
        iconSize = 50.0;
        corePadding = 15.0;
        coreButtonSpacing = 15.0;
        tinySpacing = 5.0;
        formElementsWidth = deviceWidth * 0.4;
        mainButtonWidth = deviceWidth * 0.4;
        medButtonWidth = deviceWidth * 0.3;
        smallButtonWidth = deviceWidth * 0.25;
        mainButtonHeight = deviceHeight * 0.0625;

        // text


        titleTextSize = 36.0;
        labelTextSize = 26.0;
        bodyTextSize = 24.0;
    } else if (deviceWidth > 750) {
        iconSize = 43.0;
        corePadding = 20.0;
        coreButtonSpacing = 15.0;
        tinySpacing = 4.0;

        formElementsWidth = deviceWidth * 0.55;
        mainButtonWidth = deviceWidth * 0.5;
        medButtonWidth = deviceWidth * 0.4;
        smallButtonWidth = deviceWidth * 0.3;
        mainButtonHeight =
        Platform.isIOS ? deviceHeight * 0.0925 : deviceHeight * 0.0875;

        // text

        titleTextSize = 34.0;
        labelTextSize = 24.0;
        bodyTextSize = 22.0;
    } else if (deviceWidth > 550) {
        iconSize = 40.0;
        corePadding = 15.0;
        coreButtonSpacing = 12.0;
        tinySpacing = 5.0;
        formElementsWidth = deviceWidth * 0.65;
        mainButtonWidth = deviceWidth * 0.6;
        medButtonWidth = deviceWidth * 0.5;
        smallButtonWidth = deviceWidth * 0.4;
        mainButtonHeight = deviceHeight * 0.085;
        // text

        titleTextSize = 32.0;
        labelTextSize = 22.0;
        bodyTextSize = 20.0;
    } else if (deviceWidth > 400) {
        iconSize = 35.0;
        corePadding = 12.0;
        coreButtonSpacing = 10.0;
        tinySpacing = 3.0;

        mainButtonHeight =
        Platform.isIOS ? deviceHeight * 0.08 : deviceHeight * 0.0925;
        // text
        titleTextSize = 28.0;
        labelTextSize = 18.0;
        bodyTextSize = 17.0;
    } else {
        iconSize = 25.0;
        corePadding = 10.0;
        coreButtonSpacing = 5.0;
        tinySpacing = 2.0;
        medButtonWidth = deviceWidth * 0.525;
        smallButtonWidth = deviceWidth * 0.45;
        mainButtonHeight = deviceHeight * 0.085;

        // text

        titleTextSize = 26.0;
        labelTextSize = 16.0;
        bodyTextSize = 15.0;
    }
}

// TEXT STYLES
TextStyle dieTextStyle() {
    return TextStyle (
        color: colorBlack, fontSize:dieTextSize, fontWeight: FontWeight.bold, fontFamily: MAIN_FONT
        );
}


TextStyle titleTextStyle() {
    return TextStyle (
        color: colorWhite, fontSize:titleTextSize, fontFamily: MAIN_FONT
        );
}

TextStyle bodyTextStyle() {
    return TextStyle(
        color: colorGreen, fontSize: bodyTextSize, fontFamily: MAIN_FONT);
}// TEXT STYLES
TextStyle bodyTextDisabledStyle() {
    return TextStyle(
        color: colorLightGray, fontSize: bodyTextSize, fontFamily: MAIN_FONT);
}


TextStyle bodyBoldTextStyle() {
    return TextStyle(
        color: colorGreen, fontSize: bodyTextSize, fontFamily: MAIN_FONT);
}

TextStyle buttonDisabledTextStyle() {
    return TextStyle(
        color: colorGray, fontSize: bodyTextSize, fontFamily: MAIN_FONT);
}


TextStyle buttonTextStyle() {
    return TextStyle(
        color: colorWhite, fontWeight:FontWeight.bold, fontSize: bodyTextSize, fontFamily: MAIN_FONT);
}


// THEMES
AppBarTheme appBarTheme() {
    return AppBarTheme(
        textTheme: TextTheme(
            title: titleTextStyle(),
            ),
        );
}

TextTheme genTextTheme() {
    return TextTheme(
        title: titleTextStyle(),
        body1: bodyTextStyle(),
        );
}

ThemeData appTheme() {
    return ThemeData(
        primaryColor: colorGreen,
        canvasColor: colorWhite,
        appBarTheme: appBarTheme(),
        backgroundColor: colorWhite,
        scaffoldBackgroundColor: colorWhite,
        textTheme: genTextTheme(),
        unselectedWidgetColor:colorLightestGray,
        dialogBackgroundColor: colorWhite,
        fontFamily: MAIN_FONT);
}

// ELEMENTS
// Reusable Widgets Buttons / Form elements etc...


Widget appButton(String label, Function function, ButtonSizes bs,
                 {IconData icon}) {
    double buttonSize = bs == ButtonSizes.med ? medButtonWidth : smallButtonWidth;

    return Container(
        width: buttonSize,
        child: RaisedButton(
            padding: EdgeInsets.all(corePadding),
            color: function == null ? colorLightestGray :  colorGreen,
            child: Text(label, style:function == null ?buttonDisabledTextStyle() :buttonTextStyle()),
            onPressed: function,
            ),
        );

}


Widget appLoading() {
    return Center(
        child: SizedBox(
            width: deviceWidth * INDICATOR_SIZE_PERCENTAGE,
            height: deviceWidth * INDICATOR_SIZE_PERCENTAGE,
            child: CircularProgressIndicator(
                backgroundColor: colorGreen,
                strokeWidth: INDICATOR_STROKE_SIZE,
                ),
            ),
        );
}