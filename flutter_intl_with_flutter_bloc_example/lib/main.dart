import 'package:flutter/material.dart';
import 'package:flutter_intl_example/style/theme.dart';
import 'package:flutter_intl_example/widgets/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_intl_example/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intl_example/blocs/preferences_bloc.dart';
import 'package:flutter_intl_example/repositories/preferences_repository_impl.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferencesRepository = PreferencesRepositoryImpl();

  final preferencesBloc = PreferencesBloc(
    preferencesRepository: preferencesRepository,
    initialLocale: await preferencesRepository.locale,
  );

  runApp(
    BlocProvider(
      create: (context) => preferencesBloc,
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: HomePage(),
          title: 'Flutter Intl Example',
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
            LocaleNamesLocalizationsDelegate(),
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state.locale,
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _firstName = 'Giancarlo';

  String _lastName = 'Code';

  int _notifications = 0;

  _resetNotifications() => setState(() => _notifications = 0);

  _incrementNotifications() => setState(() => _notifications++);

  _decrementNotifications() => setState(() {
        if (_notifications > 0) _notifications--;
      });

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      cards: <Widget>[
        LanguageCard(),
        TextCard(
          text: S.of(context).simpleText,
        ),
        TextCard(
          text: S.of(context).textWithPlaceholder(_firstName),
        ),
        TextCard(
          text: S.of(context).textWithPlaceholders(_firstName, _lastName),
        ),
        NotificationsCard(
          text: S.of(context).textWithPlural(_notifications),
          onReset: _resetNotifications,
          onDecrement: _decrementNotifications,
          onIncrement: _incrementNotifications,
        ),
      ],
    );
  }
}

class LanguageCard extends StatelessWidget {
  const LanguageCard({Key key}) : super(key: key);

  String _localizeLocale(BuildContext context, Locale locale) {
    if (locale == null) {
      return S.of(context).systemLanguage;
    } else {
      final localeString = LocaleNames.of(context).nameOf(locale.toString());
      return localeString[0].toUpperCase() + localeString.substring(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final preferencesBloc = context.bloc<PreferencesBloc>();

    return ExpansionListCard<Locale>(
      title: S.of(context).language,
      subTitle: _localizeLocale(context, preferencesBloc.state.locale),
      leading: Icon(Icons.language, size: 48),
      items: [
        null,
        ...S.delegate.supportedLocales,
      ],
      itemBuilder: (locale) {
        return ExpansionCardItem(
          text: _localizeLocale(context, locale),
          onTap: () => preferencesBloc.add(ChangeLocale(locale)),
        );
      },
    );
  }
}
