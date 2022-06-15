import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
    required this.text,
    this.inverted = false,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function() press;
  final bool? inverted;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 200,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: inverted! ? Colors.white : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: inverted! ? Theme.of(context).primaryColor : Colors.white,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}
