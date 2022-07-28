import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recru_test/service/dependencies.dart';

import '../../bloc/recruiters_bloc.dart';

class RecruitersScreen extends StatefulWidget {
  const RecruitersScreen({Key? key}) : super(key: key);

  @override
  State<RecruitersScreen> createState() => _RecruitersScreenState();
}

class _RecruitersScreenState extends State<RecruitersScreen> {
  @override
  void initState() {
    super.initState();
    injector<RecruitersCubit>().loadRecruiters("20");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecruitersCubit, RecruitersState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (recruiter) => ListView.separated(
              shrinkWrap: true,
              itemCount: recruiter.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (_, index) => Text(recruiter[index].name!),
            ),
            error: (e) {
              return Center(child: Text(e.toString()));
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
