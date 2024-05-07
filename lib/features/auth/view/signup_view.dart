import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/core/Utils/widget/custom_dialoges.dart';
import 'package:netfliex/core/function/emailvalidate.dart';
import 'package:netfliex/core/function/push_pop_function.dart';
import 'package:netfliex/features/auth/view/login_view.dart';
import 'package:netfliex/features/auth/view_model/auth_qubit.dart';
import 'package:netfliex/features/auth/view_model/auth_states.dart';
import 'package:netfliex/core/Utils/widget/custom_buttom.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController displayName = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isnotvesable = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterSuccessStates) {
            pushAndRemoveUntil(context, LoginView());
          } else if (state is RegisterErrorStates) {
            Navigator.pop(context);
            ShowErrorDialoge(context, state.error);
          } else {
            CircularProgressIndicator(
              color: Colors.red,
              strokeAlign: 5,
              strokeWidth: 5,
            );
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back',
                          style: getTextTitle(
                              color: AppColor.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Gap(20),
                        TextFormField(
                          controller: displayName,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                size: 27,
                              ),
                              hintText: 'Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your Name';
                            }
                          },
                        ),
                        Gap(20),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                size: 27,
                              ),
                              hintText: 'mohamed@gmil.com'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email';
                            } else if (!emailvalidate(value)) {
                              return 'please enter your email correct';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Gap(20),
                        TextFormField(
                          controller: passwordController,
                          obscureText: isnotvesable,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 27,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isnotvesable = !isnotvesable;
                                    });
                                  },
                                  icon: (isnotvesable)
                                      ? Icon(Icons.remove_red_eye)
                                      : Icon(Icons.visibility_off_rounded)),
                              hintText: '***************'),
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'please enter your password';
                            return null;
                          },
                        ),
                        Gap(25),
                        CustomElevatedButton(
                            text: 'Sing up',
                            style: getTextTitle(
                                fontSize: 24, color: AppColor.whiteColor),
                            radius: 25,
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                context.read<AuthCubit>().registerpatient(
                                      displayName.text,
                                      emailController.text,
                                      passwordController.text,
                                    );
                              }
                            },
                            foreground: Colors.white,
                            background: AppColor.primarycolor,
                            height: 55,
                            wight: double.infinity),
                        Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'I have an Account',
                              style: getTextbady(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () {
                                pushReplacement(context, LoginView());
                              },
                              child: Text('Login',
                                  style: getTextbady(
                                      color: AppColor.primarycolor)),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}
