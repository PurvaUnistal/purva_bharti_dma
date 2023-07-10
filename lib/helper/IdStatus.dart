class IDStatus {
  int id;


  IDStatus({this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,

    };
    return map;
  }

  IDStatus.fromMap(Map<String, dynamic> map) {
    id = map['id'];

  }
}