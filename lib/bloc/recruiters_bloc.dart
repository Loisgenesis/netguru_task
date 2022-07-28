import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recru_test/repository/recruiters_repository.dart';
import 'package:injectable/injectable.dart';

import '../model/recruiter.dart';

part 'recruiters_bloc.freezed.dart';

part 'recruiters_state.dart';

@Injectable()
class RecruitersCubit extends Cubit<RecruitersState> {
  RecruitersCubit(this._recruitersRepository)
      : super(const RecruitersState.initial());

  final RecruitersRepository _recruitersRepository;

  void loadRecruiters(String query) async {
    emit(
      const RecruitersState.loading(),
    );
    await _recruitersRepository.getRecruiters(query).then((value) {
      emit(RecruitersState.loaded(value));
    }).catchError((error, stackTrace) {
      emit(
        RecruitersState.error(error),
      );
    });
  }
}
