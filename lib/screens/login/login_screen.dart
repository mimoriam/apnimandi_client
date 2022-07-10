import 'package:flutter/material.dart';
import 'package:apnimandi_client/constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:
import 'package:flutter_switch/flutter_switch.dart';

/// Services:
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// State:

/// Utils/Helpers:
import 'package:responsive_builder/responsive_builder.dart';

/// Entry Point:
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool switchTile = false;

  @override
  Widget build(BuildContext context) {
    String saveMeText = "Save Me";

    Color getTextColorFromSwitch(String textToBeAssessed) {
      if (switchTile == false) {
        return Colors.grey;
      } else {
        return const Color(kPrimaryGreenColor);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) {
            return OrientationLayoutBuilder(
              // Force a screen to stay in portrait/landscape. Overrides the OrientationLayoutBuilder
              // mode: OrientationLayoutBuilderMode.portrait,
              portrait: (context) => Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Image(
                        width: 200,
                        height: 60,
                        // fit: BoxFit.fill,
                        image: AssetImage('assets/logo.png'),
                      ),
                      const Text(
                        "Let's Sign You In",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      const Text("Welcome back, you've been missed!"),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Email",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      FormBuilder(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, top: 10.0, right: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: FormBuilderTextField(
                                  name: 'email',
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(20),
                                    hintStyle: TextStyle(fontSize: 17),
                                    suffixIcon:
                                        Icon(Icons.check_circle_outline),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Password",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0,
                                      top: 10.0,
                                      bottom: 10.0,
                                      right: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FormBuilderTextField(
                                      name: 'password',
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(20),
                                        hintStyle: TextStyle(fontSize: 17),
                                        suffixIcon:
                                            Icon(Icons.remove_red_eye_outlined),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: FlutterSwitch(
                                        activeColor: const Color(kPrimaryGreenColor),
                                        width: 48,
                                        height: 24,
                                        toggleSize: 12.0,
                                        // inactiveColor: Colors.red,
                                        inactiveSwitchBorder:
                                            Border.all(color: Colors.grey),
                                        inactiveColor: Colors.white70,
                                        toggleColor: Colors.grey,
                                        activeToggleColor: Colors.white,
                                        value: switchTile,
                                        onToggle: (bool val) {
                                          setState(() {
                                            switchTile = val;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      saveMeText,
                                      style: TextStyle(
                                          color: getTextColorFromSwitch(
                                              saveMeText)),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color(kPrimaryGreenColor)),
                              ),
                              child: const Text("Sign In"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              landscape: (context) => Container(),
            );
          },
          tablet: (BuildContext context) {
            return OrientationLayoutBuilder(
              portrait: (context) => Container(),
              landscape: (context) => Container(),
            );
          },
          desktop: (BuildContext context) => Container(),
        ),
      ),
    );
  }
}
