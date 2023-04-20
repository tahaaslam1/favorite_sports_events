import 'package:favorite_sports_events/app/app.dart';
import 'package:favorite_sports_events/core/bootstrap.dart';
import 'package:favorite_sports_events/services/injector.dart';

void main() async {
  await bootstrap(() => const Injector(child: App()));
}








