import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  const BaseScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BaseCubit()..onWidgetDidInit(),
      child: BlocBuilder<BaseCubit, BaseState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text('Rikiki'),
          ),
          body: child,
        ),
      ),
    );
  }
}
