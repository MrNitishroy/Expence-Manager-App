import 'package:expense_manager/Models/UserModel.dart';

class GroupModel {
  String? id;
  String? admin;
  String? name;
  int? income;
  int? expense;
  List<UserModel>? members; // Change the type to List<UserModel>

  GroupModel(
      {this.id,
      this.name,
      this.members,
      this.admin,
      this.income,
      this.expense});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];

    // Deserialize "members" into a list of UserModel
    if (json["members"] != null) {
      members = List<UserModel>.from(
        json["members"].map((memberJson) => UserModel.fromJson(memberJson)),
      );
    } else {
      members = [];
    }

    income = json["income"];
    expense = json["expense"];
    admin = json["admin"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["income"] = income;
    if (members != null) {
      _data["members"] = members!.map((member) => member.toJson()).toList();
    }
    _data["expense"] = expense;
    _data["admin"] = admin;
    return _data;
  }
}
