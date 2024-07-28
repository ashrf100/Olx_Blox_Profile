import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/auth/domain/entities/user.dart';
import 'package:olx_bloc/features/auth/domain/repositories/auth_repository.dart';

class LogInUseCase {
  final AuthRepository repostiory;

  LogInUseCase({required this.repostiory});

  Future<Either<Failure, User>> call(
      {required String userName, required String password}) async {
    return await repostiory.logIn(userName: userName, password: password);
  }
}

class GetCachedUserUseCase {
  final AuthRepository repostiory;

  GetCachedUserUseCase({required this.repostiory});

  Future<Either<Failure, User>> call() async {
    return await repostiory.getCachedUser();
  }
}

class LogoutUseCase {
  final AuthRepository repostiory;

  LogoutUseCase({required this.repostiory});

  Future<Unit> call() async {
    return await repostiory.logOut();
  }
}
