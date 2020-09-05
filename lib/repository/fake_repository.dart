import 'package:retrospektif/model/fake_data_model.dart';

class FakeRepository{

  List<FakeDataModel> generateData(){
    List<FakeDataModel> list = List();
    FakeDataModel fakeData = FakeDataModel("ABC123","1", "mad","Bu işler böyle yürümüyor.Bu işler böyle yürümüyor.Bu işler böyle yürümüyor.",0);
    list.add(fakeData);

    FakeDataModel fakeData2 = FakeDataModel("ABC123","1", "mad","İnsanlar çok konuşuyor",0);
    list.add(fakeData2);

    FakeDataModel fakeData3 = FakeDataModel("ABC123","1", "sad","Ekip çok yoruluyor üzülüyoruz.",0);
    list.add(fakeData3);

    FakeDataModel fakeData4 = FakeDataModel("ABC123","1", "glad","Ekip ruhu tavan yaptı.",0);
    list.add(fakeData4);

    FakeDataModel fakeData5 = FakeDataModel("ABC123","1", "mad","Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.",0);
    list.add(fakeData5);

    FakeDataModel fakeData6 = FakeDataModel("ABC123","1", "sad","Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.Ekip ruhu tavan yaptı.",0);
    list.add(fakeData6);

    FakeDataModel fakeData7 = FakeDataModel("ABC123","1", "glad","Ekip ruhu tavan yaptı.",0);
    list.add(fakeData7);

    FakeDataModel fakeData8 = FakeDataModel("ABC123","1", "glad","Ekip ruhu tavan yaptı.",0);
    list.add(fakeData8);

    FakeDataModel fakeData9 = FakeDataModel("ABC123","1", "glad","Ekip ruhu tavan yaptı.",0);
    list.add(fakeData9);

    FakeDataModel fakeData10 = FakeDataModel("ABC123","1", "glad","Ekip ruhu tavan yaptı.",0);
    list.add(fakeData10);
    return list;
  }
}