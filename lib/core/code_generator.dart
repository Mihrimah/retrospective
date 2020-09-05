import 'dart:math';
const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class CodeGenerator{
  Random _rnd = Random();

  String _generateRoomCodeWithoutTemplateId(int len){
        return String.fromCharCodes(Iterable.generate(
            len, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
  /*
  * Length: 15 character plus template type id in front of the code.
  * 1FgDghjiTfkbD23T -> first char is 1 means template_type_id
  */
  String generateRoomCode(int templateId){
    return templateId.toString() + _generateRoomCodeWithoutTemplateId(15);
  }
}