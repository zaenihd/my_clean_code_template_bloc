import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/ktp_cubit.dart';
import '../cubit/ktp_state.dart';

class KtpScanPage extends StatelessWidget {
  const KtpScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan KTP')),
      body: BlocBuilder<KtpCubit, KtpState>(
        builder: (_, state) {
          if (state is KtpLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is KtpLoaded) {
            return _form(state);
          }

          return Center(
            child: ElevatedButton(
              onPressed: () => context.read<KtpCubit>().scanKtp(),
              child: const Text('Foto KTP'),
            ),
          );
        },
      ),
    );
  }

  Widget _form(KtpLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _field('NIK', state.data.nik),
          _field('Nama', state.data.name),
          _field('Tanggal Lahir', state.data.birth),
          _field('Jenis Kelamin', state.data.gender),
          _field('Alamat', state.data.address),
        ],
      ),
    );
  }

  Widget _field(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
