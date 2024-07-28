import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthErrorFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CacheErrorFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}