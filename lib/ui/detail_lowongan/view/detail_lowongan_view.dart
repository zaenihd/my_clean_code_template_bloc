import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/di/service_locator.dart';
import 'package:my_clean_code_template/core/widget/app_txt.dart';
import 'package:my_clean_code_template/ui/detail_lowongan/cubit/detail_lowongan_cubit.dart';

class DetailLowonganView extends StatelessWidget {
  DetailLowonganView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DetailLowonganCubit>()..fetchDetailLowongan(id),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<DetailLowonganCubit, DetailLowonganState>(
            builder: (context, state) {
              if (state.dataLowongan != null) {
                return
                Column(
                  children: [
                    Image.network(state.dataLowongan!.company.image),
                    Txt(state.dataLowongan!.jobTitle, fontSize: 20, fontWeight: FontWeight.bold, ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Txt(state.dataLowongan!.salary, fontSize: 20, fontWeight: FontWeight.bold, ),
                    ],
                );
              }
              if (state.isLoading) return Center(child: CircularProgressIndicator());
              if (state.error != null) return Text(state.error!);
        
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
