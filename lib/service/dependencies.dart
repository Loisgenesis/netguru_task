import 'package:get_it/get_it.dart';
import 'package:recru_test/bloc/recruiters_bloc.dart';
import 'package:recru_test/repository/recruiters_repository_local.dart';
import 'package:recru_test/service/recruiters_service_local.dart';
import 'package:recru_test/service/token_service_local.dart';

GetIt injector = GetIt.instance;

class DependencyManager {
  static Future<void> inject() async {
    GetIt.I.registerSingleton<RecruitersCubit>(
        RecruitersCubit(RecruitersRepositoryLocal(
      RecruitersServiceLocal(),
      TokenServiceLocal(),
    ))); //
  }
}
