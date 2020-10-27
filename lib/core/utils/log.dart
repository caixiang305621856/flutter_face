import 'package:flutter_printer/flutter_printer.dart';

class Dlog{
  static showLog(dynamic content,
  {StackTrace stackTrace, String prefix}){
    Printer.printMapJsonLog(content,stackTrace: stackTrace,prefix:prefix);
  }
}