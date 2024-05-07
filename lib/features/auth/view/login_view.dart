import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:netfliex/core/Utils/color.dart';
import 'package:netfliex/core/Utils/text_styles.dart';
import 'package:netfliex/core/Utils/widget/custom_buttom.dart';
import 'package:netfliex/core/Utils/widget/custom_dialoges.dart';
import 'package:netfliex/core/function/emailvalidate.dart';
import 'package:netfliex/core/function/push_pop_function.dart';
import 'package:netfliex/features/auth/view/signup_view.dart';
import 'package:netfliex/features/auth/view_model/auth_qubit.dart';
import 'package:netfliex/features/auth/view_model/auth_states.dart';
import 'package:netfliex/features/navbar.dart';
class LoginView extends StatefulWidget {
  const LoginView({
    super.key,

  });


  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isnotvesable = true;


  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessStates) {
          pushAndRemoveUntil(context, const NavBar());
        } else if (state is LoginErrorStates) {
          Navigator.pop(context);
          ShowErrorDialoge(context, state.error);
        } else {
          CircularProgressIndicator(color: Colors.red,strokeAlign: 5,strokeWidth: 5,);
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
                          'Welcome',
                          style: getTextTitle(
                              color: AppColor.primarycolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Gap(50),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                             prefixIcon:  Icon(
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
                            if (value!.isEmpty) return 'please enter your password';
                            return null;
                          },
                        ),
                        Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Forgot your password ? ',
                                style: getTextbady(fontSize: 15,color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Gap(25),
                        CustomElevatedButton(
                            text: 'Login',
                            style: getTextTitle(
                                fontSize: 24, color: AppColor.whiteColor),
                            radius: 25,
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                context.read<AuthCubit>().Login(
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
                            // Text(
                            //   'ليس لدي حساب؟',
                            //   style: getTextbady(),
                            // ),
                            TextButton(
                              onPressed: () {
                                pushReplacement(
                                    context, RegisterView());
                              },
                              child: Text('SingUp',
                                  style: getTextbady(color: AppColor.primarycolor)),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
