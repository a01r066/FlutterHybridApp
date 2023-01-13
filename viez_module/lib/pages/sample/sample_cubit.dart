import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:viez_module/repositories/app_repository.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  SampleCubit({required this.appRepository}) : super(SampleState.initial());

  final AppRepository appRepository;

  getNumberTrivia() async {
    emit(state.copyWith(status: MyStatus.loading));
    final response = await appRepository.getNumberTrivia();
    emit(state.copyWith(status: MyStatus.success, numberTrivia: response));
  }
}
