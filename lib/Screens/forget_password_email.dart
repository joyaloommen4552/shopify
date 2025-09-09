import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopify/CustomClass/screen_config.dart';
import 'package:shopify/Screens/confirm_password.dart';

class ForgetPasswordEmail extends StatefulWidget {
  const ForgetPasswordEmail({super.key});

  @override
  State<ForgetPasswordEmail> createState() => _ForgetPasswordEmailState();
}

class _ForgetPasswordEmailState extends State<ForgetPasswordEmail> {
  bool obsure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/front.png',
                fit: BoxFit.cover, // fills screen without stretching oddly
              ),
            ),

            // Foreground content
            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: ScreenConfig.height * 0.025),
                  SizedBox(
                    width: ScreenConfig.width * 0.8,
                    height: ScreenConfig.height * 0.5,
                    child: Image.asset("assets/images/customers.png"),
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
                  Text(
                    "Enter your email to receive a password \n reset",
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
                        TextField(
                          decoration: InputDecoration(
                              hintText: "Example@123.com",
                              hintStyle: TextStyle(
                                  color: const Color(0xFFC5C5C5),
                                  fontSize: 14),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                        ),
                        SizedBox(
                          height: ScreenConfig.height * 0.025,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const ConfirmPassword(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(ScreenConfig.width * 0.75,
                                  ScreenConfig.height * 0.05625),
                              backgroundColor: const Color(0xFF4CAF50),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(
                            "Reset Password",
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
          ],
        ),
      ),
    );
  }
}
