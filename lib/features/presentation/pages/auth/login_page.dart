import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:teacher/core/routes/app_router.gr.dart';
import 'package:teacher/core/util/constant.dart';
import 'package:teacher/di/injection.dart';

import 'package:teacher/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:teacher/features/presentation/pages/auth/widgets/already_have_account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //*text controllers
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();

  //* form
  late final _formKey = GlobalKey<FormState>();

  //*initializing bloc
  final _bloc = getIt<AuthBloc>();

  //* hiding showing pass
  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //*bloc provider for state management..create auth bloc
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            success: (e) {
              //*Route to hompage..for student and teacher
              WidgetsBinding.instance?.addPostFrameCallback(
                  (_) => context.router.replace(TeacherHomeRoute()));
            },
            error: (e) {
              //*display error message whe login failure
              //*show snackbar toast
              ScaffoldMessenger.maybeOf(context)
                ?..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.fixed,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "LOGIN ERROR",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // SizedBox(height: 3),
                        Text(e.message)
                      ],
                    ),
                  ),
                );
            },
          );
        },
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TEACHER LOGIN",
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "email@example.com",
                          ),
                          validator: (value) {
                            if (RegExp(emailRegex)
                                .hasMatch(value!.trim().toLowerCase())) {
                              return null;
                            } else {
                              return "email must be valid";
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.go,
                          obscureText: _isHidden,
                          onFieldSubmitted: (_) {
                            if (_formKey.currentState!.validate()) {
                              print("is valid");

                              //*call login bloc
                              _bloc.add(
                                AuthEvent.login(
                                  email: _emailController.text
                                      .trim()
                                      .toLowerCase(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                            }
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "enter your password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isHidden
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isHidden = !_isHidden;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (RegExp(passRegex).hasMatch(value!.trim())) {
                              return null;
                            } else {
                              return "password must be minimum of 6 alphanumerical";
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            String? text;
                            state.maybeMap(orElse: () {
                              text = "Login";
                            }, loading: (e) {
                              text = "Please Wait";
                            });

                            return MaterialButton(
                              elevation: 0,
                              color: kYellowColor,
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                height: 50,
                                child: Text(
                                  text!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  print("is valid");

                                  //*call login bloc
                                  _bloc.add(
                                    AuthEvent.login(
                                      email: _emailController.text
                                          .trim()
                                          .toLowerCase(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  AlreadyHaveAnAccountCheck(
                    color: kYellowColor,
                    press: () => context.router.push(RegisterRoute()),
                    login: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
