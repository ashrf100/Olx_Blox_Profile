import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:olx_bloc/core/const/colors.dart';
import 'package:olx_bloc/core/widgets/handledata.dart';
import 'package:olx_bloc/generated/l10n.dart';

class ExitDialogWidget extends StatefulWidget {
  final String text;
  final onPressed;

  const ExitDialogWidget(
      {super.key, required this.text, required this.onPressed});
  @override
  State<ExitDialogWidget> createState() => _ExitDialogWidgetState();
}

class _ExitDialogWidgetState extends State<ExitDialogWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: SizedBox(
        height: 30.h,
        child: isLoading ? const AppLoadingWidget() : Text(widget.text),
      ),
      actions: <Widget>[
        if (!isLoading)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Row(
                  children: [
                    Icon(Icons.close, color: AppColors.error),
                    Text(S.of(context).no,
                        style: TextStyle(color: AppColors.error)),
                  ],
                ),
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 3));
                  Navigator.of(context).pop(true);
                  widget.onPressed();
                },
                child: Row(
                  children: [
                    Icon(Icons.check, color: AppColors.primary),
                    Text(S.of(context).yes,
                        style: TextStyle(color: AppColors.primary)),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
