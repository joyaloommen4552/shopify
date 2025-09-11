import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify/CustomClass/screen_config.dart';
import 'package:shopify/Screens/create_account.dart';
import 'package:shopify/Screens/forget_password_email.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsure = true;

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          // <-- Use Stack for background + content
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/images/front.png',
                fit: BoxFit.cover, // fills screen without stretching oddly
              ),
            ),

            // Foreground content
            Center(
              child: Form(
                key: _formkey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: ScreenConfig.height * 0.025),
                    SizedBox(
                      width: ScreenConfig.width * 0.8,
                      height: ScreenConfig.height * 0.37,
                      child: Image.asset("assets/images/loginScreen.png"),
                    ),
                    SizedBox(height: ScreenConfig.height * 0.02),
                    RichText(
                      text: TextSpan(
                        text: "Hello  ",
                        style: GoogleFonts.inter(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "Again!",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Login and enjoy your Shopping",
                      style: TextStyle(
                          color: const Color(0xFFB8B7B3),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Email",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: const Color(0xFFB8B7B3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _emailcontroller,
                            decoration: InputDecoration(
                                hintText: "Example@123.com",
                                hintStyle: TextStyle(
                                    color: const Color(0xFFC5C5C5),
                                    fontSize: 14),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is required";
                              }
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: ScreenConfig.height * 0.025,
                          ),
                          Row(
                            children: [
                              Text(
                                "Password",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: const Color(0xFFB8B7B3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _passwordcontroller,
                            obscureText: obsure,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2)),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.grey,
                                )),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        obsure = !obsure;
                                      });
                                    },
                                    icon: Icon(obsure
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const ForgetPasswordEmail(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forget Password?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Login Successfull")));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(ScreenConfig.width * 0.75,
                                    ScreenConfig.height * 0.05625),
                                backgroundColor: const Color(0xFF4CAF50),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenConfig.height * 0.025,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/images/google.png",
                              height: 24,
                              width: 24,
                            ),
                            label: Text(
                              "Sign In With Google",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(194, 255, 255, 255),
                                foregroundColor: Colors.grey,
                                minimumSize: Size(
                                  ScreenConfig.width *
                                      0.8, // 80% of screen width
                                  ScreenConfig.height *
                                      0.06, // 6% of screen height
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenConfig.height * 0.0125,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CreateAccount(),
                            ),
                          );
                        },
                        child: RichText(
                            text: TextSpan(
                                text: "New User?  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                                children: [
                              TextSpan(
                                text: "Create Account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 48, 208, 91)),
                              )
                            ])))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
