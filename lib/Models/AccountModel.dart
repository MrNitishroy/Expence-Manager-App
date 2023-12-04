
class AccountModel {
  String? id;
  String? name;
  int? income;
  int? expense;
  int? total;
  String? date;
  String? time;

  AccountModel({this.id, this.name, this.income, this.expense, this.total, this.date, this.time});

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    income = json["income"];
    expense = json["expense"];
    total = json["total"];
    date = json["date"];
    time = json["time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["income"] = income;
    _data["expense"] = expense;
    _data["total"] = total;
    _data["date"] = date;
    _data["time"] = time;
    return _data;
  }
}