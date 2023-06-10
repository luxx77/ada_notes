class ProductModal {
  ProductModal({this.description, this.id, this.number, this.count, this.date});
  String? description;
  int? id;
  int? count;
  String? number;
  String? date;

  Map<String, Object> toMap() {
    return {
      'id': id!,
      'num': number!,
      'count': count!,
      'date': date!,
      'des': description!
    };
  }

  factory ProductModal.fromMap(Map<dynamic, dynamic> map) {
  
    return ProductModal(
      id: map['id']?.toInt() ?? 0,
      count: map['count'] ?? '',
      date: map['date'] ?? '',
      description: map['des'] ?? '',
      number: map['num'],
    );
  }
}
