import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
// GetCachedUser

  Future<Either<Failure, User>> getCachedUser();

  // Login
  Future<Either<Failure, User>> logIn(
      {required String userName, required String password});

  // Logout
  Future<Unit> logOut();

  // Signup
  Future<Either<Failure, User>> signUp({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  // Change password
  Future<Either<Failure, User>> changePassword(
      {required int userId, required String password});
}
