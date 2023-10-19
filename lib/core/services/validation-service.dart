
abstract class IValidationService {
  String? isValidInput(String? data, {int? minLength, int? length, String? errorMessage });
  String? isValidNumber(String? data, {int? minLength, int? length});
  String? isValidAmount(String? data, {int? minLength});
  String? isValidString(String? data, {int? minLength});
  String? isValidEmail(String? data, {int? minLength});
  String? isValidPassword(String? data, {int? minLength});
  String? isValidPhoneNumber(String? data, {int? minLength, int? length});


}

class ValidationService extends IValidationService {

  @override
  String? isValidInput(String? data, {
    int? minLength = 1,
    int? length,
    String? errorMessage,
    String? confirmPassword
  }){
    data = data?.trim() ?? '';
    if(data.isEmpty) return errorMessage ?? 'Input is empty';
    if(length != null){
      if(data.length != length) return errorMessage?? 'Invalid input';
    }
    if(data.length < (minLength == 5? 1:minLength?? 1)) return 'Input is lesser than $minLength characters.';

    if(confirmPassword != null){
      if(data != confirmPassword) return "Password doesn't match";
    }
    return null;
  }

  @override
  String? isValidNumber(String? data, {int? minLength, int? length}){
    data = data?.trim() ?? '';
    String? result = isValidInput(data, minLength: minLength, length: length);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9]+$');
    if(charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid number';
  }

  @override
  String? isValidAmount(String? data, {int? minLength}){
    data = data?.trim() ?? '';
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^-?[0-9₦,.]+$');
    if(charRegExp.hasMatch(data)) return null;
    return 'Input is not a valid amount';
  }

  @override
  String? isValidString(String? data, {int? minLength}){
    data = data?.trim() ?? '';
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp('[0-9]');
    if(charRegExp.hasMatch(data)) return 'Input is not valid';
    return null;
  }

  @override
  String? isValidEmail(String? data, {int? minLength}){
    data = data?.trim() ?? '';
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(!charRegExp.hasMatch(data)) return 'Input is not a valid email';
    return null;
  }

  @override
  String? isValidPassword(String? data, {int? minLength, String? confirmPassword}){
    data = data?.trim() ?? '';
    String? result = isValidInput(data, minLength: 8, confirmPassword: confirmPassword);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@.#\$&*~]).{8,}$');
    if(!charRegExp.hasMatch(data)) return 'Password should contain at least : \nOne upper case\nOne lower case\nOne digit and one special character.';

    return null;
  }

  @override
  String? isValidPhoneNumber(String? data, {int? minLength, int? length}){
    data = data?.trim() ?? '';
    String? result = isValidInput(data, minLength: 10, length: length);
    if(result != null) return 'Enter a valid phone number';

    final RegExp charRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if(!charRegExp.hasMatch(data)) return 'Input is not a valid mobile number';
    return null;
  }

}