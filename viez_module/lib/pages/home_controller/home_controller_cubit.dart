import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_controller_state.dart';

class HomeControllerCubit extends Cubit<HomeControllerState> {
  HomeControllerCubit() : super(HomeControllerInitial());
}
