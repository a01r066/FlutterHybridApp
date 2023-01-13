part of 'sample_cubit.dart';

enum MyStatus {
  initial, loading, success, error
}

class SampleState extends Equatable {
  const SampleState({required this.status, this.numberTrivia});

  final MyStatus status;
  final String? numberTrivia;

  @override
  List<Object> get props => [status];

  factory SampleState.initial(){
    return const SampleState(status: MyStatus.initial);
  }

  SampleState copyWith({
    MyStatus? status,
    String? numberTrivia,
  }) {
    return SampleState(
      status: status ?? this.status,
      numberTrivia: numberTrivia ?? this.numberTrivia,
    );
  }
}
