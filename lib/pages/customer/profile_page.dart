import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eltracmo_customers/pages/common/dialogs.dart';
import 'package:eltracmo_customers/pages/common/loading_screen.dart';
import 'package:eltracmo_customers/widgets/form/form_label.dart';
import 'package:eltracmo_customers/widgets/form/rounded_corner_image_picker.dart';
import 'package:eltracmo_customers/widgets/form/rounded_corner_text_field.dart';
import 'package:eltracmo_customers/widgets/rounded_cornered_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:eltracmo_customers/services/customer_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  File? selectedImageFile;
  bool isLoading = false;
  Map<String, dynamic> profileData = {};

  Future<void> handleSaveChanges() async {
    // validate
    if (!_formKey.currentState!.saveAndValidate()) {
      // show validation error dialog
      showDialog(
        context: context,
        builder: (context) {
          return Dialogs.getAlertDialog(
              context, 'Required Data', 'Please fill all required data.');
        },
      );
      return;
    }

    // save
    var formData = _formKey.currentState!.value;

    FormData data = FormData.fromMap({
      'first_name': formData['first_name'],
      'last_name': formData['last_name'],
      'email': formData['email'],
      'address': formData['address'],
      'photo': selectedImageFile != null
          ? await MultipartFile.fromFile(selectedImageFile!.path)
          : null,
    });

    setState(() {
      isLoading = true;
    });

    CustomerService.updateCustomerProfile(data).then((isUpdated) {
      setState(() {
        isLoading = false;
      });
      if (isUpdated) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialogs.getAlertDialog(
                context, 'Success', 'Profile updated successfully.');
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return Dialogs.getAlertDialog(
                context, 'Error', 'An error occurred while updating profile.');
          },
        );
      }
    });
  }

  void loadProfileData() {
    setState(() {
      isLoading = true;
    });

    CustomerService.getCustomerProfile().then((data) {
      setState(() {
        isLoading = false;
      });

      if (data.isEmpty) {
        showDialog(
            context: context,
            builder: (context) {
              return Dialogs.getAlertDialog(
                  context, 'Error', 'An error occurred while loading profile');
            });
        return;
      } else {
        print(data);
        setState(() {
          profileData = data;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: isLoading
          ? const LoadingScreen()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilder(
                  key: _formKey,
                  initialValue: profileData,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FormLabel(text: 'First Name'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'first_name',
                        errorText: 'First name is required',
                        textInputType: TextInputType.name,
                        isObscure: false,
                        hintText: 'Enter your first name here...',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Last Name'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'last_name',
                        errorText: 'Second name is required',
                        textInputType: TextInputType.name,
                        isObscure: false,
                        hintText: 'Enter your second name here...',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Photo'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      RoundedCornerImagePicker(
                        onImagePicked: (imageFile) {
                          setState(() {
                            selectedImageFile = imageFile;
                          });
                        },
                        image: profileData['photo'] != null
                            ? NetworkImage(profileData['photo'])
                            : null,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Email'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'email',
                        errorText: 'Your email address is required.',
                        textInputType: TextInputType.emailAddress,
                        isObscure: false,
                        hintText: 'Enter your email address here...',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const FormLabel(text: 'Address'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      const RoundedCornerTextField(
                        name: 'address',
                        errorText: 'Your address is required.',
                        textInputType: TextInputType.streetAddress,
                        isObscure: false,
                        hintText: 'Enter your address here...',
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      RoundedCorneredButton(
                        buttonText: 'Save Changes',
                        onPressed: () {
                          handleSaveChanges();
                        },
                        isDisabled: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
