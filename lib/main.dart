import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:system_theme/system_theme.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (TargetPlatform.windows == defaultTargetPlatform) {
    await flutter_acrylic.Window.initialize();
    await WindowManager.instance.ensureInitialized();
    windowManager.waitUntilReadyToShow().then((_) async {
      // windowManager.setMovable(true);
      await Future.wait([
        // windowManager.setTitleBarStyle(TitleBarStyle.hidden,
        //     windowButtonVisibility: false),
        windowManager.setSize(const Size(755, 545)),
        windowManager.setMinimumSize(const Size(755, 545)),
        windowManager.center(),
        windowManager.setPreventClose(true),
        windowManager.setSkipTaskbar(false),
      ]);

      // await windowManager.setTitleBarStyle('hidden',
      //     windowButtonVisibility: false);
      // await windowManager.setSize(const Size(755, 545));
      // await windowManager.setMinimumSize(const Size(755, 545));
      // await windowManager.center();
      await windowManager.show();
      // await windowManager.setPreventClose(true);
      // await windowManager.setSkipTaskbar(false);
    });
  }
  runApp(const App());
}
