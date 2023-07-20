import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo/core/utils/enums.dart';

showToast({required String msg, required RequestState requestState}) {
  if (requestState == RequestState.success) {
    return _defaultSuccessToast(msg: msg);
  } else if (requestState == RequestState.error) {
    return _defaultErrorToast(msg: msg);
  }
  return _defaultWarningToast(msg: msg);
}

_defaultSuccessToast({required msg}) => Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.lightGreen,
    textColor: Colors.white,
    fontSize: 16.0,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP);

_defaultErrorToast({required msg}) => Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.redAccent,
    textColor: Colors.white,
    fontSize: 16.0,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP);

_defaultWarningToast({required msg}) => Fluttertoast.showToast(
    msg: msg,
    backgroundColor: Colors.yellowAccent,
    textColor: Colors.white,
    fontSize: 16.0,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP);
