import 'package:flutter/material.dart';

import '../../../common_widgets/btn_elevated.dart';
import '../../../common_widgets/small_images.dart';
import '../../../common_widgets/text_button_widget.dart';

class FullGoodSignUp extends StatelessWidget {
  const FullGoodSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Image(
              image: NetworkImage(
                  'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.clker.com%2Fcliparts%2FX%2Fi%2F3%2FX%2Fg%2F1%2Fblue-fish-hi.png&f=1&nofb=1&ipt=92f7300e518b297e4d71a09774698b0b8fe8faeb2eec10bb10014cecfac2c03a&ipo=images'),
              height: 100,
              width: 100,
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Colin Degrande ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 60, 132, 190),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Murphy ',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 189, 210, 228),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            'Sign up',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          ButtonWidgetText(
            onPressed: () {},
            text: 'Signup to Continue with us',
          ),
          SizedBox(
            height: 20,
          ),
          btnElevated(
            onPressed: () {},
            text: 'Continue with Google',
          ),
          SizedBox(
            height: 20,
          ),
          btnElevated(
            onPressed: () {},
            text: 'I ll use email or phone',
            textColor: Colors.black,
            width: 80,
            color: Colors.white,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallImages(
                url:
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.7PF_T5X3rVne0gCLjwpoYQHaFj%26pid%3DApi&f=1&ipt=fd7c9f8f47c5835c920bc17a5cb0a4d674fb3ba36731b4e66c4eeb037712a08c&ipo=images',
              ),
              SizedBox(
                width: 10,
              ),
              SmallImages(
                url:
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.mU-NT1WMGSlFaVvbuKJUqwHaHa%26pid%3DApi&f=1&ipt=cd951aee2339e500c8e0f374b74947d1848a139ab72a6704b463babe97296801&ipo=images',
              ),
              SizedBox(
                width: 10,
              ),
              SmallImages(
                url:
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.H38AMNqD3UfLD7ZLLZhZTQAAAA%26pid%3DApi&f=1&ipt=510e6f92c1f3bb617413f500b87d3b64d5787d02e3061226af5e881af0233553&ipo=images',
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: ButtonWidgetText(
              onPressed: () {},
              text: 'Already have an account? Login',
            ),
          ),
        ],
      ),
    );
  }
}
