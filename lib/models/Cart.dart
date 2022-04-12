import 'package:book_store_app/models/Book.dart';

class Cart {
  Book book;
  String supplierName;
  num supplierBookId;
  num total;
  String post;

  Cart({
    this.book,
    this.supplierName,
    this.supplierBookId,
    this.total,
    this.post,
  });

  factory Cart.fromJson(dynamic json) {
    return Cart(
      book: json['book'] as Book,
      supplierName: json['supplier_name'] as String,
      supplierBookId: json['supplier_book_id'] as num,
      total: json['total'] as num,
      post: json['post'] as String,
    );
  }

  static List<Cart> listFromJson(list) =>
      List<Cart>.from(list.map((x) => Cart.fromJson(x)));
}
