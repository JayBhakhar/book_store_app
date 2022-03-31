class ChooseSupplier {
  String chooseSupplierID;
  num supplierPrice;
  num ourBookID;
  num supplierBookID;
  String supplier;
  num deliveryTime;
  num deliveryCharge;
  String deliveryName;

  ChooseSupplier({
    this.chooseSupplierID,
    this.supplierPrice,
    this.ourBookID,
    this.supplierBookID,
    this.supplier,
    this.deliveryTime,
    this.deliveryCharge,
    this.deliveryName,
  });

  factory ChooseSupplier.fromJson(dynamic json) {
    return ChooseSupplier(
        chooseSupplierID: json['_id'] as String,
        supplierPrice: json['Цена_поставщика'] as num,
        ourBookID: json['id_книги_наш'] as num,
        supplierBookID: json['id_книги_поставщика'] as num,
        supplier: json['поставщик'] as String,
        deliveryTime: json['срок_отправки_поставщика'] as num,
        deliveryCharge: json['delivery_charge'] as num,
        deliveryName: json['delivery_name'] as String);
  }
  static List<ChooseSupplier> listFromJson(list) =>
      List<ChooseSupplier>.from(list.map((x) => ChooseSupplier.fromJson(x)));
}
