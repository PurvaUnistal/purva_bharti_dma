import 'package:hive/hive.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/hive_box_name.dart';

part 'get_customer_details_model.g.dart';

@HiveType(typeId: HiveTypeId.CustomerDetailsId)
class CustomerDetailsModel extends HiveObject {
  @HiveField(0)
  String? status;

  @HiveField(1)
  String? firstName;

  @HiveField(2)
  String? lastName;

  @HiveField(3)
  String? address;

  @HiveField(4)
  String? mobileNumber;

  @HiveField(5)
  String? alternateNumber;

  @HiveField(6)
  String? emailId;

  @HiveField(7)
  String? pinCode;

  @HiveField(8)
  String? locality;

  @HiveField(9)
  String? town;

  @HiveField(10)
  String? state;

  @HiveField(11)
  String? applicationNumber;

  @HiveField(12)
  String? society;

  CustomerDetailsModel({
    this.status,
    this.firstName,
    this.lastName,
    this.address,
    this.mobileNumber,
    this.alternateNumber,
    this.emailId,
    this.pinCode,
    this.locality,
    this.town,
    this.state,
    this.applicationNumber,
    this.society,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    return CustomerDetailsModel(
      status: json['status'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      address: json['address'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      alternateNumber: json['alternate_number'] as String?,
      emailId: json['email_id'] as String?,
      pinCode: json['pin_code'] as String?,
      locality: json['locality'] as String?,
      town: json['town'] as String?,
      state: json['state'] as String?,
      applicationNumber: json['application_number'] as String?,
      society: json['society'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
      'mobile_number': mobileNumber,
      'alternate_number': alternateNumber,
      'email_id': emailId,
      'pin_code': pinCode,
      'locality': locality,
      'town': town,
      'state': state,
      'application_number': applicationNumber,
      'society': society,
    };
  }
}