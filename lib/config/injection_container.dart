import 'package:get_it/get_it.dart';
import 'package:respira_acao/config/services/youtube/di/videolist_injection.dart';

final serviceLocator = GetIt.I;

Future<void> init() async {
  await videoListInjection();
}
