import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'mycard.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  String handleCardNumber = '';
  String handleExpMonth = '';
  String handleExpYear = '';
  String handleCvv = '';
  String handleCardHolder = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E7E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE5E7E0),
        elevation: 0,
        title: const Text(
          ' Sign In',
          style: TextStyle(
            fontFamily: 'nunito',
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF34AF8D),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'images/mastercard-64.png',
                              color: Colors.white,
                              height: 40,
                            ),
                            Transform.translate(
                              offset: const Offset(6, 0),
                              child: Image.asset(
                                'images/bank-logo.png',
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        handleCardNumber.isEmpty
                            ? '0000 0000 0000 0000'
                            : handleCardNumber,
                        style: const TextStyle(
                          fontFamily: 'CREDC',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'Exp. Date ',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                handleExpMonth.isEmpty ? "MM" : handleExpMonth,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CREDC',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                r"  \  ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                handleExpYear.isEmpty ? "YY" : handleExpYear,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CREDC',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                'CVV ',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                handleCvv.isEmpty ? 'XXX' : handleCvv,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'CREDC',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        handleCardHolder.isEmpty ? 'Card Holder' : handleCardHolder,
                        style: const TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //############
              //Card Number
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      padding: const EdgeInsets.fromLTRB(16, 1, 1, 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Color(0xFF34AF8D),
                          fontFamily: 'CREDC',
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value != '5285780015651245') {
                            return 'Card Number is Invalid!';
                          }
                          return null;
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(16)],
                        onChanged: (value) {
                          setState(() {
                            handleCardNumber = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFDC5D5B),
                          ),
                          border: InputBorder.none,
                          hintText: 'Card Number',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF34AF8D),
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //##########
                    //Exp. Date
                    Row(
                      children: [
                        //##################
                        //Exp Date Month
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 7),
                            padding: const EdgeInsets.fromLTRB(16, 1, 1, 1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Color(0xFF34AF8D),
                                fontFamily: 'CREDC',
                                fontSize: 14,
                              ),
                              validator: (value) {
                                if (value != '08') {
                                  return 'Invalid !';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2)
                              ],
                              onChanged: (value) {
                                setState(() {
                                  handleExpMonth = value;
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFDC5D5B),
                                ),
                                border: InputBorder.none,
                                hintText: 'Exp. MM',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF34AF8D),
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        //#################
                        //Exp Date Year
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 7),
                            padding: const EdgeInsets.fromLTRB(16, 1, 1, 1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Color(0xFF34AF8D),
                                fontFamily: 'CREDC',
                                fontSize: 14,
                              ),
                              validator: (value) {
                                if (value != '22') {
                                  return 'Invalid !';
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(2)
                              ],
                              onChanged: (value) {
                                setState(() {
                                  handleExpYear = value;
                                });
                              },
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                errorStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFDC5D5B),
                                ),
                                border: InputBorder.none,
                                hintText: 'Exp. YY',
                                hintStyle: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF34AF8D),
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //##############
                    //Cvv
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      padding: const EdgeInsets.fromLTRB(16, 1, 1, 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Color(0xFF34AF8D),
                          fontFamily: 'CREDC',
                          fontSize: 14,
                        ),
                        validator: (value) {
                          if (value != '473') {
                            return 'Cvv Code is Invalid!';
                          }
                          return null;
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        onChanged: (value) {
                          setState(() {
                            handleCvv = value;
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFDC5D5B),
                          ),
                          border: InputBorder.none,
                          hintText: 'CVV',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF34AF8D),
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    //############
                    //Card Holder
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      padding: const EdgeInsets.fromLTRB(16, 1, 1, 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Color(0xFF34AF8D),
                            fontFamily: 'Nunito',
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                        validator: (value) {
                          if (value != 'abdallah aeham') {
                            return 'Card Holder Name is Invalid!';
                          }
                          return null;
                        },
                        inputFormatters: [LengthLimitingTextInputFormatter(24)],
                        onChanged: (value) {
                          setState(() {
                            handleCardHolder = value;
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFDC5D5B),
                          ),
                          border: InputBorder.none,
                          hintText: 'Card Holder',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF34AF8D),
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (BuildContext context) {
                              Fluttertoast.showToast(msg: 'Sign In Succefully !', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Color(0xFF34AF8D), );
                              return const MyCardInfos();
                            }),
                          );
                        }
                      },
                      elevation: 1.5,
                      minWidth: double.infinity,
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xFF34AF8D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}