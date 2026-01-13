import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_routes.dart';
import 'auth_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(label: Text('UserName')),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthProvider>().login(controller.text.trim());
                    Navigator.pushReplacementNamed(context, AppRoute.products);
                  },
                  child: const Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
