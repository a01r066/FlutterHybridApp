part of 'home_cubit.dart';

enum MyStatus {
  initial, loading, success, error
}

class HomeState extends Equatable {
  const HomeState({required this.status, this.numberTrivia});

  final MyStatus status;
  final String? numberTrivia;

  @override
  List<Object> get props => [status];

  factory HomeState.initial(){
    return const HomeState(status: MyStatus.initial);
  }

  HomeState copyWith({
    MyStatus? status,
    String? numberTrivia,
  }) {
    return HomeState(
      status: status ?? this.status,
      numberTrivia: numberTrivia ?? this.numberTrivia,
    );
  }
}
