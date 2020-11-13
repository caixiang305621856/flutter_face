import 'package:flutter/material.dart';

class OPInheritedProvider<T> extends InheritedWidget {

  //共享状态(数据)
  final T data;

  //定义构造方法
  OPInheritedProvider({@required this.data,Key key, Widget child}): super(key: key, child: child);

  //获取组件最近的当前的InheritedWidget
  static OPInheritedProvider of(BuildContext context){
    // 沿着Element树, 去找到最近的OPInheritedProvider, 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.决定要不要回调State中的didChangeDependencies
  // 如果返回true: 执行依赖当期的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(OPInheritedProvider oldWidget) {
    return this.data != oldWidget.data;
  }
}