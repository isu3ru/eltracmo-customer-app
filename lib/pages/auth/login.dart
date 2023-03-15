import 'package:eltracmo_customers/pages/auth/register.dart';
import 'package:eltracmo_customers/pages/customer/dashboard_page.dart';
import 'package:eltracmo_customers/widgets/form/form_label.dart';
import 'package:eltracmo_customers/widgets/form/rounded_corner_text_field.dart';
import 'package:eltracmo_customers/widgets/rounded_button.dart';
import 'package:eltracmo_customers/widgets/rounded_cornered_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.15),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/eltracmo_logo.png',
                  width: 200.0,
                  height: 100.0,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                FormBuilder(
                  key: _formKey,
                  // enabled: false,
                  onChanged: () {
                    // _formKey.currentState!.save();
                    // debugPrint(_formKey.currentState!.value.toString());
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                  initialValue: const {
                    // 'movie_rating': 5,
                    // 'best_language': 'Dart',
                    // 'age': '13',
                    // 'gender': 'Male',
                    // 'languages_filter': ['Dart']
                  },
                  skipDisabled: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(text: 'Mobile Number'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'phone_number',
                        errorText: 'A valid phone number is required',
                        textInputType: TextInputType.phone,
                        isObscure: false,
                        hintText: 'Enter your mobile number',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Password'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'password',
                        errorText: 'Password is required.',
                        textInputType: TextInputType.visiblePassword,
                        isObscure: true,
                        hintText: 'Enter your password',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      RoundedCorneredButton(
                        buttonText: 'Log In',
                        onPressed: () {
                          if (!_formKey.currentState!.saveAndValidate()) {
                            debugPrint(_formKey.currentState!.value.toString());
                            return;
                          }

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                            builder: (context) {
                              return const Dashboard();
                            },
                          ), (route) => false);
                        },
                        isDisabled: false,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const RegistrationPage();
                                },
                              ), (route) => false);
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
