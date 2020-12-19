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
      'copy' : 'copied',
      'chooseTemplate' : 'Choose Template',
      'historyList':'History',
      'maxSavedDataMessage' : 'Maximum number of saved data limit exceeded',
      'save': 'Saved',
      'gotIt': 'Got It!',
      'nocontent' : 'No content yet',
      'starfishInfo' : 'A starfish retrospective is named for its five points, where teams can articulate what to start doing, stop doing, keep doing, do more of, and do less of.',
      'sailorboatInfo' : 'A sailboat retrospective can illuminate all the things that are helping and hindering your scrum team.',
      'wrapInfo' : 'Wishes, Risks, Appreciations, Puzzles - This retrospective technique can uncover hidden concerns and helps teams examine a sprint from multiple perspectives.\n\nWish: What do you wish could happen?\nRisk: What are the risks?\nAppreciation: What can we appreciate?\nPuzzle: What is a current puzzle for the team?',
      'fourlsInfo' : '4Ls is a popular, frequently used technique that is simple to set up for the facilitator and easy to understand for the participants.\n\nLiked: What did the team really enjoy about the iteration? In particular, what went better than expected? Emphasize the positive.\nLearned: What new things did the team learn during the iteration?\nLacked: What things could the team have done better during the iteration?\nLonged For: What things did the team desire to have during the iteration that were not available?',
      'leancoffeeInfo' : 'A Lean Coffee retrospective can help your team gather and build an agenda for your team’s meeting. To do, doing, done.',
      'madsadgladInfo' : 'This retrospective template is a great way to check the emotional pulse of your agile team',
      'whatwentwellInfo' : 'What Went Well? What Didn\'t Go Well? is a basic retrospective technique that focuses on your team\'s strengths and weaknesses.',
      'startstopcontinueInfo' : 'If you want action-oriented feedback, then this is a great format for your agile team.',
      'freeformatInfo' : 'Members of team can give comments whole emotional feelings in free format.'
    },
    'tr': {
      'title': 'Başlık',
      'roomCode' : 'Oda Kod',
      'createRoom' : 'Oda Oluştur',
      'joinRoom' : 'Odaya Gir',
      'theme' : 'Tema',
      'addContent' : 'İçerik Gir',
      'add' : 'Ekle',
      'copy' : 'Kopyalandı',
      'chooseTemplate' : 'Şablon Seç',
      'historyList':'Geçmiş',
      'maxSavedDataMessage' : 'Maksimum kayıtlı olan oda limiti aşılamaz',
      'save': 'Kaydedildi',
      'gotIt': 'Anladım!',
      'nocontent' : 'Henüz veri yok',
      'starfishInfo' : '5 temel konuyu ele alan Starfish methodu ile yapmaya başlanacak, devam edilecek, daha az yapılacak, daha çok yapılacak ve yapılmayacak olan aksiyonlar girilir.',
      'sailorboatInfo' : 'Ekibe yardımcı olan ve ekibi engelleyen her şey burada paylaşılır.',
      'wrapinfo' : 'Wish: Ne olmasını isterdik?\nRisk: Risklerimiz nelerdi?\nAppreciation: Neye önem vermeliydik?\nPuzzle: Takım için çözmemiz gereken sorun nedir?',
      'fourlsInfo' : 'Liked: Bu sprintte takım nelerden keyif aldı?\nLearned: Bu sprint takıma neler öğretti?\nLacked: Bu sprintte eksik olan ya da daha iyi olabilecek neler vardı?\nLonged For: Bu sprintte ne olsa daha iyi olurdu?',
      'leancoffeeInfo' : 'Yapılanlar, yapılacaklar, yapılmakta olanlar şeklinde 3 alanda yorum girebildiğimiz Lean Coffee methodu takımın hedeflerinde geldiği mevcut durumu gösterir.',
      'madsadgladInfo' : 'Takım üyelerinin duygusal olarak sprintten kızgın, üzgün, memnun oldukları konuları paylaşmalarını sağlar.',
      'whatwentwellInfo' : 'Takım içinde neyin iyi yapıldığını nelerin iyi yapılmadığını belirlemek için kullanılır.',
      'startstopcontinueInfo' : 'Aksiyon almak için uygulanan template tipidir, başlama, bitirme ve devam etme aksiyonlarını almayı sağlar.',
      'freeformatInfo' : 'Takım üyeleri bu template formatında diledikleri yorumları girebilir.'
},
  };

  String get save {
    return _localizedValues[locale.languageCode]['save'];
  }
  String get nocontent {
    return _localizedValues[locale.languageCode]['nocontent'];
  }
  String get maxSavedDataMessage {
    return _localizedValues[locale.languageCode]['maxSavedDataMessage'];
  }
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
  String get historyList {
    return _localizedValues[locale.languageCode]['historyList'];
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
  String get copy {
    return _localizedValues[locale.languageCode]['copy'];
  }
  String get gotIt {
    return _localizedValues[locale.languageCode]['gotIt'];
  }
  String get chooseTemplate {
    return _localizedValues[locale.languageCode]['chooseTemplate'];
  }
  String get starfishInfo {
    return _localizedValues[locale.languageCode]['starfishInfo'];
  }
  String get sailorboatInfo {
    return _localizedValues[locale.languageCode]['sailorboatInfo'];
  }
  String get wrapInfo {
    return _localizedValues[locale.languageCode]['wrapInfo'];
  }
  String get fourlsInfo {
    return _localizedValues[locale.languageCode]['fourlsInfo'];
  }
  String get leancoffeeInfo {
    return _localizedValues[locale.languageCode]['leancoffeeInfo'];
  }
  String get madsadgladInfo {
    return _localizedValues[locale.languageCode]['madsadgladInfo'];
  }
  String get whatwentwellInfo {
    return _localizedValues[locale.languageCode]['whatwentwellInfo'];
  }
  String get startstopcontinueInfo {
    return _localizedValues[locale.languageCode]['startstopcontinueInfo'];
  }
  String get freeformatInfo {
    return _localizedValues[locale.languageCode]['freeformatInfo'];
  }
}