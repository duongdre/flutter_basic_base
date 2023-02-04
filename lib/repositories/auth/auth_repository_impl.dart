import 'dart:async';

import '../../models/auth.dart';
import '../../models/user_model.dart';
import '../../observable/observable_serivce.dart';
import '../../services/api/api_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final ObservableService _observableService = ObservableService();

  @override
  Future<void> testAPI() async {
    ///This is a fake API for response
    List<UserModel>? listUser = await ApiService().getUsers();

    if (listUser != null || listUser!.isNotEmpty) {
      _observableService.apiTestController.sink.add(listUser.first);
    } else {
      _observableService.apiTestController.sink.add(null);
    }
  }

  @override
  Future<void> signUp() async {
    ///Logic for signIn
  }

  @override
  Future<void> signIn() async {
    ///Logic for signIn
  }

  @override
  Future<void> signOut() async {
    ///Logic for signOut
  }
}