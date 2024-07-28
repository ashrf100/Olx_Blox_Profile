import 'package:flutter/material.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/generated/l10n.dart';

import '../error/failures.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;
  final Function ? onRetry;
  final bool isSnackBar;

  const FailureWidget(
      {Key? key,
      required this.failure,
       this.onRetry,
      this.isSnackBar = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message;
    IconData icon;

    switch (failure.runtimeType) {
      case ServerFailure:
        message = S.of(context).PleaseCheckyourInternetConnection;
        icon = Icons.cloud_off;
        break;
      case AuthErrorFailure:
        message = S.of(context).UsernameorPasswordNotCorrect;
        icon = Icons.lock_outline;
        break;
      case OfflineFailure:
        message = S.of(context).PleaseCheckyourInternetConnection;
        icon = Icons.signal_wifi_off;
        break;
      default:
        message = 'An unexpected error occurred';
        icon = Icons.error_outline;
    }

    if (isSnackBar) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primaryVariant,
                  fontWeight: FontWeight.w800)),
          backgroundColor: AppColors.error.withOpacity(0.8),
          duration: const Duration(seconds: 3),
        ),
      );
      return Container();
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 100.0,
            color: AppColors.primary,
          ),
          Text(message),
          ElevatedButton(
            onPressed: () => onRetry!(),
            child: const Text('Retry'),
          ),
        ],
      );
    }
  }
}
