import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_vendor_app/vendor/views/screens/landing_screen.dart';

import '../../controllers/vendor_register_controller.dart';

class VendorRegistrationScreen extends StatefulWidget {
  @override
  State<VendorRegistrationScreen> createState() =>
      _VendorRegistrationScreenState();
}

class _VendorRegistrationScreenState extends State<VendorRegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final VendorController _vendorController = VendorController();
  late String countryValue;

  late String bussinessName;

  late String email;

  late String phoneNumber;

  late String taxNumber;

  late String stateValue;

  late String cityValue;

  Uint8List? _image;

  selectGalleryImage() async {
    Uint8List im = await _vendorController.pickStoreImage(ImageSource.gallery);

    setState(() {
      _image = im;
    });
  }

  selectCameraImage() async {
    Uint8List im = await _vendorController.pickStoreImage(ImageSource.camera);

    setState(() {
      _image = im;
    });
  }

  String? _taxStatus;

  List<String> _taxOptions = [
    'YES',
    'NO',
  ];

  // _saveVendorDetail() async {
  //   EasyLoading.show(status: 'PLEASE WAIT');
  //   if (_formKey.currentState!.validate()) {
  //     await _vendorController
  //         .registerVendor(bussinessName, email, phoneNumber, countryValue,
  //             stateValue, cityValue, _taxStatus!, taxNumber, _image)
  //         .whenComplete(() {
  //       EasyLoading.dismiss();

  //       setState(() {
  //         _formKey.currentState!.reset();

  //         _image = null;
  //       });
  //     });
  //   } else {
  //     print('bad');

  //     EasyLoading.dismiss();
  //   }
  // }
  _saveVendorDetail() async {
    EasyLoading.show(status: 'PLEASE WAIT');
    if (_formKey.currentState!.validate()) {
      await _vendorController
          .registerVendor(bussinessName, email, phoneNumber, countryValue,
              stateValue, cityValue, _taxStatus!, taxNumber, _image)
          .whenComplete(() {
        EasyLoading.dismiss();

        // Reset form and clear image
        setState(() {
          _formKey.currentState!.reset();
          _image = null;
        });

        // Navigate to the landing screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LandingScreen()),
        );
      });
    } else {
      print('Validation failed');
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 200,
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              return FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueAccent,
                        Colors.blueGrey,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: _image != null
                              ? Image.memory(_image!)
                              : IconButton(
                                  onPressed: () {
                                    selectGalleryImage();
                                  },
                                  icon: const Icon(CupertinoIcons.photo)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        bussinessName = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Bussiness Name must not be empty';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: 'Bussiness Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Email Address Must not be empty';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Phone Number Must not be empty';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SelectState(
                        onCountryChanged: (value) {
                          setState(() {
                            countryValue = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            stateValue = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityValue = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Tax Registered?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 100,
                              child: DropdownButtonFormField(
                                  hint: const Text('Select'),
                                  items: _taxOptions
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _taxStatus = value;
                                    });
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (_taxStatus == 'YES')
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          onChanged: (value) {
                            taxNumber = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Tax Number Must not be empty';
                            } else {
                              return null;
                            }
                          },
                          decoration:
                              const InputDecoration(labelText: 'Tax Number'),
                        ),
                      ),
                    InkWell(
                      onTap: () {
                        _saveVendorDetail();
                      },
                      child: Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width - 40,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 133, 172, 192),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
