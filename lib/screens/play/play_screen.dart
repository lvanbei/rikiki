import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import 'play.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayCubit()..onWidgetDidInit(),
      child: BlocBuilder<PlayCubit, PlayState>(
        builder: (context, state) {
          if (state is PlayLoadedState) {
            Container();
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
