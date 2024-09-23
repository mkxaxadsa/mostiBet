import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.splash = false,
  });

  final Widget body;
  final bool splash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                if (splash) ...[
                  Container(color: AppColors.main),
                  Image.asset(
                    'assets/bg.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ],
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        if (splash) ...[
                          const Color(0xff0A0C14).withOpacity(0),
                          const Color(0xff163B4B),
                        ] else ...[
                          const Color(0xff163B4B),
                          const Color(0xff0A0C14)
                        ]
                      ],
                    ),
                  ),
                ),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
