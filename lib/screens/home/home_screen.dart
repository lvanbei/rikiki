import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki_for_real/core/constants/routes.dart';
import 'package:rikiki_for_real/core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigButton(
          title: 'start',
          onPressed: () {
            Router.neglect(
                context, () => GoRouter.of(context).go(AppRoutes.addPlayers));
          },
        ),
        const SizedBox(
          height: 32,
        ),
        const BigButton(title: 'start'),
      ],
    );
  }
}
