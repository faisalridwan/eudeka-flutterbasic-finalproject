class User {  int _id;  String _name;  String _username;  String _password;  // konstruktor versi 1  User( this._username, this._password);  // konstruktor versi 2: konversi dari Map ke Contact  User.fromMap(Map<String, dynamic> map) {    this._id = map['id'];    this._name = map['name'];    this._username = map['username'];    this._password = map['password'];  }  //getter dan setter (mengambil dan mengisi data kedalam object)  // getter  int get id => _id;  String get name => _name;  String get username => _username;  String get password => _password;  // setter  set id(int value) {    _id = value;  }  set name(String value) {    _name = value;  }  set username(String value) {    _username = value;  }  set password(String value) {    _password = value;  }  // konversi dari Contact ke Map  Map<String, dynamic> toMap() {    Map<String, dynamic> map = Map<String, dynamic>();    map['id'] = this._id;    map['name'] = name;    map['username'] = username;    map['password'] = password;    return map;  }}