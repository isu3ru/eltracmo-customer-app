import 'package:eltracmo_customers/pages/auth/login.dart';
import 'package:eltracmo_customers/widgets/form/form_label.dart';
import 'package:eltracmo_customers/widgets/form/rounded_corner_text_field.dart';
import 'package:eltracmo_customers/widgets/rounded_button.dart';
import 'package:eltracmo_customers/widgets/rounded_cornered_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.05,
          ),
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
                  'Register Your Account',
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
                  onChanged: () {},
                  autovalidateMode: AutovalidateMode.disabled,
                  initialValue: const {},
                  skipDisabled: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(text: 'First Name'),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'firstname',
                        errorText: 'Your first name is required',
                        textInputType: TextInputType.name,
                        isObscure: false,
                        hintText: 'Enter your first name here..',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Last Name'),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'lastname',
                        errorText: 'Your last name is required',
                        textInputType: TextInputType.name,
                        isObscure: false,
                        hintText: 'Enter your last name here..',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Mobile Number'),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'phone_number',
                        errorText: 'Your mobile number is required',
                        textInputType: TextInputType.phone,
                        isObscure: false,
                        hintText: 'Enter your mobile number here..',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Password'),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'password',
                        errorText: 'Your password is required',
                        textInputType: TextInputType.visiblePassword,
                        isObscure: true,
                        hintText: 'Enter your password here..',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      RoundedCorneredButton(
                        buttonText: 'Register',
                        onPressed: () {
                          if (!_formKey.currentState!.saveAndValidate()) {
                            debugPrint(_formKey.currentState!.value.toString());
                            return;
                          }
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
                            'Already have an account?',
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
                                  return const LoginPage();
                                },
                              ), (route) => false);
                            },
                            child: const Text(
                              'Login',
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
