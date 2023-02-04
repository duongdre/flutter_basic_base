import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../models/error.dart';
import '../models/user_model.dart';

class ObservableService {
  static final ObservableService _observableService = ObservableService._internal();

  ObservableService._internal();

  factory ObservableService() {
    return _observableService;
  }

  ///Declare observer object and stream
  final StreamController<UserModel?> apiTestController = BehaviorSubject<UserModel?>();
  Stream<UserModel?> get apiTestStream => apiTestController.stream;

  final StreamController<bool> signInController = BehaviorSubject<bool>();
  Stream<bool> get signInStream => signInController.stream;

  final StreamController<bool> signOpController = BehaviorSubject<bool>();
  Stream<bool> get signOpStream => signOpController.stream;

  final StreamController<bool> signOutController = BehaviorSubject<bool>();
  Stream<bool> get signOutStream => signOutController.stream;
}
