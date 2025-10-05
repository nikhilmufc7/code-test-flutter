import 'package:code_test_flutter/src/app/core/extensions/context_extensions.dart';
import 'package:code_test_flutter/src/app/core/utils/load_state.dart';
import 'package:code_test_flutter/src/app/core/styles/styles.dart';
import 'package:code_test_flutter/src/features/photos/presentation/bloc/blocs/home_contract.dart';
import 'package:code_test_flutter/src/features/photos/presentation/view/widgets/photos_section_widget.dart';
import 'package:flutter/material.dart';

class HomeContentWidget extends StatelessWidget {
  final HomeData data;
  const HomeContentWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return switch (data.loadState) {
      LoadState.loading => const Center(child: CircularProgressIndicator()),
      LoadState.data => PhotosSectionWidget(data.photos),
      LoadState.empty => Center(
          child:
              Text(context.translations.noItems, style: TextStyles.textNormal)),
      LoadState.error => Center(
          child:
              Text(data.errorMessage ?? "Error", style: TextStyles.textNormal)),
    };
  }
}
