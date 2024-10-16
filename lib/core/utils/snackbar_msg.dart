import 'package:design_pattern/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SnackBarMsg{

  void showSuccessMsg(String msg, BuildContext context){
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
          child: Text(msg,style: const TextStyle(color: Colors.white),)),
        backgroundColor: AppColor.successColor,)
    );
  }

  void showErrorMsg(String msg, BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Text(msg,style: const TextStyle(color: Colors.white),)),backgroundColor: AppColor.errorColor,)
    );
  }
}