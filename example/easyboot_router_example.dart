import 'dart:io';

import 'package:easyboot_router/src/router.dart';

main() {
  Router router = Router();
  router.get("/", (HttpRequest request) {
    request.response.close();
  });
  print('router: ${router.routes}');
}
