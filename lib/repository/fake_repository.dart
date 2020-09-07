import 'package:retrospektif/model/fake_data_model.dart';
import 'package:retrospektif/repository/base_repository.dart';
import 'package:retrospektif/template/abstract_base_template.dart';

class FakeRepository implements BaseRepository {
  final List<FakeDataModel> madsadglad_data = List();
  final List<FakeDataModel> starfish_data = List();

  FakeRepository() {
    FakeDataModel fakeData = FakeDataModel(
        "1ABC123",
        1,
        "mad",
        "Bu işler böyle yürümüyor.Bu işler böyle yürümüyor.Bu işler böyle yürümüyor.",
        0);
    madsadglad_data.add(fakeData);

    FakeDataModel fakeData2 =
        FakeDataModel("1ABC123", 1, "mad", "İnsanlar çok konuşuyor", 0);
    madsadglad_data.add(fakeData2);

    FakeDataModel fakeData3 =
        FakeDataModel("1ABC123", 1, "sad", "Ekip çok yoruluyor üzülüyoruz.", 0);
    madsadglad_data.add(fakeData3);

    FakeDataModel fakeData4 =
        FakeDataModel("1ABC123", 1, "glad", "Ekip ruhu tavan yaptı.", 0);
    madsadglad_data.add(fakeData4);

    FakeDataModel fakeData5 = FakeDataModel(
        "1ABC123",
        1,
        "mad",
        "Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.",
        0);
    madsadglad_data.add(fakeData5);

    FakeDataModel fakeData6 = FakeDataModel(
        "1ABC123",
        1,
        "sad",
        "Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.",
        0);
    madsadglad_data.add(fakeData6);
/*
    FakeDataModel fakeData7 =
        FakeDataModel("1ABC123", 1, "glad", "Ekip ruhu tavan yaptı.", 0);
    madsadglad_data.add(fakeData7);

    FakeDataModel fakeData8 =
        FakeDataModel("1ABC123", 1, "glad", "Ekip ruhu tavan yaptı.", 0);
    madsadglad_data.add(fakeData8);

    FakeDataModel fakeData9 =
        FakeDataModel("1ABC123", 1, "glad", "Ekip ruhu tavan yaptı.", 0);
    madsadglad_data.add(fakeData9);

    FakeDataModel fakeData10 =
        FakeDataModel("1ABC123", 1, "glad", "Ekip ruhu tavan yaptı.", 0);
    madsadglad_data.add(fakeData10);*/

    FakeDataModel fakeData11 = FakeDataModel(
        "2ABC1234",
        2,
        "less",
        "Bu işler böyle yürümüyor.Bu işler böyle yürümüyor.Bu işler böyle yürümüyor.",
        0);
    starfish_data.add(fakeData11);

    FakeDataModel fakeData12 =
        FakeDataModel("2ABC1234", 2, "more", "İnsanlar çok konuşuyor", 0);
    starfish_data.add(fakeData12);
  }

  @override
  Stream<List<FakeDataModel>> getRoomData(String roomCode, int templateId) {
    Iterable<FakeDataModel> newState;
    if (templateId == 1) {
      newState =  madsadglad_data.where((element) => element.roomCode == roomCode);
      return Stream.value(List<FakeDataModel>.from(newState));
    }
    else if (templateId == 2){
      newState =  starfish_data.where((element) => element.roomCode == roomCode);
      return Stream.value(List<FakeDataModel>.from(newState));
    }
    else
      return null;
  }

  //Denemek için..
  addContent(String text, String title , String code, AbstractBaseTemplate template){
    if (template.getTemplateTypeId() == 1) {
      madsadglad_data.add(new FakeDataModel(code, template.type, title, text, 0));
    }
    else if (template.getTemplateTypeId() == 2){
      starfish_data.add(new FakeDataModel(code, template.type, title, text, 0));
    }
    else
      null;
  }
}
