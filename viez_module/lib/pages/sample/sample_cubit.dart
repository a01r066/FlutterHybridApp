import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:viez_module/repositories/app_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.appRepository}) : super(HomeState.initial());

  final AppRepository appRepository;

  getNumberTrivia() async {
    emit(state.copyWith(status: MyStatus.loading));
    final response = await appRepository.getNumberTrivia();
    emit(state.copyWith(status: MyStatus.success, numberTrivia: response));
  }
}
