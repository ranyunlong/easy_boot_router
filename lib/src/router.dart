import 'dart:io';

import 'package:easyboot_router/easyboot_router.dart';
import 'package:easyboot_router/src/route.dart';

class Router {
  List<Route> routes = [];

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

  Router get(String path,handler(HttpRequest request)) => request(path, HttpMethod.GET, handler);

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

  Router addRoute(Route route) {
    this.routes.add(route);
    return this;
  }

  @override
  String toString() {
    return "Router {routes: $routes}";
  }

  List<Route> toJson() {
    return routes;
  }
}