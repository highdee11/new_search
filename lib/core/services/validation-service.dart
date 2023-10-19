
abstract class IValidationService {
  String? isValidInput(String? data, {int? minLength, int? length, String? errorMessage });
  String? isValidString(String? data, {int? minLength});
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
  String? isValidString(String? data, {int? minLength}){
    data = data?.trim() ?? '';
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp('[0-9]');
    if(charRegExp.hasMatch(data)) return 'Input is not valid';
    return null;
  }

}