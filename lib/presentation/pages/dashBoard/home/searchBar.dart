import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Widgets/Widgets.dart';
import '../../../../core/constants/constants.dart';
import '../../../bloc/product/bloc.dart';
import '../../../bloc/product/event.dart';
import '../../../bloc/product/state.dart';

/// home tab search bar
class HomeSearchBar extends StatelessWidget {
  /// constructor
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: SizeConfig.spaceBetween,
          ),
          child: TxtField.search(onChanged: (val) {
            context.read<ProductBloc>().add(SearchProductEvent(val));
          }),
        );
      },
    );
  }
}
