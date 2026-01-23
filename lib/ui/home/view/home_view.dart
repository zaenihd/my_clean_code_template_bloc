import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              itemBuilder: (context, index) =>
                  ListTile(title: Text(state.lowongan![index].jobTitle)),
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
