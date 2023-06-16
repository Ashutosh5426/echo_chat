import 'package:echo_chat/core/app_colors.dart';
import 'package:echo_chat/core/app_images.dart';
import 'package:echo_chat/core/app_strings.dart';
import 'package:echo_chat/core/common_bloc_state.dart';
import 'package:echo_chat/features/login_signup_page/presentation/bloc/login_signup_bloc.dart';
import 'package:echo_chat/features/login_signup_page/presentation/bloc/login_signup_event.dart';
import 'package:echo_chat/features/login_signup_page/presentation/bloc/login_signup_state.dart';
import 'package:echo_chat/features/login_signup_page/presentation/widgets/common_methods.dart';
import 'package:echo_chat/features/login_signup_page/presentation/widgets/error_text.dart';
import 'package:echo_chat/features/login_signup_page/presentation/widgets/textfield_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// TEXT CONTROLLERS
    var phoneController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    /// GETTING BLOC INSTANCE
    LoginSignupBloc blocInstance = BlocProvider.of<LoginSignupBloc>(context);

    return Scaffold(
      /// AppBar -  APP LOGO
      appBar: AppBar(
        toolbarHeight: 200,
        backgroundColor: AppColors.green,
        title: Image.asset(AppImages.appLogo, width: 80, color: Colors.white),
        elevation: 0,
      ),

      /// Body - SIGNUP FORM
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),

            /// Headline - CREATE A NEW ACCOUNT
            const Text(
              AppStrings.createANewAccount,
              style: TextStyle(
                color: AppColors.darkGreen,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            /// Label Text - PHONE, PHONE NUMBER TEXTFIELD, ERROR TEXT  AND DIVIDER
            ...[
              Text(
                AppStrings.phone,
                style: CommonMethods.labelTextStyle(),
              ),
              TextField(
                controller: phoneController,
                style: CommonMethods.textFieldTextStyle(),
                keyboardType: TextInputType.phone,
                maxLength: 11,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CustomInputFormatter(),
                ],
                decoration: CommonMethods.inputDecoration(AppStrings.phoneHint),
              ),
              const TextFieldDivider(),
              BlocBuilder(
                bloc: blocInstance,
                builder: (BuildContext context, LoginSignupState state) {
                  if (state.status == Status.error) {
                    return ErrorText(state.error[0]);
                  }
                  return const ErrorText(AppStrings.emptyString);
                },
              ),
              const SizedBox(height: 20),
            ],

            /// LABEL TEXT - EMAIL ADDRESS, EMAIL ADDRESS TEXTFIELD, ERROR TEXT AND DIVIDER
            ...[
              Text(
                AppStrings.emailAddress,
                style: CommonMethods.labelTextStyle(),
              ),
              TextField(
                controller: emailController,
                style: CommonMethods.textFieldTextStyle(),
                decoration: CommonMethods.inputDecoration(AppStrings.emailHint),
              ),
              const TextFieldDivider(),
              BlocBuilder(
                bloc: blocInstance,
                builder: (BuildContext context, LoginSignupState state) {
                  if (state.status == Status.error) {
                    return ErrorText(state.error[1]);
                  }
                  return const ErrorText(AppStrings.emptyString);
                },
              ),
              const SizedBox(height: 20),
            ],

            /// LABEL TEXT - PASSWORD, PASSWORD TEXTFIELD, ERROR TEXT AND DIVIDER
            ...[
              Text(
                AppStrings.password,
                style: CommonMethods.labelTextStyle(),
              ),
              TextField(
                controller: passwordController,
                style: CommonMethods.textFieldTextStyle(),
                obscureText: true,
                decoration:
                    CommonMethods.inputDecoration(AppStrings.passwordHint),
              ),
              const TextFieldDivider(),
              BlocBuilder(
                bloc: blocInstance,
                builder: (BuildContext context, LoginSignupState state) {
                  if (state.status == Status.error) {
                    return ErrorText(state.error[2]);
                  }
                  return const ErrorText(AppStrings.emptyString);
                },
              ),
              const SizedBox(height: 20),
            ],

            /// SIGNUP BUTTON
            GestureDetector(
              onTap: () {
                blocInstance.add(SignupUserEvent(
                  phone: phoneController.text.replaceAll(' ', ''),
                  email: emailController.text,
                  password: passwordController.text,
                ));
              },
              child: Container(
                width: double.maxFinite,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    AppStrings.signUp,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 5 == 0 && nonZeroIndex != text.length) {
        buffer.write(
            ' '); // Replace this with anything you want to put after each 5 numbers
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
