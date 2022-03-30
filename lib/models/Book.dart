class Book {
  String bookID;
  String isbn;
  String authors;
  String bookName;
  String publisher;
  String originalLanguage;
  num year;
  num numberOfPages;
  String size;
  num weight;
  String coverType;
  String annotation;
  String coverFileUrl;
  num ownBookID;

  Book({
    this.bookID,
    this.isbn,
    this.authors,
    this.bookName,
    this.publisher,
    this.originalLanguage,
    this.year,
    this.numberOfPages,
    this.size,
    this.weight,
    this.coverType,
    this.annotation,
    this.coverFileUrl,
    this.ownBookID,
  });

  factory Book.fromJson(dynamic json) {
    return Book(
      bookID: json['_id'] as String,
      isbn: json['ISBN'] as String,
      authors: json['Автор'] as String,
      bookName: json['Название'] as String,
      publisher: json['Издательство'] as String,
      originalLanguage: json['язык_оригинала'] as String,
      year: json['Год'] as num,
      numberOfPages: json['Кол-во_стр.'] as num,
      size: json['Размер'] as String,
      weight: json['Вес'] as num,
      coverType: json['Тип_обл.'] as String,
      annotation: json['Аннотация'] as String,
      coverFileUrl: json['файл_обложки'] as String,
      ownBookID: json['id_книги_наш'] as num,
    );
  }

  // @override
  // String toString() {
  //   return '{ ${this.bookID}, ${this.isbn}, ${this.authors}, ${this.bookName},'
  //       '${this.publisher}, ${this.originalLanguage}, ${this.year},'
  //       '${this.numberOfPages}, ${this.size}, ${this.weight}, ${this.coverType},'
  //       '${this.annotation}, ${this.coverFileUrl}, ${this.priceOfSupplier},'
  //       '${this.ownBookID}, ${this.supplierBookID}, ${this.supplier},'
  //       '${this.supplierDeliveryTime}, ${this.wayAccess0}, ${this.wayAccess1},'
  //       '${this.wayAccess2}, ${this.wayAccess3}, ${this.wayAccess4},'
  //       '${this.wayAccess5}, ${this.wayAccess6}, ${this.wayAccess7},'
  //       '${this.wayAccess8}, ${this.wayAccess9}}';
  // }

  static List<Book> listFromJson(list) =>
      List<Book>.from(list.map((x) => Book.fromJson(x)));
}
