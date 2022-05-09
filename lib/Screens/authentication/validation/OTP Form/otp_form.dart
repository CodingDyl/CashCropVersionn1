import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();

    super.dispose();
  }

  void nextField({required String value, FocusNode? focusNode}) {
    if (value.length == 1) {
      // focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 70,
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              obscureText: true,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value: value, focusNode: pin2FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              focusNode: pin2FocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              obscureText: true,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value: value, focusNode: pin3FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              focusNode: pin3FocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              obscureText: true,
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value: value, focusNode: pin4FocusNode);
              },
            ),
          ),
          SizedBox(
            width: 70,
            child: TextFormField(
              focusNode: pin4FocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
              obscureText: true,
              decoration: otpInputDecoration,
              onChanged: (value) {
                pin4FocusNode.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }
}
