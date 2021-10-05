class Book {
  String bookID;
  String isbn;
  String authors;
  String bookName;
  String publisher;
  String originalLanguage;
  int year;
  int numberOfPages;
  String size;
  double weight;
  String coverType;
  String annotation;
  String coverFileUrl;
  double priceOfSupplier;
  int ownBookID;
  int supplierBookID;
  String supplier;
  int supplierDeliveryTime;
  String wayAccess0;
  String wayAccess1;
  String wayAccess2;
  String wayAccess3;
  String wayAccess4;
  String wayAccess5;
  String wayAccess6;
  String wayAccess7;
  String wayAccess8;
  String wayAccess9;

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
    this.priceOfSupplier,
    this.ownBookID,
    this.supplierBookID,
    this.supplier,
    this.supplierDeliveryTime,
    this.wayAccess0,
    this.wayAccess1,
    this.wayAccess2,
    this.wayAccess3,
    this.wayAccess4,
    this.wayAccess5,
    this.wayAccess6,
    this.wayAccess7,
    this.wayAccess8,
    this.wayAccess9,
  });

  factory Book.fromJson(dynamic json) {
    return Book(
      bookID: json['_id'] as String,
      isbn: json['ISBN'] as String,
      authors: json['Автор'] as String,
      bookName: json['Название'] as String,
      publisher: json['Издательство'] as String,
      originalLanguage: json['язык_оригинала'] as String,
      year: json['Год'] as int,
      numberOfPages: json['Кол-во_стр.'] as int,
      size: json['Размер'] as String,
      weight: json['Вес'] as double,
      coverType: json['Тип_обл.'] as String,
      annotation: json['Аннотация'] as String,
      coverFileUrl: json['файл_обложки'] as String,
      priceOfSupplier: json['Цена_поставщика'] as double,
      ownBookID: json['id_книги_наш'] as int,
      supplierBookID: json['id_книги_поставщика'] as int,
      supplier: json['поставщик'] as String,
      supplierDeliveryTime: json['срок_отправки_поставщика'] as int,
      wayAccess0: json['способ_дост_0'] as String,
      wayAccess1: json['способ_дост_1'] as String,
      wayAccess2: json['способ_дост_2'] as String,
      wayAccess3: json['способ_дост_3'] as String,
      wayAccess4: json['способ_дост_4'] as String,
      wayAccess5: json['способ_дост_5'] as String,
      wayAccess6: json['способ_дост_6'] as String,
      wayAccess7: json['способ_дост_7'] as String,
      wayAccess8: json['способ_дост_8'] as String,
      wayAccess9: json['способ_дост_9'] as String,
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
