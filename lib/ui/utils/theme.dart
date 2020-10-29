import 'package:flutter/material.dart';

class OPAppTheme {
  //项目主色
  static const Color kMainColor = Color(0xffFF7E00);

  //阴影颜色
  static const Color kShadowColor = Color(0xffF7E8D8);

  static const Color kWhiteColor = Color(0xffFFFFFF);
  static const Color kDarkWhiteColor = Color(0xff292828);

  //默认背景色
  static const Color kDefaultBackgroundColor = Color(0xffF9F9FB);
  static const Color kDarkDefaultBackgroundColor = Color(0xff121212);

  //分割线颜色
  static const Color kSeparatorLineColor = Color(0xffF2F0F0);
  //主要文字颜色
  static const Color kMainFontColor = Color(0xff333333);
  static const Color kDarkMainFontColor = Color(0xffCFCFCF);

  //普通文字颜色
  static const Color kNormalFontColor = Color(0xff666666);
  static const Color kDarkNormalFontColor = Color(0xff888888);

  //辅助文字颜色
  static const Color kOtherFontColor = Color(0xff999999);
  static const Color kDarkOtherFontColor = Color(0xff999999);

  //提示性文字颜色
  static const Color kTipsColor = Color(0xffCCCCCC);
  static const Color kDarkTipsColor = Color(0xffCFCFCF);

  /// 共有属性
  //提示性字号
  static const double kTipsSize = 12;
  //辅助文字字号
  static const double kAidSize = 14;
  //内容字号
  static const double kContentSize = 16;
  //标题字号
  static const double kTitleSize = 18;
  //标题字号
  static const double kMainTitleSize = 20;

  /// 普通模式
  static final ThemeData norTheme = ThemeData(
      primarySwatch: createMaterialColor(kMainColor),
      accentColor: createMaterialColor(kMainColor),
      canvasColor: createMaterialColor(kDefaultBackgroundColor),
      textTheme: TextTheme(
        // headline1:TextStyle(fontSize: kMainTitleSize, color: kMainFontColor,fontWeight: FontWeight.bold),
        // headline2: TextStyle(fontSize: kTitleSize, color: kMainFontColor),
        // headline3: TextStyle(fontSize: kContentSize, color: kNormalFontColor),
        // headline4: TextStyle(fontSize: kAidSize, color: kOtherFontColor),
        // headline5: TextStyle(fontSize: kTipsSize, color: kTipsColor),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        color: kWhiteColor,
        textTheme:TextTheme(
          headline6:TextStyle(fontSize: kTitleSize, color: kMainFontColor,fontWeight: FontWeight.bold),
        ),
      ),
      tabBarTheme: TabBarTheme(

      )
  );

  /// 暗黑模式
  static final ThemeData darkTheme = ThemeData(
      primarySwatch: createMaterialColor(kDarkTipsColor),
      accentColor: createMaterialColor(kDarkTipsColor),
      canvasColor: createMaterialColor(kDarkDefaultBackgroundColor),
      textTheme: TextTheme(
        headline1:TextStyle(fontSize: kMainTitleSize, color: kDarkMainFontColor),
        headline2: TextStyle(fontSize: kTitleSize, color: kDarkMainFontColor),
        headline3: TextStyle(fontSize: kContentSize, color: kDarkNormalFontColor),
        headline4: TextStyle(fontSize: kAidSize, color: kDarkOtherFontColor),
        headline5: TextStyle(fontSize: kTipsSize, color: kDarkTipsColor),
      )
  );

  /// 颜色转换成主题颜色
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}

