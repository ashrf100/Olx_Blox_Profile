import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:olx_bloc/features/cart/presentation/pages/cart_bottom_sheet.dart';

enum AppState {
  loading,
  linearloading,
  success,
  noInternet,
  serverFailure,
  error,
  cartEmpty,
  noData
}

class HandleData extends StatelessWidget {
  final AppState appState;
  final Widget child;
  final String message;
  final void Function()? onPressed;

  const HandleData(
      {Key? key,
      required this.appState,
      required this.child,
      required this.message,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (appState) {
      case AppState.loading:
        return const AppLoadingWidget(size: 25);
      case AppState.linearloading:
        return Stack(
          children: [
            const LinearProgressIndicator(
              color: AppColors.primaryLight,
              backgroundColor: AppColors.primary,
            ),
            Expanded(child: child)
          ],
        );
      case AppState.noInternet:
        return const NoInternet();
      case AppState.error:
        return AppErrorWidget(
          message: message,
          onPressed: onPressed,
        );
      case AppState.cartEmpty:
        return const CartEmptyCase();
      case AppState.serverFailure:
        return const ServerFailureCase();
      case AppState.noData:
        return const NoDataCase();
      case AppState.success:
      default:
        return RefreshIndicator(
            onRefresh: () async {
              return onPressed!();
            },
            child: child);
    }
  }
}

class AppLoadingWidget extends StatelessWidget {
  final double? size;
  const AppLoadingWidget({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(
        color: AppColors.primary,
        size: size ?? 25.w,
      ),
    );
  }
}

// Error Widgets
class ServerFailureCase extends StatelessWidget {
  const ServerFailureCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildErrorWidget(
      context,
      icon: Icons.error_outline,
      message: "Server failure",
    );
  }
}

class NoDataCase extends StatelessWidget {
  const NoDataCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildErrorWidget(
      context,
      icon: Icons.data_object,
      message: "No Data Here",
    );
  }
}

class CartEmptyCase extends StatelessWidget {
  const CartEmptyCase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildErrorWidget(
      context,
      icon: Icons.no_stroller_sharp,
      message: "Cart Empty",
    );
  }
}

class AppErrorWidget extends StatelessWidget {
  final String message;
  final void Function()? onPressed;

  const AppErrorWidget(
      {Key? key, required this.message, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildErrorWidget(context,
        icon: Icons.error_outline_outlined,
        message: message,
        onPressed: onPressed);
  }
}

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildErrorWidget(
      context,
      icon: Icons.signal_wifi_off,
      message: "No internet connection",
    );
  }
}

// Helper function to build error widgets
Widget _buildErrorWidget(BuildContext context,
    {required IconData icon,
    required String message,
    void Function()? onPressed}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 64.0,
          color: AppColors.primaryLight,
        ),
        const SizedBox(height: 16.0),
        Text(message, style: const TextStyle(color: AppColors.primary)),
        const SizedBox(height: 16.0),
        MaterialButton(
          onPressed: onPressed,
          child: const Text(
            "Back",
            style: TextStyle(color: AppColors.primary),
          ),
        )
      ],
    ),
  );
}

void showSnackbar(
    {required BuildContext context,
    required String message,
    required bool isSuccess,
    bool? showCloseIcon}) {
  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    showCloseIcon: showCloseIcon ?? false,
    margin:
        showCloseIcon ?? false ? EdgeInsets.symmetric(vertical: 200.h) : null,
    closeIconColor: AppColors.primaryVariant,
    elevation: 2,
    content: SizedBox(
      height: 20.h,
      child: FittedBox(
        fit: BoxFit.none,
        child: Text(
          message,
          softWrap: false,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.primaryVariant, fontWeight: FontWeight.w800),
        ),
      ),
    ),
    backgroundColor: isSuccess
        ? AppColors.primary.withOpacity(0.8)
        : AppColors.error.withOpacity(0.8),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

