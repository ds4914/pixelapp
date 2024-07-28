
extension PanCardValidator on String {
  bool isValidPanCardNo() {
    return RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(this);
  }
}

extension MobileNumberValidator on String {
  bool isValidMobileNumber() {
    if (length == 10) {
      return true;
    }
    return false;
  }
}
extension EmailValidator on String {
  bool isEmailValid () {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension PostalCodeValidator on String{
  bool isValidPostalCode(){
    return RegExp(r"^[a-z0-9][a-z0-9\- ]{0,10}[a-z0-9]$", caseSensitive: false).hasMatch(this);
  }
}
