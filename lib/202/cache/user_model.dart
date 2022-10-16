class User {
  String? name;
  String? description;
  String? url;

  User(this.name, this.description, this.url);

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['url'] = this.url;
    return data;
  }
}