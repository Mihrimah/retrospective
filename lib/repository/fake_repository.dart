import 'package:retrospektif/model/fake_data_model.dart';

class FakeRepository{

  List<FakeDataModel> generateData(){
    List<FakeDataModel> list = List();
    FakeDataModel fakeData = FakeDataModel();
    fakeData.code = "ABC123";
    fakeData.templateType ="1";
    fakeData.title = "mad";
    fakeData.text = "Bu işler böyle yürümüyor.";
    fakeData.likeCount = 0;
    list.add(fakeData);

    FakeDataModel fakeData2 = FakeDataModel();
    fakeData2.code = "ABC123";
    fakeData2.templateType ="1";
    fakeData2.title = "mad";
    fakeData2.text = "İnsanlar çok konuşuyor";
    fakeData2.likeCount = 0;
    list.add(fakeData2);

    FakeDataModel fakeData3 = FakeDataModel();
    fakeData3.code = "ABC123";
    fakeData3.templateType ="1";
    fakeData3.title = "sad";
    fakeData3.text = "Ekip çok yoruluyor üzülüyoruz.";
    fakeData3.likeCount = 0;
    list.add(fakeData3);

    FakeDataModel fakeData4 = FakeDataModel();
    fakeData4.code = "ABC123";
    fakeData4.templateType ="1";
    fakeData4.title = "glad";
    fakeData4.text = "Ekip ruhu tavan yaptı.";
    fakeData4.likeCount = 0;
    list.add(fakeData4);
    return list;
  }
}