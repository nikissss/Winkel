import 'package:flutter/material.dart';
import 'package:multi_vendor_app/components/mytextfield.dart';

class Registerpage extends StatelessWidget {
 Registerpage({super.key});
  // controller
  final enteremailcontroller = TextEditingController();
  final forgetpasswordcontroller= TextEditingController();
  final ResetpasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child:Center(
          child: Column(
          children: [
             const SizedBox(height:50),
          //logo
         const Icon(Icons.lock,
          size:100,
          ),
  const SizedBox(height:50),

          //welcome back you have been missed
          Text("welcome back you have been missed !",
          style:TextStyle(color:Colors.grey[700],
          fontSize:16,
          ),
         
          ),

          const SizedBox(height:25),

          //email texfield
         MyTextField(
          controller:enteremailcontroller,
          hintText:'enter your email',
          obscureText:false,
         ),

         const SizedBox(height:10),

          //forgetpassword textfield
         MyTextField(
          controller:forgetpasswordcontroller,
          hintText:'password',
          obscureText:true,
         ),
         MyTextField(
          controller:ResetpasswordController,
           hintText:'reset password',
            obscureText:true
            )
          //forget password?
          // signin button
          //or continue with
          //google + biometric signin
          //not a member ?register now
          //

        
        
        ],),
        )
      )

    );
  }

}

