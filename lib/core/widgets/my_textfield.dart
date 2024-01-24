import 'package:flutter/material.dart';

import '../../screens/add_players/add_players.dart';

class MyTextField extends StatefulWidget {
  final AddPlayersLoadedState state;
  final Function onSubmit;
  final String? Function(String?) validator;

  const MyTextField({
    required this.state,
    required this.onSubmit,
    required this.validator,
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
                  widget.onSubmit();
                }
                _focusNode.requestFocus();
              },
              validator: widget.validator,
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
                  ? () => widget.onSubmit()
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
