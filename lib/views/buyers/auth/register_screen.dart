import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor_app/controllers/auth_controller.dart';
import 'package:multi_vendor_app/utils/show_snackBar.dart';
import 'package:multi_vendor_app/views/buyers/auth/login_screen.dart';

class BuyerRegisterScreen extends StatefulWidget {
  @override
  State<BuyerRegisterScreen> createState() => _BuyerRegisterScreenState();
}

class _BuyerRegisterScreenState extends State<BuyerRegisterScreen> {
  // const BuyerRegisterScreen({super.key});
final AuthController _authController = AuthController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

late String email;

late String fullName;

 late String phoneNumber;

 late String password;
bool _isLoading = false;

Uint8List? _image;


 _signUpUser()async {
  setState(() {
    _isLoading = true;
  });
 if( _formKey.currentState!.validate()){
 await _authController.signUpUsers(
    email, fullName, phoneNumber, password, _image).whenComplete((){
      setState(() {
        _formKey.currentState?.reset();
_isLoading = false;

      });
    });
 return showSnack(context, 'Congratulations Account has been created');
 
 }else{
  setState(() {
    _isLoading= false;
  });
return snowSnack(context, 'Please fields must not be empty');
 }
 }

selectGalleryImage()async{
 
 Uint8List  im = await _authController.pickProfileImage(ImageSource.gallery);

setState(() {
  _image = im;
});

}

selectCameraImage()async{
 
 Uint8List  im = await _authController.pickProfileImage(ImageSource.camera);

setState(() {
  _image = im;
});

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key:_formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create Customer's Account",
                style: TextStyle(fontSize:20 ),
                ),
            //  const Icon(Icons.lock,
            //   size:100,
            //   ),
            Stack(
              children: [
                _image!=null? 
                CircleAvatar(
                  radius: 64,
                  backgroundColor:const Color.fromARGB(255, 13, 62, 86),
                  backgroundImage: MemoryImage(_image!),
                ):CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.grey[500],
                  backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg'),
                ),
Positioned(
  right: 0,
  top:5,
  child: IconButton(
  onPressed:(){
    selectGalleryImage();
  },
   icon: Icon(CupertinoIcons.photo,
  //  color: Colors.white,
   ),
   ),
   ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Email must not be empty';
                  }else{
                    return null;
                  }
                },
                 onChanged: (value){
                  email = value;
                },decoration: InputDecoration(
              labelText: 'Enter Email',
              ),),
            ),
            
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Fullname must not be empty';
                  }else{
                    return null;
                  }
                },
                onChanged: (value){
                 fullName = value;
                },
                decoration: InputDecoration(
              labelText: 'Enter Full Name',
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please Phonenumber must not be empty';
                  }else{
                    return null;
                  }
                },
                 onChanged: (value){
                 phoneNumber = value;
                },
                decoration: InputDecoration(
              labelText: 'Enter Phone Number',
              ),),
            ),
            
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: TextFormField(
                obscureText: true,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please password must not be empty';
                  }else{
                    return null;
                  }
                },
                 onChanged: (value){
                  password = value;
                },
                decoration: InputDecoration(
              labelText: 'Enter Password',
              ),),
            ),
            GestureDetector(
              onTap: (){
              _signUpUser();
              },
              child: Container(
                width:MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 13, 62, 86),
                  borderRadius:BorderRadius.circular(10),
                ),
              child: Center(
                child: _isLoading ? CircularProgressIndicator(
                  color:Colors.white,
                ): Text("Register",
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  letterSpacing :4,
                  ),
                  )
                  ),
              
                ),
            ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have An Account?'),
                  TextButton(onPressed: (){
            Navigator.push(context,
             MaterialPageRoute(builder: (context){
              return LoginScreen();
             }));
                  },
                   child: Text('Login'),
                   ),
                ],
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  snowSnack(BuildContext context, String s) {}
}