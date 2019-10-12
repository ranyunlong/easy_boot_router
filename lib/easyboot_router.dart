/// 这个库用于EasyBoot的路由框架
/// ## 使用
/// ```
/// import 'package:easyboot_router/easyboot_router.dart';
/// ```
/// 实例化[Router]
/// 例如:
/// ```dart
/// Router router = Router();
/// ```
/// ## 添加请求
/// 支持的请求方法请查阅, [HttpMethod]类
/// 添加get请求:
/// ```dart
/// router.get("/", (HttpRequest request) {
///   request.response.close();
/// })
/// ```
/// 添加post请求:
/// ```dart
/// router.post("/", (HttpRequest request) {
///   request.response.close();
/// })
/// ```
/// 添加options请求:
/// ```dart
///   router.options("/", (HttpRequest request) {
///       request.response.close();
///   })
/// ```
/// 自定义路由模式 使用[Route]类创建
/// 添加自定义路由:
/// ```dart
/// router.addRoute(
///   Route(
///     path: "/",
///     method: HttpMethod.GET,
///     parameters: []
///   )
/// );
/// ```

library easyboot_router;

import 'package:easyboot_router/src/router.dart';

export 'src/route.dart';
export 'src/method.dart';
export 'src/router.dart';
