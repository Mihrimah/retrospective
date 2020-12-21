import 'package:flutter/material.dart';

class RetrospectiveLocalization{
  RetrospectiveLocalization(this.locale);

  final Locale locale;

  static RetrospectiveLocalization of(BuildContext context) {
    return Localizations.of<RetrospectiveLocalization>(context, RetrospectiveLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'es': {
      'title': 'título',
      'roomCode' : 'código de habitación',
      'createRoom' : 'crear código',
      'joinRoom' : 'unirse a la habitación',
      'theme' : 'Tema',
      'addContent' : 'agregar contenido',
      'add' : 'añadir',
      'copy' : 'copiada',
      'chooseTemplate' : 'elegir la plantilla',
      'historyList':'lista de historia',
      'maxSavedDataMessage' : 'Se superó el número máximo de límite de datos guardados',
      'save': 'salvado',
      'gotIt': 'Entendido!',
      'send' : 'senden',
      'sendMail' : 'enviar correo',
      'emailAddress' : 'introduzca la dirección de correo electrónico',
      'successEmailRequest' : 'El correo ha sido enviado',
      'failEmailRequest' : 'No se ha enviado el correo, Error:',
      'nocontent' : 'sin contenido todavía',
      'starfishInfo' : 'Una retrospectiva de estrellas de mar se llama así por sus cinco puntos, donde los equipos pueden articular qué comenzar a hacer, dejar de hacer, seguir haciendo, hacer más y hacer menos.',
      'sailorboatInfo' : 'Una retrospectiva de un velero puede iluminar todas las cosas que están ayudando y obstaculizando a su equipo de scrum.',
      'wrapInfo' : 'Deseos, riesgos, apreciaciones, acertijos: esta técnica retrospectiva puede descubrir preocupaciones ocultas y ayuda a los equipos a examinar un sprint desde múltiples perspectivas. \n\n Deseo: ¿Qué desearías que sucediera? \n Riesgo: ¿Cuáles son los riesgos? \n Apreciación: ¿Qué podemos apreciar? \n Rompecabezas: ¿Qué es un rompecabezas actual para el equipo?',
      'fourlsInfo' : '4Ls es una técnica popular y de uso frecuente que es fácil de configurar para el facilitador y fácil de entender para los participantes. \n\n Me gustó: ¿Qué disfrutó realmente el equipo de la iteración? En particular, ¿qué salió mejor de lo esperado? Enfatice lo positivo. \n Aprendió: ¿Qué cosas nuevas aprendió el equipo durante la iteración? \n Falta: ¿Qué cosas podría haber hecho mejor el equipo durante la iteración? \n eguido: ¿Qué cosas deseaba tener el equipo durante la iteración? ¿no disponible?',
      'leancoffeeInfo' : 'Una retrospectiva de Lean Coffee puede ayudar a su equipo a reunirse y crear una agenda para la reunión de su equipo. Hacer, hacer, hacer.',
      'madsadgladInfo' : 'Esta plantilla retrospectiva es una excelente manera de verificar el pulso emocional de su equipo ágil.',
      'whatwentwellInfo' : '¿Qué salió bien? ¿Qué no salió bien? es una técnica retrospectiva básica que se enfoca en las fortalezas y debilidades de su equipo.',
      'startstopcontinueInfo' : 'Si desea comentarios orientados a la acción, este es un gran formato para su equipo ágil.',
      'freeformatInfo' : 'Los miembros del equipo pueden dar comentarios de sentimientos emocionales completos en formato libre.'
    },
    'de': {
      'title': 'Titel',
      'roomCode' : 'Zimmercode',
      'createRoom' : 'Platz schaffen',
      'joinRoom' : 'Raum betreten',
      'theme' : 'Thema',
      'addContent' : 'Inhalt Hinzufügen',
      'add' : 'Hinzufügen',
      'copy' : 'kopiert',
      'chooseTemplate' : 'Vorlage wählen',
      'historyList':'Verlaufsliste',
      'maxSavedDataMessage' : 'Maximale Anzahl gespeicherter Daten überschritten',
      'save': 'Gerettet',
      'gotIt': 'Ich habs!',
      'send' : 'senden',
      'sendMail' : 'Mail senden',
      'emailAddress' : 'E-Mail Adresse eingeben',
      'successEmailRequest' : 'Mail wurde gesendet',
      'failEmailRequest' : 'Mail wurde nicht gesendet, Fehler:',
      'nocontent' : 'Noch kein Inhalt',
      'starfishInfo' : 'Eine Seestern-Retrospektive ist nach ihren fünf Punkten benannt, in denen Teams artikulieren können, was zu tun ist, aufzuhören, weiter zu tun, mehr zu tun und weniger zu tun.',
      'sailorboatInfo' : 'Eine Segelboot-Retrospektive kann alle Dinge beleuchten, die Ihrem Scrum-Team helfen und es behindern.',
      'wrapInfo' : 'Wünsche, Risiken, Wertschätzungen, Rätsel - Diese retrospektive Technik kann versteckte Bedenken aufdecken und Teams dabei helfen, einen Sprint aus verschiedenen Perspektiven zu untersuchen wir schätzen? \n Puzzle: Was ist ein aktuelles Puzzle für das Team?',
      'fourlsInfo' : '4Ls ist eine beliebte, häufig verwendete Technik, die für den Moderator einfach einzurichten und für die Teilnehmer leicht zu verstehen ist. \n\n Gefallen: Was hat das Team an der Iteration wirklich genossen? Was lief insbesondere besser als erwartet? Betonen Sie das Positive. \n Gelernt: Welche neuen Dinge hat das Team während der Iteration gelernt? \n Lacked: Welche Dinge hätte das Team während der Iteration besser machen können? \n Longed For: Welche Dinge wollte das Team während der Iteration haben? Nicht verfügbar?',
      'leancoffeeInfo' : 'Eine Lean Coffee-Retrospektive kann Ihrem Team dabei helfen, eine Agenda für das Meeting Ihres Teams zusammenzustellen und zu erstellen. Zu tun, zu tun, zu tun.',
      'madsadgladInfo' : 'Diese retrospektive Vorlage ist eine großartige Möglichkeit, den emotionalen Puls Ihres agilen Teams zu überprüfen',
      'whatwentwellInfo' : 'Was ging gut? Was ist nicht gut gelaufen? ist eine grundlegende retrospektive Technik, die sich auf die Stärken und Schwächen Ihres Teams konzentriert.',
      'startstopcontinueInfo' : 'Wenn Sie handlungsorientiertes Feedback wünschen, ist dies ein großartiges Format für Ihr agiles Team.',
      'freeformatInfo' : 'Mitglieder des Teams können ganze emotionale Gefühle in freiem Format kommentieren.'
    },
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
      'send' : 'Send',
      'sendMail' : 'Send Mail',
      'emailAddress' : 'Enter Email Address',
      'successEmailRequest' : 'Mail has been sent',
      'failEmailRequest' : 'Mail has not been sent, Error :',
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
      'send' : 'Gönder',
      'sendMail' : 'Mail Gönder',
      'emailAddress' : 'Email Adresi gir',
      'successEmailRequest' : 'Mail gönderildi',
      'failEmailRequest' : 'Mail gönderilemedi, Hata :',
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
  String get send {
    return _localizedValues[locale.languageCode]['send'];
  }
  String get sendMail {
    return _localizedValues[locale.languageCode]['sendMail'];
  }
  String get emailAddress {
    return _localizedValues[locale.languageCode]['emailAddress'];
  }
  String get successEmailRequest {
    return _localizedValues[locale.languageCode]['successEmailRequest'];
  }
  String get failEmailRequest {
    return _localizedValues[locale.languageCode]['failEmailRequest'];
  }
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