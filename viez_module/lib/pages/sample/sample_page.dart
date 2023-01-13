import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viez_module/config/service_locator.dart';
import 'package:viez_module/pages/home/home_cubit.dart';
import 'package:viez_module/repositories/app_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit homeCubit = HomeCubit(appRepository: locator.get<AppRepository>());

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
        child: BlocConsumer<HomeCubit, HomeState>(
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
