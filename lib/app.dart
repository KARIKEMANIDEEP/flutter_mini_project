import 'package:flutter/material.dart';
import 'package:mini_project_flutter/splash_page.dart';
import 'package:provider/provider.dart';

import 'app_routes.dart';
import 'features/auth/auth_provider.dart';
import 'features/auth/login_page.dart';
import 'features/products/product_page.dart';
import 'features/products/product_provider.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => ProductProvider())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.splash,
        routes: {
          AppRoute.splash: (_) => const SplashPage(),
          AppRoute.login: (_) => const LoginPage(),
          AppRoute.products: (_) => const ProductPage()
        },
      ),);
  }
}
