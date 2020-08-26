import 'package:retrospektif/model/fake_data_model.dart';

class FakeRepository{

  List<FakeDataModel> generateData(){
    List<FakeDataModel> list = List();
    FakeDataModel fakeData = FakeDataModel("ABC123","1", "mad","Bu işler böyle yürümüyor.",0);
    list.add(fakeData);

    FakeDataModel fakeData2 = FakeDataModel("ABC123","1", "mad","İnsanlar çok konuşuyor",0);
    list.add(fakeData2);

    FakeDataModel fakeData3 = FakeDataModel("ABC123","1", "sad","Ekip çok yoruluyor üzülüyoruz.",0);
    list.add(fakeData3);

    FakeDataModel fakeData4 = FakeDataModel("ABC123","1", "glad","Ekip ruhu tavan yaptı.",0);
    list.add(fakeData4);
    return list;
  }
}