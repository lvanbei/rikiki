import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../core/core.dart';
import 'add_players.dart';

class AddPlayersScreen extends StatelessWidget {
  const AddPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPlayersCubit()..onWidgetDidInit(),
      child: BlocBuilder<AddPlayersCubit, AddPlayersState>(
        builder: (context, state) {
          if (state is AddPlayersLoadedState) {
            return ReactiveFormBuilder(
              form: () => state.form,
              // key: UniqueKey(),
              builder: (context, formGroup, child) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: state.playerNameField,
                            autocorrect: false,
                            autofocus: true,
                            focusNode: state.textFieldFocusNode,
                            controller: state.controller,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Add a player',
                            ),
                            onSubmitted: (control) {
                              if (control.valid) {
                                context
                                    .read<AddPlayersCubit>()
                                    .onSubmitPlayer();
                              } else {
                                control.markAllAsTouched();
                              }
                              state.textFieldFocusNode.requestFocus();
                            },
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  "This field cannot be empty.",
                              ValidationMessage.maxLength: (_) =>
                                  "Max 24 characters.",
                              ValidationMessage.minLength: (_) =>
                                  "Min 2 characters.",
                              ValidationMessage.max: (_) => "Max 10 players.",
                              ValidationMessage.equals: (_) =>
                                  "Player already in list."
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        ReactiveFormConsumer(
                          builder: (context, control, child) => IconButton(
                              onPressed: control.valid
                                  ? () {
                                      context
                                          .read<AddPlayersCubit>()
                                          .onSubmitPlayer();
                                    }
                                  : null,
                              icon: const Icon(
                                Icons.add,
                              )),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemCount: state.listOfPlayers.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Text(state.listOfPlayers[index].name),
                                trailing: IconButton(
                                    onPressed: () {
                                      if (state.playersLimit) {
                                        formGroup.reset(
                                            value: state.form.value);
                                        formGroup.focus(state.playerNameField);
                                      }
                                      context
                                          .read<AddPlayersCubit>()
                                          .onDeletePlayer(index);
                                    },
                                    icon: const Icon(Icons.delete_forever)),
                              ),
                            ))),
                  )
                ],
              ),
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
