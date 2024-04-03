// To parse this JSON data, do
//
//     final getLabelModel = getLabelModelFromJson(jsonString);

import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_label_model.g.dart';
GetLabelModel getLabelModelFromJson(String str) => GetLabelModel.fromJson(json.decode(str));

String getLabelModelToJson(GetLabelModel data) => json.encode(data.toJson());

@HiveType(typeId: HiveTypeId.GetLabelId)

class GetLabelModel {
  final Steps? steps;
  final Registration? registration;
  final Inspection? inspection;
  final Photo? photo;
  final Kyc? kyc;
  final Deposit? deposit;
  final Consent? consent;
  final Lmc? lmc;

  GetLabelModel({
    this.steps,
    this.registration,
    this.inspection,
    this.photo,
    this.kyc,
    this.deposit,
    this.consent,
    this.lmc,
  });

  factory GetLabelModel.fromJson(Map<String, dynamic> json) => GetLabelModel(
        steps: Steps.fromJson(json["steps"]),
        registration: Registration.fromJson(json["registration"]),
        inspection: Inspection.fromJson(json["inspection"]),
        photo: Photo.fromJson(json["photo"]),
        kyc: Kyc.fromJson(json["kyc"]),
        deposit: Deposit.fromJson(json["deposit"]),
        consent: Consent.fromJson(json["consent"]),
        lmc: Lmc.fromJson(json["lmc"]),
      );

  Map<String, dynamic> toJson() => {
        "steps": steps!.toJson(),
        "registration": registration!.toJson(),
        "inspection": inspection!.toJson(),
        "photo": photo!.toJson(),
        "kyc": kyc!.toJson(),
        "deposit": deposit!.toJson(),
        "consent": consent!.toJson(),
        "lmc": lmc!.toJson(),
      };
}

@HiveType(typeId: HiveTypeId.ConsentId)

class Consent {
  @HiveField(0)
  final String takePhoto;
  @HiveField(1)
  final String custBank;
  @HiveField(2)
  final String custAcc;
  @HiveField(3)
  final String custIfsc;
  @HiveField(4)
  final String custBankAdd;
  @HiveField(5)
  final String cancelledPhoto;
  @HiveField(6)
  final String preferredBilling;
  @HiveField(7)
  final String acceptConversionPolicy;
  @HiveField(8)
  final String acceptExtraCost;

  Consent({
    required this.takePhoto,
    required this.custBank,
    required this.custAcc,
    required this.custIfsc,
    required this.custBankAdd,
    required this.cancelledPhoto,
    required this.preferredBilling,
    required this.acceptConversionPolicy,
    required this.acceptExtraCost,
  });

  factory Consent.fromJson(Map<String, dynamic> json) => Consent(
        takePhoto: json["take_photo"],
        custBank: json["cust_bank"],
        custAcc: json["cust_acc"],
        custIfsc: json["cust_ifsc"],
        custBankAdd: json["cust_bank_add"],
        cancelledPhoto: json["cancelled_photo"],
        preferredBilling: json["preferred_billing"],
        acceptConversionPolicy: json["accept_conversion_policy"],
        acceptExtraCost: json["accept_extra_cost"],
      );

  Map<String, dynamic> toJson() => {
        "take_photo": takePhoto,
        "cust_bank": custBank,
        "cust_acc": custAcc,
        "cust_ifsc": custIfsc,
        "cust_bank_add": custBankAdd,
        "cancelled_photo": cancelledPhoto,
        "preferred_billing": preferredBilling,
        "accept_conversion_policy": acceptConversionPolicy,
        "accept_extra_cost": acceptExtraCost,
      };
}

@HiveType(typeId: HiveTypeId.DepositId)

class Deposit {
  @HiveField(0)
  final String depositSta;
  @HiveField(1)
  final String modeOfDep;
  @HiveField(2)
  final String depositDate;
  @HiveField(3)
  final String depositType;
  @HiveField(4)
  final String depositAmt;
  @HiveField(5)
  final String chqNum;
  @HiveField(6)
  final String chqBank;
  @HiveField(7)
  final String bankAcc;
  @HiveField(8)
  final String chqDate;
  @HiveField(9)
  final String chqPhoto;
  @HiveField(10)
  final String payStatus;
  @HiveField(11)
  final String reason;

  Deposit({
    required this.depositSta,
    required this.modeOfDep,
    required this.depositDate,
    required this.depositType,
    required this.depositAmt,
    required this.chqNum,
    required this.chqBank,
    required this.bankAcc,
    required this.chqDate,
    required this.chqPhoto,
    required this.payStatus,
    required this.reason,
  });

  factory Deposit.fromJson(Map<String, dynamic> json) => Deposit(
        depositSta: json["deposit_sta"],
        modeOfDep: json["mode_of_dep"],
        depositDate: json["deposit_date"],
        depositType: json["deposit_type"],
        depositAmt: json["deposit_amt"],
        chqNum: json["chq_num"],
        chqBank: json["chq_bank"],
        bankAcc: json["bank_acc"],
        chqDate: json["chq_date"],
        chqPhoto: json["chq_photo"],
        payStatus: json["pay_status"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "deposit_sta": depositSta,
        "mode_of_dep": modeOfDep,
        "deposit_date": depositDate,
        "deposit_type": depositType,
        "deposit_amt": depositAmt,
        "chq_num": chqNum,
        "chq_bank": chqBank,
        "bank_acc": bankAcc,
        "chq_date": chqDate,
        "chq_photo": chqPhoto,
        "pay_status": payStatus,
        "reason": reason,
      };
}

@HiveType(typeId: HiveTypeId.InspectionId)

class Inspection {
  @HiveField(0)
  final String inspectMeter;
  @HiveField(1)
  final String extraPrice;
  @HiveField(2)
  final String inspectRegulator;
  @HiveField(3)
  final String inspectOtherFittings;
  @HiveField(4)
  final String asPerLmcQty;
  @HiveField(5)
  final String customerSatisfication;
  @HiveField(6)
  final String conversionAgreement;
  @HiveField(7)
  final String photo;
  @HiveField(8)
  final String conversionDate;
  @HiveField(9)
  final String remarks;
  @HiveField(10)
  final String extraPipe;


  Inspection({
    required this.inspectMeter,
    required this.inspectRegulator,
    required this.inspectOtherFittings,
    required this.asPerLmcQty,
    required this.customerSatisfication,
    required this.conversionAgreement,
    required this.photo,
    required this.conversionDate,
    required this.remarks,
    required this.extraPipe,
    required this.extraPrice,
  });

  factory Inspection.fromJson(Map<String, dynamic> json) => Inspection(
        inspectMeter: json["inspect_meter"],
        inspectRegulator: json["inspect_regulator"],
        inspectOtherFittings: json["inspect_other_fittings"],
        asPerLmcQty: json["as_per_lmc_qty"],
        customerSatisfication: json["customer_satisfication"],
        conversionAgreement: json["conversion_agreement"],
        photo: json["photo"],
        conversionDate: json["conversion_date"],
        remarks: json["remarks"],
        extraPipe: json["extra_pipe"],
        extraPrice: json["extra_price"],
      );

  Map<String, dynamic> toJson() => {
        "inspect_meter": inspectMeter,
        "inspect_regulator": inspectRegulator,
        "inspect_other_fittings": inspectOtherFittings,
        "as_per_lmc_qty": asPerLmcQty,
        "customer_satisfication": customerSatisfication,
        "conversion_agreement": conversionAgreement,
        "photo": photo,
        "conversion_date": conversionDate,
        "remarks": remarks,
        "extra_pipe": extraPipe,
        "extra_price": extraPrice,
      };
}

@HiveType(typeId: HiveTypeId.KycId)

class Kyc {
  @HiveField(0)
  final String uploadDoc1;
  @HiveField(1)
  final String uploadDoc1No;
  @HiveField(2)
  final String uploadDoc1Front;
  @HiveField(3)
  final String uploadDoc1Back;
  @HiveField(4)
  final String selectDoc;
  @HiveField(5)
  final String uploadDoc2;
  @HiveField(6)
  final String uploadDoc2No;
  @HiveField(7)
  final String uploadDoc2Front;
  @HiveField(8)
  final String uploadDoc2Back;
  @HiveField(9)
  final String uploadDoc3;
  @HiveField(10)
  final String uploadDoc3No;
  @HiveField(11)
  final String uploadDoc3Front;
  @HiveField(12)
  final String uploadDoc3Back;

  Kyc({
    required this.uploadDoc1,
    required this.uploadDoc1No,
    required this.uploadDoc1Front,
    required this.uploadDoc1Back,
    required this.selectDoc,
    required this.uploadDoc2,
    required this.uploadDoc2No,
    required this.uploadDoc2Front,
    required this.uploadDoc2Back,
    required this.uploadDoc3,
    required this.uploadDoc3No,
    required this.uploadDoc3Front,
    required this.uploadDoc3Back,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => Kyc(
        uploadDoc1: json["uploadDoc1"],
        uploadDoc1No: json["uploadDoc1No"],
        uploadDoc1Front: json["uploadDoc1Front"],
        uploadDoc1Back: json["uploadDoc1Back"],
        selectDoc: json["selectDoc"],
        uploadDoc2: json["uploadDoc2"],
        uploadDoc2No: json["uploadDoc2No"],
        uploadDoc2Front: json["uploadDoc2Front"],
        uploadDoc2Back: json["uploadDoc2Back"],
        uploadDoc3: json["uploadDoc3"],
        uploadDoc3No: json["uploadDoc3No"],
        uploadDoc3Front: json["uploadDoc3Front"],
        uploadDoc3Back: json["uploadDoc3Back"],
      );

  Map<String, dynamic> toJson() => {
        "uploadDoc1": uploadDoc1,
        "uploadDoc1No": uploadDoc1No,
        "uploadDoc1Front": uploadDoc1Front,
        "uploadDoc1Back": uploadDoc1Back,
        "selectDoc": selectDoc,
        "uploadDoc2": uploadDoc2,
        "uploadDoc2No": uploadDoc2No,
        "uploadDoc2Front": uploadDoc2Front,
        "uploadDoc2Back": uploadDoc2Back,
        "uploadDoc3": uploadDoc3,
        "uploadDoc3No": uploadDoc3No,
        "uploadDoc3Front": uploadDoc3Front,
        "uploadDoc3Back": uploadDoc3Back,
      };
}

@HiveType(typeId: HiveTypeId.LmcId)

class Lmc {
  @HiveField(0)
  final String feasibilityDate;
  @HiveField(1)
  final String proposedDate;
  @HiveField(2)
  final String additional;
  @HiveField(3)
  final String material;
  @HiveField(4)
  final String qty;
  @HiveField(5)
  final String regulators;
  @HiveField(6)
  final String installation;
  @HiveField(7)
  final String feasibility;
  @HiveField(8)
  final String workStart;
  @HiveField(9)
  final String reasonIfDelay;
  @HiveField(10)
  final String reason;
  @HiveField(11)
  final String isFeasible;
  @HiveField(12)
  final String followUpDate;
  @HiveField(13)
  final String meterNumber;
  @HiveField(14)
  final String pipe;
  @HiveField(15)
  final String fitting;
  @HiveField(16)
  final String meterInitialReading;
  @HiveField(17)
  final String readingDate;
  @HiveField(18)
  final String meterPhoto;
  @HiveField(19)
  final String tfNumber;
  @HiveField(20)
  final String latitudeTf;
  @HiveField(21)
  final String longitudeTf;
  @HiveField(22)
  final String latitudeHg;
  @HiveField(23)
  final String longitudeHg;
  @HiveField(24)
  final String workCompletedDate;
  @HiveField(25)
  final String workCompletedImage;
  @HiveField(26)
  final String ackDate;
  @HiveField(27)
  final String ackImage;
  @HiveField(28)
  final String conversionDate;
  @HiveField(29)
  final String typeNr;
  @HiveField(30)
  final String isCustomerReady;

  Lmc({
    required this.feasibilityDate,
    required this.proposedDate,
    required this.additional,
    required this.material,
    required this.qty,
    required this.regulators,
    required this.installation,
    required this.feasibility,
    required this.workStart,
    required this.reasonIfDelay,
    required this.reason,
    required this.isFeasible,
    required this.followUpDate,
    required this.meterNumber,
    required this.pipe,
    required this.fitting,
    required this.meterInitialReading,
    required this.readingDate,
    required this.meterPhoto,
    required this.tfNumber,
    required this.latitudeTf,
    required this.longitudeTf,
    required this.latitudeHg,
    required this.longitudeHg,
    required this.workCompletedDate,
    required this.workCompletedImage,
    required this.ackDate,
    required this.ackImage,
    required this.conversionDate,
    required this.typeNr,
    required this.isCustomerReady,
  });

  factory Lmc.fromJson(Map<String, dynamic> json) => Lmc(
        feasibilityDate: json["feasibility_date"],
        proposedDate: json["proposed_date"],
        additional: json["additional"],
        material: json["material"],
        qty: json["qty"],
        regulators: json["regulators"],
        installation: json["installation"],
        feasibility: json["feasibility"],
        workStart: json["work_start"],
        reasonIfDelay: json["reason_if_delay"],
        reason: json["reason"],
        isFeasible: json["is_feasible"],
        followUpDate: json["follow_up_date"],
        meterNumber: json["meter_number"],
        pipe: json["pipe"],
        fitting: json["fitting"],
        meterInitialReading: json["meter_initial_reading"],
        readingDate: json["reading_date"],
        meterPhoto: json["meter_photo"],
        tfNumber: json["tf_number"],
        latitudeTf: json["latitude_tf"],
        longitudeTf: json["longitude_tf"],
        latitudeHg: json["latitude_hg"],
        longitudeHg: json["longitude_hg"],
        workCompletedDate: json["work_completed_date"],
        workCompletedImage: json["work_completed_image"],
        ackDate: json["ack_date"],
        ackImage: json["ack_image"],
        conversionDate: json["conversion_date"],
        typeNr: json["typeNr"],
        isCustomerReady: json["is_customer_ready"],
      );

  Map<String, dynamic> toJson() => {
        "feasibility_date": feasibilityDate,
        "proposed_date": proposedDate,
        "additional": additional,
        "material": material,
        "qty": qty,
        "regulators": regulators,
        "installation": installation,
        "feasibility": feasibility,
        "work_start": workStart,
        "reason_if_delay": reasonIfDelay,
        "reason": reason,
        "is_feasible": isFeasible,
        "follow_up_date": followUpDate,
        "meter_number": meterNumber,
        "pipe": pipe,
        "fitting": fitting,
        "meter_initial_reading": meterInitialReading,
        "reading_date": readingDate,
        "meter_photo": meterPhoto,
        "tf_number": tfNumber,
        "latitude_tf": latitudeTf,
        "longitude_tf": longitudeTf,
        "latitude_hg": latitudeHg,
        "longitude_hg": longitudeHg,
        "work_completed_date": workCompletedDate,
        "work_completed_image": workCompletedImage,
        "ack_date": ackDate,
        "ack_image": ackImage,
        "conversion_date": conversionDate,
        "typeNr": typeNr,
        "is_customer_ready": isCustomerReady,
      };
}


@HiveType(typeId: HiveTypeId.PhotoId)

class Photo {
  @HiveField(0)
  final String customerPhoto;
  @HiveField(1)
  final String homePhoto;

  Photo({
    required this.customerPhoto,
    required this.homePhoto,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        customerPhoto: json["customer_photo"],
        homePhoto: json["home_photo"],
      );

  Map<String, dynamic> toJson() => {
        "customer_photo": customerPhoto,
        "home_photo": homePhoto,
      };
}

@HiveType(typeId: HiveTypeId.RegistrationId)

class Registration {
  @HiveField(0)
  final String registrationType;
  @HiveField(1)
  final String chargeArea;
  @HiveField(2)
  final String area;
  @HiveField(3)
  final String lastname;
  @HiveField(4)
  final String guardian;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final String propertyCategory;
  @HiveField(7)
  final String propertyClass;
  @HiveField(8)
  final String house;
  @HiveField(9)
  final String locality;
  @HiveField(10)
  final String town;
  @HiveField(11)
  final String pincode;
  @HiveField(12)
  final String district;
  @HiveField(13)
  final String mdpe;
  @HiveField(14)
  final String resident;
  @HiveField(15)
  final String kitchen;
  @HiveField(16)
  final String bathroom;
  @HiveField(17)
  final String fuel;
  @HiveField(18)
  final String family;
  @HiveField(19)
  final String location;
  @HiveField(20)
  final String long;
  @HiveField(21)
  final String lat;
  @HiveField(22)
  final String getLoc;
  @HiveField(23)
  final String remarks;
  @HiveField(24)
  final String submit;
  @HiveField(25)
  final String guardianType;

  Registration({
    required this.registrationType,
    required this.chargeArea,
    required this.area,
    required this.lastname,
    required this.guardian,
    required this.email,
    required this.propertyCategory,
    required this.propertyClass,
    required this.house,
    required this.locality,
    required this.town,
    required this.pincode,
    required this.district,
    required this.mdpe,
    required this.resident,
    required this.kitchen,
    required this.bathroom,
    required this.fuel,
    required this.family,
    required this.location,
    required this.long,
    required this.lat,
    required this.getLoc,
    required this.remarks,
    required this.submit,
    required this.guardianType,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
    registrationType: json["registrationtype"],
    chargeArea: json["chargearea"],
        area: json["area"],
        lastname: json["lastname"],
        guardian: json["guardian"],
        email: json["email"],
        propertyCategory: json["property_category"],
        propertyClass: json["property_class"],
        house: json["house"],
        locality: json["locality"],
        town: json["town"],
        pincode: json["pincode"],
        district: json["district"],
        mdpe: json["mdpe"],
        resident: json["resident"],
        kitchen: json["kitchen"],
        bathroom: json["bathroom"],
        fuel: json["fuel"],
        family: json["family"],
        location: json["location"],
        long: json["long"],
        lat: json["lat"],
        getLoc: json["getLoc"],
        remarks: json["remarks"],
        submit: json["submit"],
        guardianType: json["guardian_type"],
      );

  Map<String, dynamic> toJson() => {
        "registrationtype": registrationType,
        "chargearea": chargeArea,
        "area": area,
        "lastname": lastname,
        "guardian": guardian,
        "email": email,
        "property_category": propertyCategory,
        "property_class": propertyClass,
        "house": house,
        "locality": locality,
        "town": town,
        "pincode": pincode,
        "district": district,
        "mdpe": mdpe,
        "resident": resident,
        "kitchen": kitchen,
        "bathroom": bathroom,
        "fuel": fuel,
        "family": family,
        "location": location,
        "long": long,
        "lat": lat,
        "getLoc": getLoc,
        "remarks": remarks,
        "submit": submit,
        "guardian_type": guardianType,
      };
}

@HiveType(typeId: HiveTypeId.StepsId)

class Steps {
  @HiveField(0)
  final String reg;
  @HiveField(1)
  final String kyc;
  @HiveField(2)
  final String photo;
  @HiveField(3)
  final String consent;
  @HiveField(4)
  final String deposit;
  @HiveField(5)
  final String step1;
  @HiveField(6)
  final String step2;
  @HiveField(7)
  final String step3;
  @HiveField(8)
  final String step4;
  @HiveField(9)
  final String step5;
  @HiveField(10)
  final String mobile;
  @HiveField(11)
  final String firstname;
  @HiveField(12)
  final String middlename;
  @HiveField(13)
  final String lastname;
  @HiveField(14)
  final String button;
  @HiveField(15)
  final String fromDate;
  @HiveField(16)
  final String toDate;
  @HiveField(17)
  final String minAmt;
  @HiveField(18)
  final String maxAmt;
  @HiveField(19)
  final String stepsIf;
  @HiveField(20)
  final String stepsIs;
  @HiveField(21)
  final String then;
  @HiveField(22)
  final String amount;
  @HiveField(23)
  final String back;
  @HiveField(24)
  final String condition;
  @HiveField(25)
  final String type;

  Steps({
    required this.reg,
    required this.kyc,
    required this.photo,
    required this.consent,
    required this.deposit,
    required this.step1,
    required this.step2,
    required this.step3,
    required this.step4,
    required this.step5,
    required this.mobile,
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.button,
    required this.fromDate,
    required this.toDate,
    required this.minAmt,
    required this.maxAmt,
    required this.stepsIf,
    required this.stepsIs,
    required this.then,
    required this.amount,
    required this.back,
    required this.condition,
    required this.type,
  });

  factory Steps.fromJson(Map<String, dynamic> json) => Steps(
        reg: json["reg"],
        kyc: json["kyc"],
        photo: json["photo"],
        consent: json["consent"],
        deposit: json["deposit"],
        step1: json["step1"],
        step2: json["step2"],
        step3: json["step3"],
        step4: json["step4"],
        step5: json["step5"],
        mobile: json["mobile"],
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        button: json["button"],
        fromDate: json["from_date"],
        toDate: json["to_date"],
        minAmt: json["min_amt"],
        maxAmt: json["max_amt"],
        stepsIf: json["if"],
        stepsIs: json["is"],
        then: json["then"],
        amount: json["amount"],
        back: json["back"],
        condition: json["condition"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "reg": reg,
        "kyc": kyc,
        "photo": photo,
        "consent": consent,
        "deposit": deposit,
        "step1": step1,
        "step2": step2,
        "step3": step3,
        "step4": step4,
        "step5": step5,
        "mobile": mobile,
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "button": button,
        "from_date": fromDate,
        "to_date": toDate,
        "min_amt": minAmt,
        "max_amt": maxAmt,
        "if": stepsIf,
        "is": stepsIs,
        "then": then,
        "amount": amount,
        "back": back,
        "condition": condition,
        "type": type,
      };
}
