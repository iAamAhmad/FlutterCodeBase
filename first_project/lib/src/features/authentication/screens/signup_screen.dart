import 'package:flutter/material.dart';

import '../../../common_widgets/btn_elevated.dart';
import '../../../common_widgets/text_button_widget.dart';
import '../../../common_widgets/text_field.dart';
import '../../../constant/cliper_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDesignComponent(),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: _textFieldsComponent(),
              ),
              _buttonTextComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buttonTextComponent() {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  ButtonWidgetText(
                    text: 'I Agree to the Terms & Conditions',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        btnElevated(
          onPressed: () {},
          text: 'Sign up',
        ),
        ButtonWidgetText(
          fontSize: null,
          text: "Already have an account?Log in",
          onPressed: () {},
        ),
      ],
    ),
  );
}

Widget _textFieldsComponent() {
  return Column(
    children: [
      TextFieldWidget(
        hintText: 'Name',
        icon: Icons.person_outline,
        labelText: 'Enter Your Name',
      ),
      SizedBox(
        height: 10,
      ),
      TextFieldWidget(
        hintText: 'Email',
        icon: Icons.email_outlined,
        labelText: 'Enter Your Email',
      ),
      SizedBox(
        height: 10,
      ),
      TextFieldWidget(
        hintText: 'Password',
        icon: Icons.lock_outline,
        sufIcon: Icons.remove_red_eye_outlined,
        labelText: 'Enter Your Password',
      ),
    ],
  );
}

Widget _buildDesignComponent() {
  return Container(
    child: Column(
      children: [
        Stack(
          children: [
            Opacity(
              opacity: 0.7,
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.blueGrey.shade200,
                  height: 250,
                ),
              ),
            ),
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 230,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sign up Now!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
