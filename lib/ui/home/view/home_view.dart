import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_clean_code_template/core/navigation/app_router.dart';
import 'package:my_clean_code_template/core/navigation/app_routes.dart';
import 'package:my_clean_code_template/core/navigation/navigation_service.dart';
import 'package:my_clean_code_template/ui/home/bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("yeeee"), actions: const []),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.lowongan != null) {
            return ListView.builder(
              itemCount: state.lowongan!.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  NavigationService.pushNamed(
                    AppRoutes.detailLowongan,
                    args: state.lowongan![index].id,
                  );
                },
                subtitle: Text(state.lowongan![index].company.employees),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.lowongan![index].company.image),
                    ),
                  ),
                ),
                title: Text(state.lowongan![index].jobTitle),
              ),
            );
          }
          if (state.error != null) {
            return Center(child: Text(state.error!));
          }
          return Column(children: []);
        },
      ),
    );
  }
}
