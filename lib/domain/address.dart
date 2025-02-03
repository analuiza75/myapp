class Address {
  late String cities;

  Address({
    required this.cities,

  });

  Address.fromJson(Map<String, dynamic> json) {
    cities = json['cities'] ?? '';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cities'] = this.cities;


    return data;
  }
}