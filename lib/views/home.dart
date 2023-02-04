import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../consts/colors/Colors.dart';
import '../consts/fonts/Fonts.dart';
import '../consts/images/ImagePath.dart';
import '../consts/strings/str_const.dart';
import '../consts/urls/URLConst.dart';
import '../generated/l10n.dart';
import '../models/auth.dart';
import '../models/error.dart';
import '../models/user_model.dart';
import '../observable/observable_serivce.dart';
import '../utils/pref_util.dart';
import '../viewmodels/authentication_viewmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginStateView();
  }
}

class _LoginStateView extends State<HomeView> {
  ObservableService _observableService = ObservableService();
  late final AuthenticationViewModel _authenticationViewModel;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription<UserModel?>? apiResponseListener = null;

  @override
  void initState() {
    _authenticationViewModel = Provider.of<AuthenticationViewModel>(context, listen: false);
    listenToAPIResponse();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void listenToAPIResponse() {
    apiResponseListener ??= _observableService.apiTestStream.asBroadcastStream().listen((data) {
      if (data == null) {
        Fluttertoast.showToast(
            msg: S.current.error_no_data,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      } else {
        Fluttertoast.showToast(
            msg: fromUserModelToString(data),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    });
  }

  String fromUserModelToString(UserModel input) {
    return "Name: ${input.name} - Username: ${input.username} - Email: ${input.email}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorStyle.getSystemBackground(),
      body: InkWell(
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          color: ColorStyle.getSystemBackground(),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: ColorStyle.getSystemBackground(),
                margin: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      ImagePath.logoApp,
                      width: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Text(
                        S.current.base,
                        style: const TextStyle(
                            color: ColorStyle.primary,
                            fontFamily: FontStyles.sfProText,
                            fontWeight: FontWeight.bold,
                            fontSize: 34),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height < 1000.0
                          ? MediaQuery.of(context).size.height * 0.075
                          : MediaQuery.of(context).size.height * 0.1,
                    ),
                    InkWell(
                      onTap: () {
                        _testAPI();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 56,
                        margin: const EdgeInsets.fromLTRB(0, 32, 0, 20),
                        decoration: const BoxDecoration(
                          color: ColorStyle.primary,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          S.current.test_api,
                          style: TextStyle(
                              color: ColorStyle.getLightLabel(),
                              backgroundColor: ColorStyle.primary,
                              fontFamily: FontStyles.sfProText,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showLoading() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
              decoration: const BoxDecoration(),
              child: const Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: ColorStyle.primary,
                ),
              ));
        });
  }

  void _showAlertError(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  void _testAPI() {
    _showLoading();
    _authenticationViewModel.testAPI().then((value) {
      Navigator.of(context).pop();
    }).catchError((error, stackTrace) {
      Navigator.of(context).pop();
      CustomError err = error as CustomError;
      var message = err.message != null ? err.message! : S.current.error;
      _showAlertError(message);
    });
  }
}
