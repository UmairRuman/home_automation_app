mixin AuthBehaviour {
  String handleAuthException(String errorCode) {
    String errorMessage = '';
    switch (errorCode) {
      case "user-not-found":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "wrong-password":
        errorMessage = "Your password is wrong.";
        break;
      case "ERROR_USER_NOT_FOUND":
        errorMessage = "User with this email doesn't exist.";
        break;
      case 'weak-password':
        errorMessage = 'Please choose a astrong password.';
        break;
      case 'invalid-email':
        errorMessage = 'Invalid email address.';
        break;
      case 'invalid-credential':
        errorMessage = 'Email or password incorrect!';
        break;
      default:
        errorMessage = errorCode;
    }
    return errorMessage;
  }
}
