import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetXScreen extends StatelessWidget {
  GetXScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'GetX',
      home: BottomSheet(),
    );
  }
}

//?everything about getX bottom sheet
class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheet'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: 200,
                color: Colors.white,
                child: Wrap(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.wb_sunny_outlined),
                      title: const Text('Light Theme'),
                      onTap: () => {Get.changeTheme(ThemeData.light())},
                    ),
                    ListTile(
                      leading: const Icon(Icons.wb_sunny),
                      title: const Text('Dark Theme'),
                      onTap: () => {Get.changeTheme(ThemeData.dark())},
                    ),
                  ],
                ),
              ),
              barrierColor: Colors.black.withOpacity(0.5),
              isDismissible: true,
              enableDrag: true,
              backgroundColor: Colors.transparent,
              //?this is the default value
              //?if you want to use the default value, just remove this line
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
          child: const Text('Show BottomSheet'),
        ),
      ),
    );
  }
}

//?everything about snackbar
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "Snackbar Title",
                    "This will be snackbar message",
                    titleText: Text("Another Title"),
                    messageText: Text("Another Message"),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.white70,
                    borderRadius: 30.0,
                    margin: EdgeInsets.all(30.0),
                    maxWidth: double.infinity,
                    backgroundGradient: const LinearGradient(
                        colors: [Colors.red, Colors.green]),
                    borderColor: Colors.yellow,
                    borderWidth: 4,
                    boxShadows: [
                      const BoxShadow(
                          color: Colors.black,
                          offset: Offset(30, 50),
                          spreadRadius: 20.0,
                          blurRadius: 8.0),
                    ],
                    isDismissible: true,
                    dismissDirection: DismissDirection.horizontal,
                    forwardAnimationCurve: Curves.bounceInOut,
                    duration: Duration(milliseconds: 8000),
                    icon: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                    shouldIconPulse: true,
                    leftBarIndicatorColor: Colors.red,
                    mainButton: TextButton(
                      onPressed: () {},
                      child: Text("Retry"),
                    ),
                    onTap: (val) {
                      print("Snackbar Clicked");
                    },
                    overlayBlur: 5.0,
                    overlayColor: Colors.black,
                    padding: EdgeInsets.all(50),
                    showProgressIndicator: true,
                    progressIndicatorBackgroundColor: Colors.deepOrange,
                    progressIndicatorValueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.white),
                    reverseAnimationCurve: Curves.bounceInOut,
                    snackbarStatus: (val) {
                      print(val);
                    },
                    // This overrides the entire UI elements:
                    // userInputForm: Form(
                    //   child: Row(
                    //     children: [
                    //       Expanded(child: TextField(
                    //       ))
                    //     ],
                    //   ),
                    // )
                  );
                },
                child: const Text('Show Snackbar')),
          ],
        ),
      ),
    );
  }
}
