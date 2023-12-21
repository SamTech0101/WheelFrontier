// componnets are for deciding which parts o the app is accesible by the current user
// and is part of the user class

class Component {
  int id;
  String componentName;
  int componentId;
  int index;
  String createdAt;
  String updatedAt;
  int frkComponentCategory;
  ComponentCategory componentCategory;

  Component(
      {this.id,
      this.componentName,
      this.componentId,
      this.index,
      this.createdAt,
      this.updatedAt,
      this.frkComponentCategory,
      this.componentCategory});

  Component.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    componentName = json['componentName'];
    componentId = json['componentId'];
    index = json['index'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    frkComponentCategory = json['frk_ComponentCategory'];
    componentCategory = json['ComponentCategory'] != null
        ? ComponentCategory.fromJson(json['ComponentCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['componentName'] = this.componentName;
    data['componentId'] = this.componentId;
    data['index'] = this.index;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['frk_ComponentCategory'] = this.frkComponentCategory;
    if (this.componentCategory != null) {
      data['ComponentCategory'] = this.componentCategory.toJson();
    }
    return data;
  }
}

class ComponentCategory {
  int id;
  String name;
  String createdAt;
  String updatedAt;

  ComponentCategory({this.id, this.name, this.createdAt, this.updatedAt});

  ComponentCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
