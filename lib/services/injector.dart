import 'package:favorite_sports_events/app/repositories/events_repository/events_repo.dart';
import 'package:favorite_sports_events/app/repositories/events_repository/events_repo_impl.dart';
import 'package:favorite_sports_events/services/http_service.dart';
import 'package:favorite_sports_events/services/local_storage_service.dart';
import 'package:favorite_sports_events/services/snackbar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app/blocs/bloc/home_bloc.dart';
import '../app/cubits/settings/app_settings_cubit.dart';
import '../app/repositories/app_settings_repository/app_settings_repository.dart';
import '../app/repositories/app_settings_repository/app_settings_repository_impl.dart';

class Injector extends StatelessWidget {
  final Widget child;

  const Injector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return _GlobalServiceInjector(
      child: _GlobalRepositoryInjector(
        child: _GlobalBlocInjector(
          child: child,
        ),
      ),
    );
  }
}

class _GlobalRepositoryInjector extends StatelessWidget {
  final Widget child;

  const _GlobalRepositoryInjector({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppSettingsRepository>(
          create: (context) => AppSettingsRepositoryImpl(
            httpService: context.read<HttpService>(),
            localStorageService: context.read<LocalStorageService>(),
          ),
        ),
        RepositoryProvider<EventsRepo>(
          create: (context) => EventsRepoImpl(
            httpService: context.read<HttpService>(),
            localStorageService: context.read<LocalStorageService>(),
          ),
        ),
      ],
      child: child,
    );
  }
}

class _GlobalBlocInjector extends StatelessWidget {
  final Widget child;

  const _GlobalBlocInjector({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsCubit>(
          create: (context) => AppSettingsCubit(countryRepository: context.read<AppSettingsRepository>()),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(eventRepo: context.read<EventsRepo>()),
        ),
      ],
      child: child,
    );
  }
}

class _GlobalServiceInjector extends StatelessWidget {
  final Widget child;

  const _GlobalServiceInjector({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HttpService>(create: (context) => HttpService()),
        RepositoryProvider<SnackBarService>(create: (context) => SnackBarService()),
        RepositoryProvider(create: (context) => LocalStorageService()),
      ],
      child: child,
    );
  }
}
