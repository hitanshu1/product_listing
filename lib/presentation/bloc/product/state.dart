import 'package:equatable/equatable.dart';

import '../../../data/models/product.dart';

/// product state
class ProductState extends Equatable {
  /// list of products
  final List<ProductModel> products;

  /// search text
  final String?  searchText;

  /// get products
  List<ProductModel> get productsList =>searchText==null?products:products.where((element) =>element.title.toLowerCase().contains(searchText!.toLowerCase())).toList();

  /// constructor
  const ProductState({this.products = const <ProductModel>[], this.searchText});
  @override
  List<Object?> get props => [products, searchText];

  /// Returns a new instance of [ProductState] with the same [products] list, or a new list
  /// if [products] is provided.
  ///
  /// If [products] is null, the new instance will have the same [products] list as the
  /// current instance.
  ///
  /// Parameters:
  /// - [products]: An optional list of [ProductModel] objects to replace the current list.
  ///
  /// Returns:
  /// - A new instance of [ProductState] with the updated [products] list.
  ProductState copyWith({List<ProductModel>? products,
    String? searchText}) {
    return ProductState(products: products ?? this.products,
        searchText: searchText ?? this.searchText);
  }
}

/// product initial state
class ProductInitial extends ProductState {
  /// constructor
  const ProductInitial() : super();
}

/// product loading
class ProductLoading extends ProductState {
  /// constructor
  const ProductLoading() : super();
}

/// product success
class ProductSuccess extends ProductState {
  /// constructor
  const ProductSuccess({required super.products});
}

/// home error
class ProductError extends ProductState {
  /// constructor
  const ProductError() : super();
}
