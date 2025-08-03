class Products {
  String id;
  int Index;
  String Name;
  String Description;
  String Brand;
  String Category;
  int Price;
  String Currency;
  int Stock;
  int EAN;
  String Color;
  String Size;
  String Availability;
  int internalId;

  Products(
    this.id,
    this.Index,
    this.Name,
    this.Description,
    this.Brand,
    this.Category,
    this.Price,
    this.Currency,
    this.Stock,
    this.EAN,
    this.Color,
    this.Size,
    this.Availability,
    this.internalId
  );

  Map<String, dynamic> toMap() {
    return {
      "Index": Index,
      "Name": Name,
      "Description": Description,
      "Brand": Brand,
      "Category": Category,
      "Price": Price,
      "Currency": Currency,
      "Stock": Stock,
      "EAN": EAN,
      "Color": Color,
      "Size": Size,
      "Availability": Availability,
      "Internal ID":internalId
    };
  }

  static Products fromMap(String id, Map<String, dynamic> map) {
    return Products(
      id,
      map['Index'] ?? 0,
      map['Name'] ?? "",
      map['Description'] ?? "",
      map['Brand'] ?? "",
      map['Category'] ?? "",
      map['Price'] ?? 0,
      map['Currency'] ?? "",
      map['Stock'] ?? 0,
      map['EAN'] ?? 0,
      map['Color'] ?? "",
      map['Size'] ?? "",
      map['Availability'] ?? "",
      map['Internal ID']??0,
    );
  }
}
