
class TransactionModel {
  String? id;
  String? date;
  String? time;
  int? amount;
  String? paymentType;
  String? category;
  String? comment;
  bool? isIncome;
  String? iconPath;

  TransactionModel(
      {this.id,
      this.date,
      this.time,
      this.amount,
      this.paymentType,
      this.category,
      this.isIncome,
      this.comment,
      this.iconPath});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    date = json["date"];
    date = json["time"];
    amount = json["amount"];
    paymentType = json["paymentType"];
    category = json["category"];
    comment = json["comment"];
    isIncome = json["isIncome"];
    iconPath = json["iconPath"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["date"] = date;
    _data["time"] = time;
    _data["amount"] = amount;
    _data["paymentType"] = paymentType;
    _data["category"] = category;
    _data["comment"] = comment;
    _data["isIncome"] = isIncome;
    _data["iconPath"] = iconPath;
    return _data;
  }
}
