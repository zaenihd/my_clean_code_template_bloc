import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/ui/detail_lowongan/cubit/detail_lowongan_cubit.dart';

class DetailLowonganView extends StatelessWidget {
  DetailLowonganView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DetailLowonganCubit>()..fetchDetailLowongan(id),
      child: Scaffold(
        body: BlocBuilder<DetailLowonganCubit, DetailLowonganState>(
          builder: (context, state) {
            if (state.dataLowongan != null)
              return SafeArea(
                child: Column(
                  children: [Text(state.dataLowongan!.jobTitle)],
                ),
              );
            if (state.isLoading) return CircularProgressIndicator();
            if (state.error != null) return Text(state.error!);

            return SizedBox();
          },
        ),
      ),
    );
  }
}
