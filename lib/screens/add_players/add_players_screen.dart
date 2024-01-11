import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../base/base.dart';
import 'add_players.dart';

class AddPlayersScreen extends StatelessWidget {
  const AddPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPlayersCubit()
        ..onWidgetDidInit(
            (context.read<BaseCubit>().state as BaseLoadedState).prefs,
            (context.read<BaseCubit>().state as BaseLoadedState).listOfPlayers),
      child: BlocBuilder<AddPlayersCubit, AddPlayersState>(
        builder: (context, state) {
          if (state is AddPlayersLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: MyTextField(state: state),
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
                              leading: Text('${(index + 1)}.'),
                              trailing: IconButton(
                                  onPressed: () {
                                    context
                                        .read<AddPlayersCubit>()
                                        .onDeletePlayer(index);
                                  },
                                  icon: const Icon(Icons.delete_forever)),
                            ),
                          ))),
                ),
                MyButton(
                  title: "next",
                  onPressed: state.enoughPlayer
                      ? () {
                          Router.neglect(context,
                              () => GoRouter.of(context).go(AppRoutes.game));
                        }
                      : null,
                  size: ButtonSizes.small,
                )
              ],
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  final AddPlayersLoadedState state;

  const MyTextField({
    required this.state,
    super.key,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.name,
              autocorrect: false,
              autofocus: true,
              focusNode: _focusNode,
              controller: widget.state.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a player',
              ),
              onChanged: (value) => setState(() {}),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onFieldSubmitted: (value) {
                if (widget.state.controller.text.isNotEmpty &&
                    _formKey.currentState!.validate()) {
                  context.read<AddPlayersCubit>().onSubmitPlayer();
                }
                _focusNode.requestFocus();
              },
              validator: (value) =>
                  context.read<AddPlayersCubit>().playerNameValidator(value),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: IconButton(
              onPressed: _formKey.currentState != null &&
                      widget.state.controller.text.isNotEmpty &&
                      _formKey.currentState!.validate()
                  ? () => context.read<AddPlayersCubit>().onSubmitPlayer()
                  : null,
              icon: const Icon(
                Icons.add,
              ),
            ),
          )
        ],
      ),
    );
  }
}
