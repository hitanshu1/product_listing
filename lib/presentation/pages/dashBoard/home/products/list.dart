import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Widgets/Views/Views.dart';
import '../../../../../core/utils/navigationService.dart';
import '../../../../../data/models/product.dart';
import '../../../../../routes/appRoutes.dart';
import '../../../../bloc/product/bloc.dart';
import '../../../../bloc/product/state.dart';
import '../../../../common/cards/product.dart';

/// home product grid items
class ProductGridItems extends StatelessWidget {
  /// constructor
  const ProductGridItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      return GriddViewBuilder(
        emptySubtitle: 'No product available',
        item: (int index) {
          final ProductModel _product=state.productsList[index];
          return ProductCard(
            key: Key('product-${_product.id}'),
            onTap: () {
              NavigatorService.pushNamed(AppRoutes.productDetails,
              arguments: _product.id);
            },
            product: _product,
          );
        },
        isLoading: state is ProductLoading,
        itemCount: state.productsList.length,
      );
    });
  }
}
