import 'package:flutter/material.dart';
import 'package:apnimandi_client/constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

/// State:

/// Utils/Helpers:
import 'package:responsive_builder/responsive_builder.dart';

/// Entry Point:
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
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
                            "Password Recovery",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                              "Please enter your email address to \n          recover your password"),
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
                                        setState(() {});
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
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account?"),
                              const SizedBox(
                                width: 8,
                              ),
                              InkWell(
                                onTap: () {
                                  GoRouter.of(context).pop();
                                },
                                child: const Text(
                                  "Sign In!",
                                  style: TextStyle(
                                      color: Color(kPrimaryGreenColor),
                                      fontWeight: FontWeight.bold),
                                ),
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
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  primary: const Color(kPrimaryGreenColor),
                                  onPrimary: const Color(kPrimaryGreenColor),
                                  onSurface: Colors.green,
                                ),
                                child: const Text(
                                  "Send Email",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     GoRouter.of(context).pop();
                          //   },
                          //   child: const Text("Go back"),
                          // ),
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
