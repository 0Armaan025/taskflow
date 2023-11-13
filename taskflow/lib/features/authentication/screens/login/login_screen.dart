import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskflow/common/buttons/custom_signup_button.dart';
import 'package:taskflow/common/text_fields/custom_text_field.dart';
import 'package:taskflow/constants/Pallete.dart';
import 'package:taskflow/constants/constants.dart';
import 'package:taskflow/constants/utils.dart';
import 'package:taskflow/features/authentication/screens/signup/signup_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Pallete().bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 248, 238, 238),
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: size.height * 0.26,
                    width: size.width * 1.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo_transparent.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 208.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 203, 216, 225),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: ShapeBorder.lerp(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        4,
                      ),
                      elevation: 2.0,
                      child: Container(
                        height: size.height * 0.66,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                " Sign In ",
                                style: GoogleFonts.poppins(
                                  color: Pallete().headingTextColor,
                                  fontSize: 35,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextField(
                              controller: _emailController,
                              hintText: "Enter your email",
                              isObscure: false,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            CustomTextField(
                              controller: _passwordController,
                              hintText: "Enter your password",
                              isObscure: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              child: InkWell(
                                onTap: () {
                                  moveScreen(context, SignUpScreen(),
                                      isPushReplacement: true);
                                },
                                child: const Text("New to $appName?"),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomSignUpButton(onTap: () {}, text: "Sign In!"),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Or sign in by using:-",
                                style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/128/300/300221.png"),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/128/3291/3291695.png"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
