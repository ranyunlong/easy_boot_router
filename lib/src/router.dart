import 'dart:io';

import 'package:easyboot_router/easyboot_router.dart';
import 'package:easyboot_router/src/route.dart';

class Router {
  /// 所有路由列表
  List<Route> routes = [];

  /// 使用[HttpRequest]对象匹配路由
  /// 如果能匹配上返回路由列表
  List<Route> matchRoutes(HttpRequest request) {
    List<Route> _routes = [];
    // 匹配路由
    routes.forEach((route) {
      if (route.hasMatch(request))  {
        _routes.add(route);
      }
    });
    return _routes;
  }

  Router request(String path, String method,handler(HttpRequest request)) {
    routes.add(
        Route(
            path: path,
            method: method,
            handler: handler
        )
    );
    return this;
  }

  /// 添加一个HTTP GET 请求
  /// ```
  /// get("/", (HttpRequest request) {
  ///   request.response.close();
  /// })
  /// ```
  Router get(String path,handler(HttpRequest request)) => request(path, HttpMethod.GET, handler);

  /// 添加一个HTTP POST 请求
  /// ```
  /// post("/", (HttpRequest request) {
  ///   request.response.close();
  /// })
  /// ```
  Router post(String path,handler(HttpRequest request)) => request(path, HttpMethod.POST, handler);

  Router all(String path,handler(HttpRequest request)) => request(path, HttpMethod.ALL, handler);

  Router head(String path,handler(HttpRequest request)) => request(path, HttpMethod.HEAD, handler);

  Router copy(String path,handler(HttpRequest request)) => request(path, HttpMethod.COPY, handler);

  Router delete(String path,handler(HttpRequest request)) => request(path, HttpMethod.DELETE, handler);

  Router link(String path,handler(HttpRequest request)) => request(path, HttpMethod.LINK, handler);

  Router lock(String path,handler(HttpRequest request)) => request(path, HttpMethod.LOCK, handler);

  Router options(String path,handler(HttpRequest request)) => request(path, HttpMethod.OPTIONS, handler);

  Router patch(String path,handler(HttpRequest request)) => request(path, HttpMethod.PATCH, handler);

  Router propfind(String path,handler(HttpRequest request)) => request(path, HttpMethod.PROPFIND, handler);

  Router purge(String path,handler(HttpRequest request)) => request(path, HttpMethod.PURGE, handler);

  Router unlink(String path,handler(HttpRequest request)) => request(path, HttpMethod.UNLINK, handler);

  Router unlock(String path,handler(HttpRequest request)) => request(path, HttpMethod.UNLOCK, handler);

  Router view(String path,handler(HttpRequest request)) => request(path, HttpMethod.VIEW, handler);

  /// 添加自定义路由
  /// 使用[Route]类构建
  Router addRoute(Route route) {
    this.routes.add(route);
    return this;
  }

  @override
  String toString() {
    return "Router {routes: $routes}";
  }

  /// 转换json结果
  List<Route> toJson() {
    return routes;
  }
}