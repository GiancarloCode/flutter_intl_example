import 'dart:ui';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_example/repositories/preferences_repository.dart';

abstract class PreferencesEvent extends Equatable {}

class ChangeLocale extends PreferencesEvent {
  final Locale locale;

  ChangeLocale(this.locale);

  @override
  List<Object> get props => [locale];
}

class PreferencesState extends Equatable {
  final Locale locale;

  PreferencesState({@required this.locale});

  @override
  List<Object> get props => [locale];
}

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferencesRepository _preferencesRepository;
  final PreferencesState _initialState;

  PreferencesBloc({
    @required PreferencesRepository preferencesRepository,
    @required Locale initialLocale,
  })  : assert(preferencesRepository != null),
        _preferencesRepository = preferencesRepository,
        _initialState = PreferencesState(locale: initialLocale);

  @override
  PreferencesState get initialState => _initialState;

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    if (event is ChangeLocale) {
      await _preferencesRepository.saveLocale(event.locale);
      yield PreferencesState(locale: event.locale);
    }
  }
}
