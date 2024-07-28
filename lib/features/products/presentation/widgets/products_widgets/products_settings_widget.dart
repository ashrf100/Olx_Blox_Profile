import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsSettingsWidget extends StatelessWidget {
  final bool isGridMode;
  final void Function()? onPressed;
  const ProductsSettingsWidget({
    super.key,
    required this.isGridMode,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: IconButton(
              key: ValueKey<bool>(isGridMode),
              icon: Icon(
                isGridMode ? Icons.view_list : Icons.grid_view,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: onPressed,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.tune_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
