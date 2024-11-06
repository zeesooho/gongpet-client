import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gongpet/main/main_scaffold.dart';

import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: './assets/config.env');
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: dotenv.env['NATIVE_APP_KEY']);
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainScaffold(),
    );
  }
}
