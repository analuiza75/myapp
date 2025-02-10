class Address {
  late String state;
  late String city;

  Address({
  required this.state,
    required this.city,
  });

  Address.fromJson(Map<String, dynamic> json) {
    state = json['state'] ?? '';
    city = json['city'] ?? '';

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['city'] = this.city;

    return data;
  }
}