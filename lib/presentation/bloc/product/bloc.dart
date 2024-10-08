import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/product.dart';
import 'event.dart';
import 'state.dart';

/// product bloc
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  /// home repository
  final ProductRepository repository;

  /// home bloc constructor
  ProductBloc(this.repository) : super(const ProductInitial()) {
    on<GetProducts>(_getProducts);
    on<SearchProductEvent>(_searchProduct);
  }

  /// get home products
  Future<void> _getProducts(
      GetProducts event, Emitter<ProductState> emit) async {
    print('============');
    emit(const ProductLoading());
    final list = await repository.get();
    emit(ProductSuccess(products: list));
  }

  /// search product
  Future<void> _searchProduct(
      SearchProductEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(searchText: event.val));
  }
}
