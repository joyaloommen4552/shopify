import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify/CustomClass/screen_config.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  bool obsure = true;
  bool obsure2 = true;

  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/front.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Form(
                key: _formkey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: ScreenConfig.height * 0.143,
                    ),
                    SizedBox(
                      width: ScreenConfig.width * 0.35,
                      //height: ScreenConfig.height * 0.43,
                      child: Image.asset("assets/images/forgetpass22.png"),
                    ),
                    Text(
                      "Your Password must be atleast contain \n a special character and 8 digit long",
                      style: TextStyle(
                          color: const Color(0xFFB8B7B3),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: ScreenConfig.height * 0.02),
                    RichText(
                      text: TextSpan(
                        text: "Forget  ",
                        style: GoogleFonts.inter(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "Password?",
                            style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
                      child: Column(
                        children: [
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
                          SizedBox(
                            height: ScreenConfig.height * 0.025,
                          ),
                          Row(
                            children: [
                              Text(
                                "Confirm Password",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: const Color(0xFFB8B7B3),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: _confirmpasswordcontroller,
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
                                        obsure2 = !obsure2;
                                      });
                                    },
                                    icon: Icon(obsure2
                                        ? Icons.visibility_off
                                        : Icons.visibility))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              if (value != _passwordcontroller.text) {
                                return 'Password do not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: ScreenConfig.height * 0.25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Password Changed")));
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
                              "Submit",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenConfig.height * 0.025,
                          ),
                        ],
                      ),
                    ),
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
