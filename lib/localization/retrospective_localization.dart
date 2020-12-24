import 'package:flutter/material.dart';

class RetrospectiveLocalization{
  RetrospectiveLocalization(this.locale);

  final Locale locale;

  static RetrospectiveLocalization of(BuildContext context) {
    return Localizations.of<RetrospectiveLocalization>(context, RetrospectiveLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'es': {
      'title': 'Título',
      'roomCode' : 'Código de habitación',
      'createRoom' : 'Crear código',
      'retrospectiveExp' : 'Retrospectivas especiales que promueven la mejora continua',
      'joinRoom' : 'Unirse a la habitación',
      'theme' : 'Tema',
      'addContent' : 'Agregar contenido',
      'add' : 'Añadir',
      'copy' : 'Copiada',
      'chooseTemplate' : 'Elegir la plantilla',
      'historyList': 'Lista de historia',
      'maxSavedDataMessage' : 'Se superó el número máximo de límite de datos guardados',
      'save': 'Salvado',
      'gotIt': 'Entendido!',
      'send' : 'Senden',
      'sendMail' : 'Enviar correo',
      'emailAddress' : 'Introduzca la dirección de correo electrónico',
      'successEmailRequest' : 'El correo ha sido enviado',
      'failEmailRequest' : 'No se ha enviado el correo, Error:',
      'nocontent' : 'Sin contenido todavía',
      'shareCode' : 'Compartir el código',
      'starfishInfo' : 'Una retrospectiva de estrellas de mar se llama así por sus cinco puntos, donde los equipos pueden articular qué comenzar a hacer, dejar de hacer, seguir haciendo, hacer más y hacer menos.',
      'sailorboatInfo' : 'Una retrospectiva de un velero puede iluminar todas las cosas que están ayudando y obstaculizando a su equipo de scrum.',
      'wrapInfo' : 'Deseos, riesgos, apreciaciones, acertijos: esta técnica retrospectiva puede descubrir preocupaciones ocultas y ayuda a los equipos a examinar un sprint desde múltiples perspectivas. \n\n Deseo: ¿Qué desearías que sucediera? \n Riesgo: ¿Cuáles son los riesgos? \n Apreciación: ¿Qué podemos apreciar? \n Rompecabezas: ¿Qué es un rompecabezas actual para el equipo?',
      'fourlsInfo' : '4Ls es una técnica popular y de uso frecuente que es fácil de configurar para el facilitador y fácil de entender para los participantes. \n\n Me gustó: ¿Qué disfrutó realmente el equipo de la iteración? En particular, ¿qué salió mejor de lo esperado? Enfatice lo positivo. \n Aprendió: ¿Qué cosas nuevas aprendió el equipo durante la iteración? \n Falta: ¿Qué cosas podría haber hecho mejor el equipo durante la iteración? \n eguido: ¿Qué cosas deseaba tener el equipo durante la iteración? ¿no disponible?',
      'leancoffeeInfo' : 'Una retrospectiva de Lean Coffee puede ayudar a su equipo a reunirse y crear una agenda para la reunión de su equipo. Hacer, hacer, hacer.',
      'madsadgladInfo' : 'Esta plantilla retrospectiva es una excelente manera de verificar el pulso emocional de su equipo ágil.',
      'whatwentwellInfo' : '¿Qué salió bien? ¿Qué no salió bien? es una técnica retrospectiva básica que se enfoca en las fortalezas y debilidades de su equipo.',
      'startstopcontinueInfo' : 'Si desea comentarios orientados a la acción, este es un gran formato para su equipo ágil.',
      'freeformatInfo' : 'Los miembros del equipo pueden dar comentarios de sentimientos emocionales completos en formato libre.',
      'noListFound' : 'No se puede enviar correo en blanco.'
    },
    'de': {
      'title': 'Titel',
      'roomCode' : 'Zimmercode',
      'createRoom' : 'Platz schaffen',
      'retrospectiveExp' : 'Engagierte retrospektiven, die kontinuierliche Verbesserung fördern',
      'joinRoom' : 'Raum betreten',
      'theme' : 'Thema',
      'addContent' : 'Inhalt Hinzufügen',
      'add' : 'Hinzufügen',
      'copy' : 'Kopiert',
      'chooseTemplate' : 'Vorlage wählen',
      'historyList':'Verlaufsliste',
      'maxSavedDataMessage' : 'Maximale Anzahl gespeicherter Daten überschritten',
      'save': 'Gerettet',
      'gotIt': 'Ich habs!',
      'send' : 'Senden',
      'sendMail' : 'Mail senden',
      'emailAddress' : 'E-Mail Adresse eingeben',
      'successEmailRequest' : 'Mail wurde gesendet',
      'failEmailRequest' : 'Mail wurde nicht gesendet, Fehler:',
      'nocontent' : 'Noch kein Inhalt',
      'shareCode' : 'Teilen code',
      'starfishInfo' : 'Eine Seestern-Retrospektive ist nach ihren fünf Punkten benannt, in denen Teams artikulieren können, was zu tun ist, aufzuhören, weiter zu tun, mehr zu tun und weniger zu tun.',
      'sailorboatInfo' : 'Eine Segelboot-Retrospektive kann alle Dinge beleuchten, die Ihrem Scrum-Team helfen und es behindern.',
      'wrapInfo' : 'Wünsche, Risiken, Wertschätzungen, Rätsel - Diese retrospektive Technik kann versteckte Bedenken aufdecken und Teams dabei helfen, einen Sprint aus verschiedenen Perspektiven zu untersuchen wir schätzen? \n Puzzle: Was ist ein aktuelles Puzzle für das Team?',
      'fourlsInfo' : '4Ls ist eine beliebte, häufig verwendete Technik, die für den Moderator einfach einzurichten und für die Teilnehmer leicht zu verstehen ist. \n\n Gefallen: Was hat das Team an der Iteration wirklich genossen? Was lief insbesondere besser als erwartet? Betonen Sie das Positive. \n Gelernt: Welche neuen Dinge hat das Team während der Iteration gelernt? \n Lacked: Welche Dinge hätte das Team während der Iteration besser machen können? \n Longed For: Welche Dinge wollte das Team während der Iteration haben? Nicht verfügbar?',
      'leancoffeeInfo' : 'Eine Lean Coffee-Retrospektive kann Ihrem Team dabei helfen, eine Agenda für das Meeting Ihres Teams zusammenzustellen und zu erstellen. Zu tun, zu tun, zu tun.',
      'madsadgladInfo' : 'Diese retrospektive Vorlage ist eine großartige Möglichkeit, den emotionalen Puls Ihres agilen Teams zu überprüfen.',
      'whatwentwellInfo' : 'Was ging gut? Was ist nicht gut gelaufen? ist eine grundlegende retrospektive Technik, die sich auf die Stärken und Schwächen Ihres Teams konzentriert.',
      'startstopcontinueInfo' : 'Wenn Sie handlungsorientiertes Feedback wünschen, ist dies ein großartiges Format für Ihr agiles Team.',
      'freeformatInfo' : 'Mitglieder des Teams können ganze emotionale Gefühle in freiem Format kommentieren.',
      'noListFound' : 'Leere Mail kann nicht gesendet werden.'
        },
    'it': {
      'title': 'Ciao Mondo',
      'roomCode': 'Codice stanza',
      'createRoom': 'Crea stanza',
      'retrospectiveExp': 'Retrospettive speciali che promuovono il miglioramento continuo',
      'joinRoom': 'ingresso stanza',
      'theme': 'Tema',
      'addContent': 'Aggiungi contenuto',
      'add': 'Aggiungere',
      'copy': 'Copiato',
      'chooseTemplate': 'Scegli Modello',
      'historyList': 'Storia',
      'maxSavedDataMessage': 'Numero massimo di limiti di dati salvati superato',
      'save': 'Salvato',
      'gotIt': 'Fatto!',
      'send': 'Spedire',
      'sendMail': 'Inviare una mail',
      'emailAddress': 'Inserisci il tuo indirizzo email',
      'successEmailRequest': 'La posta è stata inviata',
      'failEmailRequest': 'La posta non è stata inviata, Errore: ',
      'nocontent': 'Nessun contenuto ancora',
      'shareCode': 'Codice di condivisione',
      'starfishInfo': 'Una retrospettiva di stelle marine prende il nome dai suoi cinque punti, in cui i team possono articolare cosa iniziare a fare, smettere di fare, continuare a fare, fare di più e fare di meno.',
      'sailorboatInfo': 'Una retrospettiva sulla barca a vela può illuminare tutte le cose che aiutano e ostacolano il tuo team di mischia.',
      'wrapInfo': 'Desideri, rischi, apprezzamenti, enigmi: questa tecnica retrospettiva può svelare preoccupazioni nascoste e aiuta i team a esaminare uno sprint da più prospettive. \n\nVoglio: cosa vorresti che accadesse? \nRischio: quali sono i rischi? \nApprezzamento: cosa può lo apprezziamo? \nRompicapo: qual è il rompicapo attuale per la squadra?',
      'fourlsInfo': '4Ls è una tecnica popolare e usata di frequente, semplice da impostare per il facilitatore e di facile comprensione per i partecipanti. \n\n Mi è piaciuto: cosa è piaciuto veramente al team dell\'iterazione? In particolare, cosa è andato meglio del previsto? Enfatizza gli aspetti positivi. \nImparato: quali nuove cose ha imparato il team durante l\'iterazione? \nMancato: quali cose avrebbe potuto fare meglio il team durante l\'iterazione? \nA lungo: quali cose desiderava il team durante l\'iterazione che erano non disponibile?',
      'leancoffeeInfo': 'Una retrospettiva sul Lean Coffee può aiutare il tuo team a raccogliere e costruire un programma per la riunione del tuo team. Fare, essendo fatto, fatto.',
      'madsadgladInfo': 'Questo modello retrospettivo è un ottimo modo per controllare il polso emotivo del tuo team agile.',
      'whatwentwellInfo': 'Cosa è andato bene? Cosa non è andato bene? è una tecnica retrospettiva di base che si concentra sui punti di forza e di debolezza del tuo team.',
      'startstopcontinueInfo': 'Se desideri un feedback orientato all\'azione, questo è un ottimo formato per il tuo team agile.',
      'freeformatInfo': 'I membri del team possono fornire commenti sui sentimenti emotivi in formato libero.',
      'noListFound' : 'Non è possibile inviare posta vuota.'
    },
    'fr': {
      'title': 'Bonjour le monde',
      'roomCode' : 'Code de la Atelier',
      'createRoom' : 'Créer une Atelier',
      'retrospectiveExp' : 'Des rétrospectives engageantes qui alimentent l\'amélioration continue',
      'joinRoom' : 'Rejoindre la Atelier',
      'theme' : 'Thème',
      'addContent' : 'Ajouter du contenu',
      'add' : 'Ajouter',
      'copy' : 'Copié',
      'chooseTemplate' : 'Choisir le modèle',
      'historyList':'L\'histoire',
      'maxSavedDataMessage' : 'Dépassement de la limite du nombre maximum de données enregistrées',
      'save': 'Enregistrées',
      'gotIt': 'Je l\'ai!',
      'send' : 'Envoie',
      'sendMail' : 'Envoyer un mail',
      'emailAddress' : 'Entrer l\'adresse e-mail',
      'successEmailRequest' : 'Le courrier a été envoyé',
      'failEmailRequest' : 'Le courrier n\'a pas été envoyé, Erreur: ',
      'nocontent' : 'Pas encore de contenu',
      'shareCode' : 'Partager le code',
      'starfishInfo' : 'Ceux qui recherchent un moyen facile de se focaliser sur les actions et les comportements dans le sprint  pourraient se tourner vers notre ami,pointu et sous marin : l\'étoile de mer. Semblable aux 5 pointes d\'une étoile de mer, ce modèle récapitulatif  souple  est nommé  ainsi en référence a ses cinq points de discussion, où les équipes peuvent articuler ce qu\'il faut commencer à faire que ce soit : arrêter de faire, continuer à faire, faire plus ou faire moins avant le prochain sprint.',
      'sailorboatInfo' : 'Un bilan de type " voilier" peut mettre en lumière toutes les chose aidant et entravant LE PROJET DE votre équipe.',
      'wrapInfo' : 'Souhaits, risques, appréciations, énigmes - Cette technique  rétrospective peut mettre en lumière  des enjeux cachées et aide les équipes à examiner un sprint final sous plusieurs angles.\n\nSouhait: que souhaiteriez-vous qu\'il se produise?\nRisque: quels sont les risques?\nAppréciation: que peut on  apprécier?\nCasse-tête: Quel est le casse-tête actuel de l\'équipe?',
      'fourlsInfo' : 'Les 4L sont une technique populaire et fréquemment utilisée, simple à mettre en place pour l\'animateur et facile à comprendre pour les participants. \n\nAimé: Qu\'est-ce que l\'équipe a vraiment apprécié dans l\'itération? En particulier, qu\'est-ce qui s\'est mieux passé que prévu? Insistez sur les aspects positifs. \nAppris: quelles nouvelles choses l\'équipe a-t-elle apprises pendant l\'itération? \ NIncessible: quelles choses l\'équipe aurait-elle pu mieux faire pendant l\'itération? \nDe longue durée: quelles sont les indisponible?',
      'leancoffeeInfo' : 'Une rétrospective Lean Coffee peut aider votre équipe à se rassembler et à élaborer un ordre du jour pour la réunion de votre équipe. Faire, en cours, terminé',
      'madsadgladInfo' : 'Ce modèle rétrospectif est un excellent moyen de vérifier le pouls émotionnel de votre équipe agile.',
      'whatwentwellInfo' : 'Qu\'est-ce qui s\'est bien passé? Qu\'est-ce qui ne s\'est pas bien passé? est une technique rétrospective de base qui met l\'accent sur les forces et les faiblesses de votre équipe.',
      'startstopcontinueInfo' : 'Si vous voulez des commentaires orientés vers l\'action, c\'est un excellent format pour votre équipe agile.',
      'freeformatInfo' : 'Les membres de l\'équipe peuvent faire part de leurs sentiments émotionnels en format libre.',
      'noListFound' : 'Les e-mails vierges ne peuvent pas être envoyés.'
    },
    'en': {
      'title': 'Hello World',
      'roomCode' : 'Room Code',
      'createRoom' : 'Create Room',
      'retrospectiveExp' : 'Engaging retrospectives that fuel continuous improvement',
      'joinRoom' : 'Join Room',
      'theme' : 'Theme',
      'addContent' : 'Add Content',
      'add' : 'Add',
      'copy' : 'Copied',
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
      'shareCode' : 'Share Code',
      'starfishInfo' : 'A starfish retrospective is named for its five points, where teams can articulate what to start doing, stop doing, keep doing, do more of, and do less of.',
      'sailorboatInfo' : 'A sailboat retrospective can illuminate all the things that are helping and hindering your scrum team.',
      'wrapInfo' : 'Wishes, Risks, Appreciations, Puzzles - This retrospective technique can uncover hidden concerns and helps teams examine a sprint from multiple perspectives.\n\nWish: What do you wish could happen?\nRisk: What are the risks?\nAppreciation: What can we appreciate?\nPuzzle: What is a current puzzle for the team?',
      'fourlsInfo' : '4Ls is a popular, frequently used technique that is simple to set up for the facilitator and easy to understand for the participants.\n\nLiked: What did the team really enjoy about the iteration? In particular, what went better than expected? Emphasize the positive.\nLearned: What new things did the team learn during the iteration?\nLacked: What things could the team have done better during the iteration?\nLonged For: What things did the team desire to have during the iteration that were not available?',
      'leancoffeeInfo' : 'A Lean Coffee retrospective can help your team gather and build an agenda for your team’s meeting. To do, doing, done.',
      'madsadgladInfo' : 'This retrospective template is a great way to check the emotional pulse of your agile team.',
      'whatwentwellInfo' : 'What Went Well? What Didn\'t Go Well? is a basic retrospective technique that focuses on your team\'s strengths and weaknesses.',
      'startstopcontinueInfo' : 'If you want action-oriented feedback, then this is a great format for your agile team.',
      'freeformatInfo' : 'Members of team can give comments whole emotional feelings in free format.',
      'noListFound' : 'Mail has not been sent due to no list item'
    },
    'tr': {
      'title': 'Başlık',
      'roomCode' : 'Oda Kod',
      'createRoom' : 'Oda Oluştur',
      'retrospectiveExp' : 'Sürekli iyileştirmeyi teşvik eden özel retrospektifler',
      'joinRoom' : 'Odaya Gir',
      'theme' : 'Tema',
      'addContent' : 'İçerik Gir',
      'add' : 'Ekle',
      'copy' : 'Kopyalandı',
      'chooseTemplate' : 'Şablon Seç',
      'historyList': 'Geçmiş',
      'maxSavedDataMessage' : 'Maksimum kayıtlı olan oda limiti aşılamaz',
      'save': 'Kaydedildi',
      'gotIt': 'Anladım!',
      'send' : 'Gönder',
      'sendMail' : 'Mail Gönder',
      'emailAddress' : 'Email Adresi gir',
      'successEmailRequest' : 'Mail gönderildi',
      'failEmailRequest' : 'Mail gönderilemedi, Hata :',
      'nocontent' : 'Henüz veri yok',
      'shareCode' : 'Kodu Paylaş',
      'starfishInfo' : '5 temel konuyu ele alan Starfish methodu ile yapmaya başlanacak, devam edilecek, daha az yapılacak, daha çok yapılacak ve yapılmayacak olan aksiyonlar girilir.',
      'sailorboatInfo' : 'Ekibe yardımcı olan ve ekibi engelleyen her şey burada paylaşılır.',
      'wrapinfo' : 'Wish: Ne olmasını isterdik?\nRisk: Risklerimiz nelerdi?\nAppreciation: Neye önem vermeliydik?\nPuzzle: Takım için çözmemiz gereken sorun nedir?',
      'fourlsInfo' : 'Liked: Bu sprintte takım nelerden keyif aldı?\nLearned: Bu sprint takıma neler öğretti?\nLacked: Bu sprintte eksik olan ya da daha iyi olabilecek neler vardı?\nLonged For: Bu sprintte ne olsa daha iyi olurdu?',
      'leancoffeeInfo' : 'Yapılanlar, yapılacaklar, yapılmakta olanlar şeklinde 3 alanda yorum girebildiğimiz Lean Coffee methodu takımın hedeflerinde geldiği mevcut durumu gösterir.',
      'madsadgladInfo' : 'Takım üyelerinin duygusal olarak sprintten kızgın, üzgün, memnun oldukları konuları paylaşmalarını sağlar.',
      'whatwentwellInfo' : 'Takım içinde neyin iyi yapıldığını nelerin iyi yapılmadığını belirlemek için kullanılır.',
      'startstopcontinueInfo' : 'Aksiyon almak için uygulanan template tipidir, başlama, bitirme ve devam etme aksiyonlarını almayı sağlar.',
      'freeformatInfo' : 'Takım üyeleri bu template formatında diledikleri yorumları girebilir.',
      'noListFound' : 'Boş mail gönderilemez.'
},
  };
  String get send {
    return _localizedValues[locale.languageCode]['send'];
  }
  String get noListFound {
    return _localizedValues[locale.languageCode]['noListFound'];
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
  String get shareCode {
    return _localizedValues[locale.languageCode]['shareCode'];
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
  String get retrospectiveExp {
    return _localizedValues[locale.languageCode]['retrospectiveExp'];
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