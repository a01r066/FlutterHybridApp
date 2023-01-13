import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viez_module/config/service_locator.dart';
import 'package:viez_module/pages/sample/sample_cubit.dart';
import 'package:viez_module/repositories/app_repository.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  SampleCubit homeCubit = SampleCubit(appRepository: locator.get<AppRepository>());

  @override
  void initState() {
    homeCubit.getNumberTrivia();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("VieZ's API Testing"),
      ),
      body: BlocProvider(
        create: (context) => homeCubit,
        child: BlocConsumer<SampleCubit, SampleState>(
          listener: (context, state) {
            // TODO: implement listener
            debugPrint(
                "HomeState: ${state.status}\nNumberTrivia: ${state.numberTrivia}");
          },
          builder: (context, state) {
            return state.status == MyStatus.loading
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.blue,
                  ))
                : _buildBody();
          },
        ),
      ),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(homeCubit.state.numberTrivia ?? ""),
          ],
        ),
      ),
    );
  }
}
