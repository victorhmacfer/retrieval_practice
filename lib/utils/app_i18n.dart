import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class SpacedAppLocalizations {
  SpacedAppLocalizations(this.locale);

  final Locale locale;

  static SpacedAppLocalizations of(BuildContext context) {
    return Localizations.of<SpacedAppLocalizations>(context, SpacedAppLocalizations);
  }

  //FIXME: edited 9 days ago is fixed for every question !
  // havent implemented the logic for that yet
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'getStarted': 'GET STARTED', //get started screen
      'signUp': 'SIGN UP',
      'signUpScreenTitle': 'Sign Up',
      'alreadyRegistered': 'Already registered ?',
      'signUpFirstNameBlank': 'Please, tell us!',
      'signUpLastNameBlank': 'This one too!',

      'loginScreenTitle': 'Login', //login screen

      'firstNameFormHintText': 'First name', // forms
      'lastNameFormHintText': 'Last name',
      'emailFormHintText': 'Email',
      'passwordFormHintText': 'Password',
      'resetPassword': 'Reset Password',
      'loginEmailNotFound': "We couldn't find a user with this email!",
      'passwordTooShort': 'Must be at least 8 characters long.',
      'wrongPassword': 'Wrong password!',
      'emailAlreadyInUse': 'Email already in use!',
      'invalidEmail': 'Invalid email !',


      'homeNoDecksYet': 'No decks yet!', //Home screen
      'homeNoDecksYetSubText': 'Create a deck of cards and it will show up here.',

      'dueQuestions': 'Due Questions', // due questions card
      'minute': 'minute',
      'minutes': 'minutes',
      'learn': 'Learn',


      'darkTheme': 'Dark Theme', // settings screen
      'preferences': 'Preferences',
      'importExport': 'Import/Export',
      'sendFeedback': 'Send Feedback',
      'rateUs': 'Rate Us',
      'privacyPolicy': 'Privacy Policy',
      'aboutTheApp': 'About Spaced',
      'settingsLogout': 'Log out',

      'createDeckTitle': 'Create deck', //create deck screen
      'changeImage': 'Change Image',
      'untitledHintText': 'Untitled',


      'pickCoverTitle': 'Pick cover', //pick cover screen
      'pickCoverSearchFieldLabel': 'Search term',
      'pickCoverImageSearchError': 'An error occurred when\nsearching for images of',


      'question': 'question', //deck widget
      'questions': 'questions', 
      'due': 'due',
      'duePlural': 'due',
      'delete': 'Delete',

      'deckInfoNoQuestionsYet': "You haven't created any questions yet!", // deck info screen


      'edited': 'edited', //question tile
      'daysAgo': 'days ago',
      'dayAgo': 'day ago',
      'questionNotTheTimeToReviewYet': 'Not the time to review this one yet!',
      'questionDeletionConfirmationQuestion': 'Do you really want to remove this question?',
      'questionDeletionWarning': 'This action is IRREVERSIBLE.',
      'cancel': 'Cancel',
      'yes': 'yes',
      'dayWordFirstLetter': 'd',

      'questionFrontSide': 'Question', // create question screen
      'questionBackSide': 'Answer',
      'cardFrontSide': 'Front side',
      'cardBackSide': 'Back side',

      'dueCards': 'Due cards' // answer question screen



    
    },
    
    'pt': {
      'getStarted': 'COMEÇAR',
      'signUp': 'REGISTRAR-SE',
      'signUpScreenTitle': 'Registrar',
      'alreadyRegistered': 'Já possui uma conta ?',
      'signUpFirstNameBlank': 'Como nós te chamamos?',
      'signUpLastNameBlank': 'E o sobrenome?',

      'loginScreenTitle': 'Login', //login screen

      'firstNameFormHintText': 'Nome', // forms
      'lastNameFormHintText': 'Sobrenome',
      'emailFormHintText': 'Email',
      'passwordFormHintText': 'Senha',
      'resetPassword': 'Esqueceu a senha?',
      'loginEmailNotFound': "Usuário não encontrado!",
      'passwordTooShort': 'A senha deve conter pelo menos 8 caracteres.',
      'wrongPassword': 'Senha incorreta!',
      'emailAlreadyInUse': 'Este email já foi utilizado por outro usuário.',
      'invalidEmail': 'Email inválido !',

      'homeNoDecksYet': 'Você ainda não criou nenhum deck!', //Home screen
      'homeNoDecksYetSubText': 'Crie um e ele aparecerá aqui.',

      'dueQuestions': 'Perguntas pendentes', // due questions card
      'minute': 'minuto',
      'minutes': 'minutos',
      'learn': 'Praticar',


      'darkTheme': 'Tema Escuro', // settings screen
      'preferences': 'Preferências',
      'importExport': 'Importar/Exportar',
      'sendFeedback': 'Enviar Feedback',
      'rateUs': 'Avaliar app',
      'privacyPolicy': 'Política de Privacidade',
      'aboutTheApp': 'Sobre o Spaced',
      'settingsLogout': 'Sair',

      'createDeckTitle': 'Criar deck', //create deck screen
      'changeImage': 'Mudar capa',
      'untitledHintText': 'Nome do deck',


      'pickCoverTitle': 'Escolher capa', //pick cover screen
      'pickCoverSearchFieldLabel': 'Buscar',
      'pickCoverImageSearchError': 'Ocorreu um erro na busca\npor imagens para',


      'question': 'pergunta', //deck widget
      'questions': 'perguntas',
      'due': 'pendente',
      'duePlural': 'pendentes',
      'delete': 'Remover',

      'deckInfoNoQuestionsYet': "Você ainda não criou nenhuma pergunta!", // deck info screen


      'edited': 'editada',  // question tile
      'daysAgo': 'dias atrás',
      'dayAgo': 'dia atrás',
      'questionNotTheTimeToReviewYet': 'Ainda não é hora de revisar essa pergunta!',
      'questionDeletionConfirmationQuestion': 'Você realmente quer remover esta pergunta?',
      'questionDeletionWarning': 'Esta ação é IRREVERSÍVEL.',
      'cancel': 'Cancelar',
      'yes': 'sim',
      'dayWordFirstLetter': 'd',

      'questionFrontSide': 'Pergunta', // create question screen
      'questionBackSide': 'Resposta',
      'cardFrontSide': 'Frente do card',
      'cardBackSide': 'Verso do card',

      'dueCards': 'Cards pendentes' // answer question screen




    },
  };


  // =================================  GET STARTED SCREEN  ========================================
  String get getStarted {
    return _localizedValues[locale.languageCode]['getStarted'];
  }
  String get signUp {
    return _localizedValues[locale.languageCode]['signUp'];
  }
  String get signUpScreenTitle {
    return _localizedValues[locale.languageCode]['signUpScreenTitle'];
  }

  String get alreadyRegistered {
    return _localizedValues[locale.languageCode]['alreadyRegistered'];
  }
  String get signUpFirstNameBlank {
    return _localizedValues[locale.languageCode]['signUpFirstNameBlank'];
  }
  String get signUpLastNameBlank {
    return _localizedValues[locale.languageCode]['signUpLastNameBlank'];
  }

  // =================================  LOGIN SCREEN  ========================================
  String get loginScreenTitle {
    return _localizedValues[locale.languageCode]['loginScreenTitle'];
  }
  // =================================  FORMS  ========================================

  String get firstNameFormHintText {
    return _localizedValues[locale.languageCode]['firstNameFormHintText'];
  }

  String get lastNameFormHintText {
    return _localizedValues[locale.languageCode]['lastNameFormHintText'];
  }

  String get emailFormHintText {
    return _localizedValues[locale.languageCode]['emailFormHintText'];
  }

  String get passwordFormHintText {
    return _localizedValues[locale.languageCode]['passwordFormHintText'];
  }

  String get resetPassword {
    return _localizedValues[locale.languageCode]['resetPassword'];
  }
  String get loginEmailNotFound {
    return _localizedValues[locale.languageCode]['loginEmailNotFound'];
  }
  String get passwordTooShort {
    return _localizedValues[locale.languageCode]['passwordTooShort'];
  }
  String get wrongPassword {
    return _localizedValues[locale.languageCode]['wrongPassword'];
  }
  String get emailAlreadyInUse {
    return _localizedValues[locale.languageCode]['emailAlreadyInUse'];
  }
  String get invalidEmail {
    return _localizedValues[locale.languageCode]['invalidEmail'];
  }

  // =================================  HOME SCREEN  ========================================
  String get homeNoDecksYet {
    return _localizedValues[locale.languageCode]['homeNoDecksYet'];
  }

  String get homeNoDecksYetSubText {
    return _localizedValues[locale.languageCode]['homeNoDecksYetSubText'];
  }
  // =================================  DUE QUESTIONS CARD  ========================================
  String get dueQuestions {
    return _localizedValues[locale.languageCode]['dueQuestions'];
  }

  String get minute {
    return _localizedValues[locale.languageCode]['minute'];
  }

  String get minutes {
    return _localizedValues[locale.languageCode]['minutes'];
  }

  String get learn {
    return _localizedValues[locale.languageCode]['learn'];
  }
  // =================================  SETTINGS SCREEN  ========================================


  String get darkTheme {
    return _localizedValues[locale.languageCode]['darkTheme'];
  }

  String get preferences {
    return _localizedValues[locale.languageCode]['preferences'];
  }

  String get importExport {
    return _localizedValues[locale.languageCode]['importExport'];
  }

  String get sendFeedback {
    return _localizedValues[locale.languageCode]['sendFeedback'];
  }

  String get rateUs {
    return _localizedValues[locale.languageCode]['rateUs'];
  }

  String get privacyPolicy {
    return _localizedValues[locale.languageCode]['privacyPolicy'];
  }

  String get aboutTheApp {
    return _localizedValues[locale.languageCode]['aboutTheApp'];
  }

  String get settingsLogout {
    return _localizedValues[locale.languageCode]['settingsLogout'];
  }
  // =================================  CREATE DECK SCREEN  ========================================
  String get createDeckTitle {
    return _localizedValues[locale.languageCode]['createDeckTitle'];
  }

  String get changeImage {
    return _localizedValues[locale.languageCode]['changeImage'];
  }

  String get untitledHintText {
    return _localizedValues[locale.languageCode]['untitledHintText'];
  }
  // =================================  PICK COVER SCREEN  ========================================
  String get pickCoverTitle {
    return _localizedValues[locale.languageCode]['pickCoverTitle'];
  }

  String get pickCoverSearchFieldLabel {
    return _localizedValues[locale.languageCode]['pickCoverSearchFieldLabel'];
  }
  String get pickCoverImageSearchError {
    return _localizedValues[locale.languageCode]['pickCoverImageSearchError'];
  }
  // =================================  DECK WIDGET  ========================================
  String get question {
    return _localizedValues[locale.languageCode]['question'];
  }
  String get questions {
    return _localizedValues[locale.languageCode]['questions'];
  }

  String get due {
    return _localizedValues[locale.languageCode]['due'];
  }
  String get duePlural {
    return _localizedValues[locale.languageCode]['duePlural'];
  }
  String get delete {
    return _localizedValues[locale.languageCode]['delete'];
  }
  
  // =================================  DECK INFO SCREEN  ========================================

  String get deckInfoNoQuestionsYet {
    return _localizedValues[locale.languageCode]['deckInfoNoQuestionsYet'];
  }

  // =================================  QUESTION TILE  ========================================

  String get edited {
    return _localizedValues[locale.languageCode]['edited'];
  }

  String get daysAgo {
    return _localizedValues[locale.languageCode]['daysAgo'];
  }

  String get dayAgo {
    return _localizedValues[locale.languageCode]['dayAgo'];
  }

  String get questionNotTheTimeToReviewYet {
    return _localizedValues[locale.languageCode]['questionNotTheTimeToReviewYet'];
  }

  String get questionDeletionConfirmationQuestion {
    return _localizedValues[locale.languageCode]['questionDeletionConfirmationQuestion'];
  }

  String get questionDeletionWarning {
    return _localizedValues[locale.languageCode]['questionDeletionWarning'];
  }

  String get cancel {
    return _localizedValues[locale.languageCode]['cancel'];
  }

  String get yes {
    return _localizedValues[locale.languageCode]['yes'];
  }

  String get dayWordFirstLetter {
    return _localizedValues[locale.languageCode]['dayWordFirstLetter'];
  }
  // =================================  CREATE QUESTION SCREEN  ========================================
  String get questionFrontSide {
    return _localizedValues[locale.languageCode]['questionFrontSide'];
  }

  String get questionBackSide {
    return _localizedValues[locale.languageCode]['questionBackSide'];
  }
  String get cardFrontSide {
    return _localizedValues[locale.languageCode]['cardFrontSide'];
  }
  String get cardBackSide {
    return _localizedValues[locale.languageCode]['cardBackSide'];
  }
  // =================================  ANSWER QUESTION SCREEN  ========================================
  String get dueCards {
    return _localizedValues[locale.languageCode]['dueCards'];
  }


}


class SpacedAppLocalizationsDelegate extends LocalizationsDelegate<SpacedAppLocalizations> {
  const SpacedAppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<SpacedAppLocalizations> load(Locale locale) {
    return SynchronousFuture<SpacedAppLocalizations>(SpacedAppLocalizations(locale));
  }

  @override
  bool shouldReload(SpacedAppLocalizationsDelegate old) => false;
}

