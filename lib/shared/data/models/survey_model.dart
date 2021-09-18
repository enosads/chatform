class Survey {
  String? id;
  String name;
  String createdAt;
  String city;
  String birthDate;
  double rate;

  Survey({
    this.id,
    required this.name,
    required this.createdAt,
    required this.birthDate,
    required this.city,
    required this.rate,
  });

  Survey.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        createdAt = map['createdAt'],
        city = map['city'],
        birthDate = map['birthDate'],
        rate = double.parse(map['rate'].toString());

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'city': city,
        'createdAt': createdAt,
        'birthDate': birthDate,
        'rate': rate,
      };
}
