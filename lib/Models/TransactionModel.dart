class TransactionModel {
  String? id;
  DateTime? timestamp; // Add timestamp field
  String? date;
  String? time;
  int? amount;
  String? paymentType;
  String? category;
  String? comment;
  bool? isIncome;
  String? iconPath;
  String? location;
  String? createdBy;

  TransactionModel({
    this.id,
    this.timestamp,
    this.date,
    this.time,
    this.amount,
    this.paymentType,
    this.category,
    this.comment,
    this.isIncome,
    this.iconPath,
    this.location,
    this.createdBy,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    timestamp = json["timestamp"] != null
        ? DateTime.fromMillisecondsSinceEpoch(json["timestamp"])
        : null;
    date = json["date"];
    time = json["time"];
    amount = json["amount"];
    paymentType = json["paymentType"];
    category = json["category"];
    comment = json["comment"];
    isIncome = json["isIncome"];
    iconPath = json["iconPath"];
    location = json["location"];
    createdBy = json["createdBy"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["timestamp"] = timestamp?.millisecondsSinceEpoch;
    _data["date"] = date;
    _data["time"] = time;
    _data["amount"] = amount;
    _data["paymentType"] = paymentType;
    _data["category"] = category;
    _data["comment"] = comment;
    _data["isIncome"] = isIncome;
    _data["iconPath"] = iconPath;
    _data["location"] = location;
    _data["createdBy"] = createdBy;
    return _data;
  }
}
