import 'package:dartz/dartz.dart';
import 'package:olx_bloc/core/error/exceptions.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/core/services/network_info.dart';
import 'package:olx_bloc/features/auth/data/datasources/Auth_local_data_source.dart';
import 'package:olx_bloc/features/auth/data/datasources/auth_Remote_data_source.dart';
import 'package:olx_bloc/features/auth/data/model/user_model.dart';
import 'package:olx_bloc/features/auth/domain/entities/user.dart';
import 'package:olx_bloc/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authlocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authlocalDataSource,
    required this.networkInfo,
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<Failure, User>> getCachedUser() async {
    try {
      final UserModel userModel = await authlocalDataSource.getCacheUser();
      return Right(User(
          id: userModel.id!,
          username: userModel.username!,
          email: userModel.email!,
          firstName: userModel.firstName!,
          lastName: userModel.lastName!,
          image: userModel.image!));
    } on AuthErrorException {
      return left(AuthErrorFailure());
    }
  }

  @override
  Future<Either<Failure, User>> logIn({
    required String userName,
    required String password,
  }) async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final UserModel userModel = await authRemoteDataSource.logIn(
            userName: userName, password: password);
        await authlocalDataSource.cacheUser(userModel);

        return Right(User(
            id: userModel.id!,
            username: userModel.username!,
            email: userModel.email!,
            firstName: userModel.firstName!,
            lastName: userModel.lastName!,
            image: userModel.image!));
      } on ServerException {
        return left(ServerFailure());
      } on AuthErrorException {
        return left(AuthErrorFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, User>> changePassword({
    required int userId,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> logOut() async {
    await authlocalDataSource.deletCacheUser();
    return unit;
  }

  @override
  Future<Either<Failure, User>> signUp({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
