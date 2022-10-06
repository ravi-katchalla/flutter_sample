class PhoneNumberRegisteredReponse {
  Data? data;
  bool? hasData;
  bool? hasError;

  PhoneNumberRegisteredReponse({this.data, this.hasData, this.hasError});

  factory PhoneNumberRegisteredReponse.fromJson(Map<dynamic, dynamic> json) =>
      PhoneNumberRegisteredReponse(
        data: Data.fromJson(json['data']),
        hasData: json['hasData'],
        hasError: json['hasError'],
      );

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> response = Map<dynamic, dynamic>();
    response['data'] = data;
    response['hasData'] = hasData;
    response['haserror'] = hasError;
    return response;
  }
}

class Data {
  late bool isRegistered;

  Data({required this.isRegistered});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isRegistered: json["isRegistered"],
      );
}
