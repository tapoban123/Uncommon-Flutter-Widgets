import 'package:flutter/material.dart';
import 'package:scaffold_bottom_sheet/bottom_sheet/bottom_sheet_content.dart';

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 1,
      minChildSize: 0.2,
      expand: false,
      builder: (context, scrollController) {
        return BottomSheetContent(scrollController: scrollController);
      },
    ),
  );
}
