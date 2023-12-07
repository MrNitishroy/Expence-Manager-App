
class DropDownModel {
  String? name;
  String? value;
  String? icon;

  DropDownModel({this.name, this.value,this.icon});

  DropDownModel.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    icon = json["icon"];
    value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["value"] = value;
    _data["icon"] = icon;
    return _data;
  }
}

