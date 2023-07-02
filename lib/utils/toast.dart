import 'package:employee_ri/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String msg}) => Fluttertoast.showToast(
    msg: msg,
    backgroundColor: kIconColor,
    gravity: ToastGravity.CENTER,
    textColor: Colors.white);
