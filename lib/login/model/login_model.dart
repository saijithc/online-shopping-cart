class LoginUser {
  String email = '';
  String passWord = '';
  LoginUser({required this.email, required this.passWord});
  Map<String, String> toJson() {
    return {"username": email, "password": passWord};
  }
}
