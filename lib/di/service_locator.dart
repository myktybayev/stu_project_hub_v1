import 'package:get_it/get_it.dart';
import 'package:stu_project_hub/features/home/store/project_store.dart';
import 'package:stu_project_hub/features/challenge/store/challenge_store.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator.registerSingleton<ProjectStore>(ProjectStore());
  serviceLocator.registerSingleton<ChallengeStore>(ChallengeStore());
}
