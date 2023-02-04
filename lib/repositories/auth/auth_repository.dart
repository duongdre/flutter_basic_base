abstract class AuthRepository {
  Future<void> testAPI();

  Future<void> signUp();

  Future<void> signIn();

  Future<void> signOut();
}