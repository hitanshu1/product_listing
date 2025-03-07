import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presentation/bloc/languages/bloc.dart';
import '../../presentation/bloc/languages/event.dart';
import '../../presentation/bloc/languages/state.dart';

/// local dropdown
class LocalDropdown extends StatelessWidget {
  /// constructor
  const LocalDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LanguagesBloc>().add(ChangeLanguageEvent(locale: context.locale));
    return BlocBuilder<LanguagesBloc, LanguagesState>(
      builder: (context, state) {
        return DropdownButton<Locale>(
       style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary),
          value: state.locale,
          items: [
            DropdownMenuItem(
              value: const Locale('en'),
              child: Text('English',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
             DropdownMenuItem(
                value: const Locale('as'), child: Text('অসমীয়া',
                style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary))),
             DropdownMenuItem(value: const Locale('bn'), child: Text('বাংলা',
            style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary))),
             DropdownMenuItem(value: const Locale('hi'), child: Text('हिंदी',
             style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary))),
          ],
          onChanged: (Locale? locale) {
            if (locale != null) {
             context.read<LanguagesBloc>().add(ChangeLanguageEvent(locale: locale));
            }
          },
        );
      },
    );
  }
}
