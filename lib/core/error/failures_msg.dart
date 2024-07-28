import 'package:flutter/material.dart';
import 'package:olx_bloc/core/error/failures.dart';
import 'package:olx_bloc/generated/l10n.dart';

String mapFailureToMessage(Failure failure, BuildContext context) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return S.of(context).Pleasetryagainlater;
    case AuthErrorFailure:
      return S.of(context).UsernameorPasswordNotCorrect;

    case CacheErrorFailure:
      return S.of(context).WeApologizeSignupisCurrentlyDisabled;
    case OfflineFailure:
      return S.of(context).PleaseCheckyourInternetConnection;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
