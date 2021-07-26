class Book {
  String book_id;
  String seller_id;
  String bookName;
  String authors;
  String illustrators;
  String interpreters;
  String publisher;
  String originalLanguage;
  int year;
  int ISBN;
  int EAN;
  int ISSN;
  int numberOfPages;
  int height;
  int width;
  int length;
  int weight;
  int price;
  int quantity;
  int sellerBookID;
  String briefAnnotation;
  String longAnnotation;
  String coverType;
  String sellerName;

  Book(
      this.book_id,
      this.seller_id,
      this.bookName,
      this.authors,
      this.illustrators,
      this.interpreters,
      this.publisher,
      this.originalLanguage,
      this.year,
      this.ISBN,
      this.EAN,
      this.ISSN,
      this.numberOfPages,
      this.height,
      this.width,
      this.length,
      this.weight,
      this.price,
      this.quantity,
      this.sellerBookID,
      this.briefAnnotation,
      this.longAnnotation,
      this.coverType,
      this.sellerName,
      );

  factory Book.fromJson(dynamic json) {
    return Book(
      json['_id'] as String,
      json['sellerId'] as String,
      json['bookName'] as String,
      json['authors'] as String,
      json['illustrators'] as String,
      json['interpreters'] as String,
      json['publisher'] as String,
      json['originalLanguage'] as String,
      json['year'] as int,
      json['ISBN'] as int,
      json['EAN'] as int,
      json['ISSN'] as int,
      json['numberOfPages'] as int,
      json['height'] as int,
      json['width'] as int,
      json['length'] as int,
      json['weight'] as int,
      json['price'] as int,
      json['quantity'] as int,
      json['sellerBookId'] as int,
      json['briefAnnotation'] as String,
      json['longAnnotation'] as String,
      json['coverType'] as String,
      json['sellerName'] as String,
    );
  }

  @override
  String toString() {
    return '{ ${this.book_id}, ${this.seller_id}, ${this.bookName}, ${this.authors},'
        '${this.illustrators}, ${this.interpreters}, ${this.publisher}, ${this.originalLanguage},'
        '${this.year}, ${this.ISBN}, ${this.EAN}, ${this.ISSN},'
        '${this.numberOfPages}, ${this.height}, ${this.width}, ${this.length},'
        '${this.weight}, ${this.price}, ${this.quantity}, ${this.sellerBookID},'
        '${this.briefAnnotation}, ${this.longAnnotation}, ${this.coverType}, ${this.sellerName}}';
  }
}


