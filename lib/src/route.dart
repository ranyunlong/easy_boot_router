import 'dart:io';

import 'package:easyboot_router/easyboot_router.dart';
import 'package:path_to_regexp/path_to_regexp.dart';

class Route {
  /// 当前路由的路径
  final String path;
  /// 当前路由的匹配方法
  final String method;
  /// 路径解析正则表达式
  RegExp _regExp;
  /// 路径匹配的正则参数列表
  final List<String> parameters;
  /// 当前路由的处理函数
  Function handler;
  Route({
    this.path,
    this.parameters,
    this.method,
    handler(HttpRequest request),
  }) {
    _regExp = pathToRegExp(path, parameters: parameters);
    if (handler != null) this.handler = handler;
  }

  /// 检测路由是否能匹配
  bool hasMatch(HttpRequest request) {
    return _regExp.hasMatch(request.uri.path) && (method == HttpMethod.ALL || request.method == method);
  }

  /// 检测是否包含处理方法
  bool get hasHandler => handler != null;

  /// 获取匹配的路径参数
  Map<String, String> getPathVariable(HttpRequest request) {
    return extract(parameters, _regExp.matchAsPrefix(request.uri.path));
  }

  @override
  String toString() {
    return "Route {path: $path, method: $method}";
  }

  /// 转换为json结果
  Map<String, dynamic> toJson() {
    return {
      "path": path,
      "method": method,
    };
  }
}


