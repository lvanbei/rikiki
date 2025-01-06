import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki/screens/game_settings/game_settings.dart';

import '../../core/core.dart';
import '../base/base_cubit.dart';

class GameSettingsScreen extends StatelessWidget {
  const GameSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GameSettingsCubit(context.read<BaseCubit>())..onWidgetDidInit(),
      child: BlocBuilder<GameSettingsCubit, GameSettingsState>(
          builder: (context, state) {
        if (state is GameSettingsLoadedState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              NumberSelector(
                labelText: "Rounds",
                number: '${state.rounds}',
                onMinPress: state.canDeleteRound
                    ? context.read<GameSettingsCubit>().minRounds
                    : null,
                onPlusPress: state.canAddRound
                    ? context.read<GameSettingsCubit>().plusRounds
                    : null,
                readOnly: state.continueGame,
              ),
              const Gap(8),
              const Divider(),
              NumberSelector(
                labelText: "Points per fold",
                number: '${state.pointsPerFold}',
                onMinPress:
                    !state.increasePointPerFold && state.pointsPerFold > 1
                        ? context.read<GameSettingsCubit>().minPoint
                        : null,
                onPlusPress:
                    !state.increasePointPerFold && state.pointsPerFold < 10
                        ? context.read<GameSettingsCubit>().plusPoint
                        : null,
                readOnly: state.continueGame || state.increasePointPerFold,
              ),
              const Gap(8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Divider(),
              ),
              const Label(
                text: "The points are equal to the round",
              ),
              Switch(
                trackOutlineColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                  if (state.continueGame) {
                    return AppColors.grey;
                  }
                  return AppColors.black;
                }),
                thumbColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                  if (state.continueGame) {
                    return AppColors.grey;
                  }
                  if (state.increasePointPerFold) {
                    return AppColors.white;
                  }
                  return AppColors.black;
                }),
                trackColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                  if (state.increasePointPerFold) {
                    return AppColors.black;
                  }
                  return AppColors.white;
                }),
                value: state.increasePointPerFold,
                onChanged: (bool status) {
                  if (!state.continueGame) {
                    context
                        .read<GameSettingsCubit>()
                        .updateIncreasePointPerFold(status);
                  }
                },
              ),
              const Expanded(child: SizedBox.shrink()),
              MyButton(
                title: state.continueGame ? 'Continue' : 'Start',
                onPressed: () {
                  context.read<GameSettingsCubit>().updatePlayerFoldList();
                  Router.neglect(context,
                      () => GoRouter.of(context).go(AppRoutes.setFolds));
                },
                size: ButtonSizes.small,
              )
            ],
          );
        }
        return Container();
      }),
    );
  }
}
