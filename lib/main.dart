import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = false;
  bool hasUpperCase = false;
  bool hasDigits = false;
  bool hasLowerCase = false;
  bool hasSpecialChar = false;
  bool hasMinLength = false;
  double strengthVal = 0.0;
  getStrengthValue() {
    int count = 0;
    if (hasDigits) {
      count++;
    }
    if (hasLowerCase) {
      count++;
    }
    if (hasMinLength) {
      count++;
    }
    if (hasSpecialChar) {
      count++;
    }
    if (hasUpperCase) {
      count++;
    }

    return count * 2 / 10;
  }

  getValueColor() {
    if (getStrengthValue() == 0.2) {
      return Colors.red;
    }
    if (getStrengthValue() == 0.4) {
      return Colors.orange;
    }
    if (getStrengthValue() == 0.6) {
      return Colors.yellow;
    }
    if (getStrengthValue() == 0.8) {
      return Colors.lightGreen;
    }
    if (getStrengthValue() == 1) {
      return Colors.green;
    }
    return Colors.grey.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.black,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: IntrinsicWidth(
            child: Row(
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          centerTitle: false,
          title: Text(
            'Create Password',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 60,
                alignment: Alignment.center,
                child: TextFormField(
                  obscureText: showPassword ? false : true,
                  decoration: InputDecoration(
                    suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.contains(RegExp(r'[A-Z]'))) {
                      setState(() {
                        hasUpperCase = true;
                      });
                    } else {
                      setState(() {
                        hasUpperCase = false;
                      });
                    }
                    if (value.contains(RegExp(r'[a-z]'))) {
                      setState(() {
                        hasLowerCase = true;
                      });
                    } else {
                      setState(() {
                        hasLowerCase = false;
                      });
                    }
                    if (value.contains(RegExp(r'[0-9]'))) {
                      setState(() {
                        hasDigits = true;
                      });
                    } else {
                      setState(() {
                        hasDigits = false;
                      });
                    }
                    if (value.contains(RegExp(r'[!@#$%^&*()<>,.?":{}|]'))) {
                      setState(() {
                        hasSpecialChar = true;
                      });
                    } else {
                      setState(() {
                        hasSpecialChar = false;
                      });
                    }
                    if (value.length >= 8) {
                      setState(() {
                        hasMinLength = true;
                      });
                    } else {
                      setState(() {
                        hasMinLength = false;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Password Strength',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(getValueColor()),
                      value: getStrengthValue(),
                      backgroundColor: Colors.grey.shade300,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: hasUpperCase
                          ? Colors.green.shade100
                          : Colors.grey.shade300,
                    ),
                    child: Text(
                      'Has upper case',
                      style: TextStyle(
                          color: hasUpperCase ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: hasDigits
                          ? Colors.green.shade100
                          : Colors.grey.shade300,
                    ),
                    child: Text(
                      '1 Number',
                      style: TextStyle(
                          color: hasDigits ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: hasLowerCase
                          ? Colors.green.shade100
                          : Colors.grey.shade300,
                    ),
                    child: Text(
                      'Has lower case',
                      style: TextStyle(
                          color: hasLowerCase ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: hasMinLength
                          ? Colors.green.shade100
                          : Colors.grey.shade300,
                    ),
                    child: Text(
                      '8 character long',
                      style: TextStyle(
                          color: hasMinLength ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: hasSpecialChar
                          ? Colors.green.shade100
                          : Colors.grey.shade300,
                    ),
                    child: Text(
                      '1 special character',
                      style: TextStyle(
                          color: hasSpecialChar ? Colors.green : Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [],
              ),
            ],
          ),
        ));
  }
}
// now lets work on strngth
