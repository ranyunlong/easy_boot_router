EasyBoot Router library.

## Usage

Usage example:

```dart
import 'package:easyboot_router/easyboot_router.dart';

main() {
  Router router = new Router();
  router.get("/", (HttpRequest request) {
      request.response.close();
  });
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ranyunlong/easy_boot/issues
