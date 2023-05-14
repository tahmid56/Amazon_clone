import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User(
    this.id,
    this.name,
    this.email,
    this.password,
    this.address,
    this.type,
    this.token,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});
    result.addAll({'password': password});
    result.addAll({'address': address});
    result.addAll({'type': type});
    result.addAll({'token': token});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['_id'] ?? '',
      map['name'] ?? '',
      map['email'] ?? '',
      map['password'] ?? '',
      map['address'] ?? '',
      map['type'] ?? '',
      map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      address ?? this.address,
      type ?? this.type,
      token ?? this.token,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password, address: $address, type: $type, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.address == address &&
        other.type == type &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        address.hashCode ^
        type.hashCode ^
        token.hashCode;
  }
}
