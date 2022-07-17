import 'package:flutter/material.dart';
import 'package:apnimandi_client/constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

/// Services:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

/// State:

/// Utils/Helpers:
import 'package:responsive_builder/responsive_builder.dart';

/// Entry Point:
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool switchTile = false;
  bool isEmailEmpty = true;
  bool isPassEmpty = true;

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
              portrait: (context) =>
                  LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight,
                    ),
// https://stackoverflow.com/questions/55067288/how-to-position-a-widget-at-the-bottom-of-a-singlechildscrollview
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
                            padding:
                                const EdgeInsets.only(left: 8.0, top: 10.0),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                      onChanged: (val) {
                                        setState(() {
                                          if (val!.length >= 7 &&
                                              isPassEmpty == false) {
                                            isEmailEmpty = false;
                                          } else {
                                            isEmailEmpty = true;
                                          }
                                        });
                                      },
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.email()
                                      ]),
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
                                  padding: const EdgeInsets.only(
                                      left: 8.0, top: 10.0),
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: FormBuilderTextField(
                                          name: 'password',
                                          onChanged: (val) {
                                            setState(() {
                                              if (val!.length >= 6) {
                                                isPassEmpty = false;
                                              } else {
                                                isPassEmpty = true;
                                              }
                                            });
                                          },
                                          validator:
                                              FormBuilderValidators.compose([
                                            FormBuilderValidators.required()
                                          ]),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(20),
                                            hintStyle: TextStyle(fontSize: 17),
                                            suffixIcon: Icon(
                                                Icons.remove_red_eye_outlined),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: FlutterSwitch(
                                            activeColor:
                                                const Color(kPrimaryGreenColor),
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
                                    InkWell(
                                      onTap: () {
                                        GoRouter.of(context).push('/forgot_pass');
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: isEmailEmpty && isPassEmpty
                                          ? null
                                          : () {
                                              _formKey.currentState!.save();
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                print(_formKey
                                                    .currentState!.value);
                                              } else {
                                                print("validation failed");
                                              }
                                            },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        primary:
                                            const Color(kPrimaryGreenColor),
                                        onPrimary:
                                            const Color(kPrimaryGreenColor),
                                        onSurface: Colors.green,
                                      ),
                                      child: const Text(
                                        "Sign In",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text("Don't have an account?"),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Sign Up!",
                                style: TextStyle(
                                    color: Color(kPrimaryGreenColor),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Expanded(
                            child: Visibility(
                              visible: false,
                              child: Text("Invisible"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: SignInButton(
                                Buttons.Facebook,
                                text: "Continue With Facebook",
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
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
