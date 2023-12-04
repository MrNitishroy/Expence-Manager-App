
class TransactionModel {
  String? id;
  String? date;
  int? amount;
  String? type;
  String? category;
  String? comment;
  String? paymentType;
  String? iconPath;

  TransactionModel({this.id, this.date, this.amount, this.type, this.category, this.comment, this.paymentType, this.iconPath});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    date = json["date"];
    amount = json["amount"];
    type = json["type"];
    category = json["category"];
    comment = json["comment"];
    paymentType = json["paymentType"];
    iconPath = json["iconPath"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["date"] = date;
    _data["amount"] = amount;
    _data["type"] = type;
    _data["category"] = category;
    _data["comment"] = comment;
    _data["paymentType"] = paymentType;
    _data["iconPath"] = iconPath;
    return _data;
  }
}