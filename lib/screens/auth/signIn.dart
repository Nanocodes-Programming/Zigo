import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zigo/constants/app_colors.dart';
import 'package:zigo/constants/dimensions.dart';
import 'package:zigo/controllers/auth_controller.dart';
import 'package:zigo/widgets/app_button.dart';
import 'package:zigo/widgets/zigo_logo.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  // getting an instance of the authController
  AuthController controller = Get.find();

  //Input controllers
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  // form key
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // stack for the top image and Zigo logo
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: Dimensions.height50*8,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/signIn.png'),
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    margin: EdgeInsets.only(top: Dimensions.height50*4),
                    child: ZigoLogo(zFontSize: Dimensions.height20*5.5, textFontSize: Dimensions.height20*2)
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height50),
            // Input fields section
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    // for username
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      validator: (value){
                        if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {                            
                          return "Provide a valid email in order to login";
                        }else{
                          return null;
                        }
                      },     
                      decoration: InputDecoration(
                        helperText: 'Email',
                        helperStyle: GoogleFonts.montserrat(
                          color: AppColors.mainColor,
                          fontSize: Dimensions.font16+2,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    // for password
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: _passwordController,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8 ) {                            
                          return "Password should contain atleast 8 characters";
                        }else{
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        helperText: 'Password',
                        helperStyle: GoogleFonts.montserrat(
                          color: AppColors.mainColor,
                          fontSize: Dimensions.font16+2,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                     // forget passsword section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // for forgot password text
                        InkWell(
                          onTap: (){},
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.montserrat(
                              color: AppColors.mainColor,
                              fontSize: Dimensions.font12+2,
                            ),
                          ),
                        ),
                        // sign in button (from our custom button)
                        AppButton(
                          text: 'Sign in', 
                          onTap: (){
                            //only proceeds if form data are valid
                            if(formKey.currentState!.validate()){
                              // calling the login from authController
                              controller.login(_emailController.text.trim(), _passwordController.text.trim());
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Create account section
            SizedBox(height: Dimensions.height30),
            InkWell(
              onTap: (){
                controller.navigateToSignUpScreen();
              },
              child: Text(
              'Create Account',
                style: GoogleFonts.montserrat(
                  color: AppColors.mainColor.withOpacity(0.7),
                  fontSize: Dimensions.font12,
                  fontWeight: FontWeight.bold,
                ),
              ),
           ),
           SizedBox(height: Dimensions.height30),
          ],
        ),
      ),
    );
  }
}