class Order {
  String id;
  String status;
  String bookId;
  String supplierName;
  num supplierBookId;
  String total;
  String post;
  String clientId;
  String clientName;
  String clientEmail;
  String clientAddress;
  String clientZipCode;
  String clientCity;
  String clientPhoneNumber;

  Order({
    this.id,
    this.status,
    this.bookId,
    this.supplierName,
    this.supplierBookId,
    this.total,
    this.post,
    this.clientId,
    this.clientName,
    this.clientEmail,
    this.clientAddress,
    this.clientZipCode,
    this.clientCity,
    this.clientPhoneNumber
  });

  factory Order.fromJson(dynamic json) {
    return Order(
        id: json['_id'] as String,
        status: json['status'] as String,
        bookId: json['book_id'] as String,
        supplierName: json['supplier_name'] as String,
        supplierBookId: json['supplier_book_id'] as num,
        total: json['total'] as String,
        post: json['post'] as String,
        clientId: json['client_id'] as String,
        clientName: json['client_name'] as String,
        clientEmail: json['client_email'] as String,
        clientAddress: json['client_address'] as String,
        clientZipCode: json['client_zip_code'] as String,
        clientCity: json['client_city'] as String,
        clientPhoneNumber: json['client_phone_number'] as String);
  }

  static List<Order> listFromJson(list) =>
      List<Order>.from(list.map((x) => Order.fromJson(x)));
}
