//this file contains different validations for editable text feilds
//example - phone number,email,etc
class Validators
{
  static String phoneNumberValidate(String val, bool required) {
    Pattern pattern = r'^[6-9]\d{9}$';
    RegExp regex = RegExp(pattern);
    if (required && val.isEmpty || val == null) {
      return "invalid phone";
    } else if (val.length != 10) {
      return "invalid phone";
    } else if (!regex.hasMatch(val)) {
      return "invalid phone";
    }
    return null;
  }

  static String emailValidate(String val, bool required) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (required && val.isEmpty || val == null) {
      return 'Required';
    } else if (!regex.hasMatch(val)) {
      return "Invalid Email";
    }
    return null;
  }

  static String nullTextValidate(String val) {
    {
      if (val.isEmpty || val == null) {
        return 'Required';
      }
      return null;
    }
  }

}
