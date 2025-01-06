import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../add_players.dart';

class InputSection extends StatefulWidget {
  final AddPlayersLoadedState state;
  final Function onSubmit;
  final String? Function(String?) validator;

  const InputSection({
    required this.state,
    required this.onSubmit,
    required this.validator,
    super.key,
  });

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            initialValue: widget.state.gameName,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Game name"),
            onChanged: context.read<AddPlayersCubit>().onGameNameChange,
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  autocorrect: false,
                  focusNode: _focusNode,
                  controller: widget.state.controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Player name"),
                  onChanged: (value) => setState(() {}),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (value) {
                    if (widget.state.controller.text.isNotEmpty &&
                        _formKey.currentState!.validate()) {
                      widget.onSubmit();
                    }
                    _focusNode.requestFocus();
                  },
                  validator: widget.validator,
                ),
              ),
              const Gap(8),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: IconButton(
                  onPressed: _formKey.currentState != null &&
                          widget.state.controller.text.isNotEmpty &&
                          _formKey.currentState!.validate()
                      ? () => widget.onSubmit()
                      : null,
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
