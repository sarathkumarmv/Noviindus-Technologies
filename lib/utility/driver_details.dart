class DriverDetails {
  DriverDetails({
    required this.status,
    required this.driverListApi,
  });

  bool status;
  List<DriverListApi> driverListApi;

  factory DriverDetails.fromJson(Map<String, dynamic> json) => DriverDetails(
    status: json["status"],
    driverListApi: List<DriverListApi>.from(
        json["driver_list"].map((x) => DriverListApi.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "driver_list": List<dynamic>.from(driverListApi.map((x) => x.toJson())),
  };
}

class DriverListApi {
  DriverListApi({
    required this.id,
    required this.name,
    required this.mobile,
    required this.license,
  });

  int id;
  String name;
  String mobile;
  String license;

  factory DriverListApi.fromJson(Map<String, dynamic> json) => DriverListApi(
    id: json["id"] ?? 0,
    name: json["name"] ?? 'name',
    mobile: json["mobile"] ?? '',
    license: json["license"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "license": license,
  };
}