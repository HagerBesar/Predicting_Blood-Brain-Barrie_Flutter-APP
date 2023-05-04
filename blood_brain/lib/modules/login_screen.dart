import 'package:blood_brain/layout/brain_layout.dart';
import 'package:blood_brain/shared/cubit/cubit.dart';
import 'package:blood_brain/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => BrainCubit(),
        child: BlocConsumer<BrainCubit, BrainStates>(
            listener: (context, state) {},
            builder: (context, state){
              BrainCubit cubit = BrainCubit.get(context);
              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                    ),
                    onPressed: () {},
                  ),
                  title: Text(
                    'Blood Brain Barrier',
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none_outlined,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value != 'hagerbesar10@gmail.com') {
                                  return 'The Email is not correct';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                prefixIcon: Icon(
                                  Icons.email,
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: cubit.isPassword,
                              onFieldSubmitted: (String value) {
                                print(value);
                              },
                              validator: (value) {
                                if (value != 'hager123') {
                                  return 'Password is Not correct';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.changePasswordIcon();
                                  },
                                  icon: Icon(
                                    cubit.isPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: double.infinity,
                              color: Colors.blue,
                              child: MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BrainLayout()),
                                    );
                                  }
                                },
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account?',
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Register Now',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            })
    );
  }
}

