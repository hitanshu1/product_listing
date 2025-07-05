
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/navigationService.dart';
import 'event.dart';
import 'state.dart';

/// languages bloc
class LanguagesBloc extends Bloc<LanguagesEvent, LanguagesState> {
 
/// constructor
  LanguagesBloc() : super(const LanguagesState()) {
    on<ChangeLanguageEvent>(_onLanguagesEvent);

  }



  void _onLanguagesEvent(LanguagesEvent event, Emitter<LanguagesState> emit) {
    if (event is ChangeLanguageEvent) {
      NavigatorService.navigatorKey.currentContext?.setLocale(event.locale);
      emit(state.copyWith(locale: event.locale));
    }
  }

}
