import 'package:flutter/material.dart';

class RetrospectiveLocalization{
  RetrospectiveLocalization(this.locale);

  final Locale locale;

  static RetrospectiveLocalization of(BuildContext context) {
    return Localizations.of<RetrospectiveLocalization>(context, RetrospectiveLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'roomCode' : 'Room Code',
      'createRoom' : 'Create Room',
      'joinRoom' : 'Join Room',
      'theme' : 'Theme',
      'addContent' : 'Add Content',
      'add' : 'Add',
      'mad' : 'MAD',
      'sad' : 'SAD',
      'glad' : 'GLAD',
      'copy' : 'copied',
      'chooseTemplate' : 'Choose Template'
    },
    'tr': {
      'title': 'Başlık',
      'roomCode' : 'Oda Kod',
      'createRoom' : 'Oda Oluştur',
      'joinRoom' : 'Odaya Gir',
      'theme' : 'Tema',
      'addContent' : 'İçerik Gir',
      'add' : 'Ekle',
      'mad' : 'Kızgın',
      'sad' : 'Üzgün',
      'glad' : 'Şükran',
      'copy' : 'Kopyalandı',
      'chooseTemplate' : 'Şablon Seç'
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
  String get roomCode {
    return _localizedValues[locale.languageCode]['roomCode'];
  }
  String get createRoom {
    return _localizedValues[locale.languageCode]['createRoom'];
  }
  String get joinRoom {
    return _localizedValues[locale.languageCode]['joinRoom'];
  }
  String get theme {
    return _localizedValues[locale.languageCode]['theme'];
  }
  String get addContent {
    return _localizedValues[locale.languageCode]['addContent'];
  }
  String get add {
    return _localizedValues[locale.languageCode]['add'];
  }
  String get mad {
    return _localizedValues[locale.languageCode]['mad'];
  }
  String get sad {
    return _localizedValues[locale.languageCode]['sad'];
  }
  String get glad {
    return _localizedValues[locale.languageCode]['glad'];
  }
  String get copy {
    return _localizedValues[locale.languageCode]['copy'];
  }
  String get chooseTemplate {
    return _localizedValues[locale.languageCode]['chooseTemplate'];
  }
}