import 'package:flutter/material.dart';

import '../../../common_widgets/btn_elevated.dart';
import '../../../common_widgets/text_button_widget.dart';
import '../../../common_widgets/text_field.dart';
import '../../../constant/cliper_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    fontSize: null,
                    text: 'Remember Me',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 8),
              child: ButtonWidgetText(
                fontSize: null,
                text: 'Forgot Password?',
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 70,
        ),
        btnElevated(
          onPressed: () {},
          text: 'Login',
        ),
        ButtonWidgetText(
          fontSize: null,
          text: "Don't have an account? Sign Up",
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
                      'Welcome Back',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Log In!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
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
