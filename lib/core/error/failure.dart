import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  @override
  List<Object?> get props => [] ;

}

class NoInternetFailure extends Failure{}

class ServerFailure extends Failure{}

class CacheFailure extends Failure{}

class WrongDataFailure extends Failure{}
