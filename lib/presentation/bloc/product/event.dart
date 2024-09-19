import 'package:equatable/equatable.dart';

/// product event
abstract class ProductEvent extends Equatable {
  /// constructor
  const ProductEvent();
  @override
  List<Object?> get props => [];
}

///get home products
class GetProducts extends ProductEvent {}


/// search product
class SearchProductEvent extends ProductEvent {
  /// constructor
  const SearchProductEvent(this.val);

  /// search value
  final String val;
}
