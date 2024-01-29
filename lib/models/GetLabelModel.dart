// To parse this JSON data, do
//
//     final getLabelModel = getLabelModelFromJson(jsonString);

import 'dart:convert';

GetLabelModel getLabelModelFromJson(String str) =>
    GetLabelModel.fromJson(json.decode(str));

String getLabelModelToJson(GetLabelModel data) => json.encode(data.toJson());

class GetLabelModel {
  final Steps steps;
  final Registration registration;
  final Inspection inspection;
  final Photo photo;
  final Kyc kyc;
  final Deposit deposit;
  final Consent consent;
  final Lmc lmc;

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
        "steps": steps.toJson(),
        "registration": registration.toJson(),
        "inspection": inspection.toJson(),
        "photo": photo.toJson(),
        "kyc": kyc.toJson(),
        "deposit": deposit.toJson(),
        "consent": consent.toJson(),
        "lmc": lmc.toJson(),
      };
}

class Consent {
  final String takePhoto;
  final String custBank;
  final String custAcc;
  final String custIfsc;
  final String custBankAdd;
  final String cancelledPhoto;
  final String preferredBilling;
  final String acceptConversionPolicy;
  final String acceptExtraCost;

  Consent({
    this.takePhoto,
    this.custBank,
    this.custAcc,
    this.custIfsc,
    this.custBankAdd,
    this.cancelledPhoto,
    this.preferredBilling,
    this.acceptConversionPolicy,
    this.acceptExtraCost,
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

class Deposit {
  final String depositSta;
  final String modeOfDep;
  final String depositDate;
  final String depositType;
  final String depositAmt;
  final String chqNum;
  final String chqBank;
  final String bankAcc;
  final String chqDate;
  final String chqPhoto;
  final String payStatus;
  final String reason;

  Deposit({
    this.depositSta,
    this.modeOfDep,
    this.depositDate,
    this.depositType,
    this.depositAmt,
    this.chqNum,
    this.chqBank,
    this.bankAcc,
    this.chqDate,
    this.chqPhoto,
    this.payStatus,
    this.reason,
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

class Inspection {
  final String inspectMeter;
  final String inspectRegulator;
  final String inspectOtherFittings;
  final String asPerLmcQty;
  final String customerSatisfication;
  final String conversionAgreement;
  final String photo;
  final String conversionDate;
  final String remarks;
  final String extraPipe;
  final String extraPrice;

  Inspection({
    this.inspectMeter,
    this.inspectRegulator,
    this.inspectOtherFittings,
    this.asPerLmcQty,
    this.customerSatisfication,
    this.conversionAgreement,
    this.photo,
    this.conversionDate,
    this.remarks,
    this.extraPipe,
    this.extraPrice,
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

class Kyc {
  final String uploadDoc1;
  final String uploadDoc1No;
  final String uploadDoc1Front;
  final String uploadDoc1Back;
  final String selectDoc;
  final String uploadDoc2;
  final String uploadDoc2No;
  final String uploadDoc2Front;
  final String uploadDoc2Back;
  final String uploadDoc3;
  final String uploadDoc3No;
  final String uploadDoc3Front;
  final String uploadDoc3Back;

  Kyc({
    this.uploadDoc1,
    this.uploadDoc1No,
    this.uploadDoc1Front,
    this.uploadDoc1Back,
    this.selectDoc,
    this.uploadDoc2,
    this.uploadDoc2No,
    this.uploadDoc2Front,
    this.uploadDoc2Back,
    this.uploadDoc3,
    this.uploadDoc3No,
    this.uploadDoc3Front,
    this.uploadDoc3Back,
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

class Lmc {
  final String feasibilityDate;
  final String proposedDate;
  final String additional;
  final String material;
  final String qty;
  final String regulators;
  final String installation;
  final String feasibility;
  final String workStart;
  final String reasonIfDelay;
  final String reason;
  final String isFeasible;
  final String followUpDate;
  final String meterNumber;
  final String pipe;
  final String fitting;
  final String meterInitialReading;
  final String readingDate;
  final String meterPhoto;
  final String tfNumber;
  final String latitudeTf;
  final String longitudeTf;
  final String latitudeHg;
  final String longitudeHg;
  final String workCompletedDate;
  final String workCompletedImage;
  final String ackDate;
  final String ackImage;
  final String conversionDate;
  final String typeNr;
  final String isCustomerReady;

  Lmc({
    this.feasibilityDate,
    this.proposedDate,
    this.additional,
    this.material,
    this.qty,
    this.regulators,
    this.installation,
    this.feasibility,
    this.workStart,
    this.reasonIfDelay,
    this.reason,
    this.isFeasible,
    this.followUpDate,
    this.meterNumber,
    this.pipe,
    this.fitting,
    this.meterInitialReading,
    this.readingDate,
    this.meterPhoto,
    this.tfNumber,
    this.latitudeTf,
    this.longitudeTf,
    this.latitudeHg,
    this.longitudeHg,
    this.workCompletedDate,
    this.workCompletedImage,
    this.ackDate,
    this.ackImage,
    this.conversionDate,
    this.typeNr,
    this.isCustomerReady,
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

class Photo {
  final String customerPhoto;
  final String homePhoto;

  Photo({
    this.customerPhoto,
    this.homePhoto,
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

class Registration {
  final String area;
  final String lastname;
  final String guardian;
  final String email;
  final String propertyCategory;
  final String propertyClass;
  final String house;
  final String locality;
  final String town;
  final String pincode;
  final String district;
  final String mdpe;
  final String resident;
  final String kitchen;
  final String bathroom;
  final String fuel;
  final String family;
  final String location;
  final String long;
  final String lat;
  final String getLoc;
  final String remarks;
  final String submit;
  final String guardianType;

  Registration({
    this.area,
    this.lastname,
    this.guardian,
    this.email,
    this.propertyCategory,
    this.propertyClass,
    this.house,
    this.locality,
    this.town,
    this.pincode,
    this.district,
    this.mdpe,
    this.resident,
    this.kitchen,
    this.bathroom,
    this.fuel,
    this.family,
    this.location,
    this.long,
    this.lat,
    this.getLoc,
    this.remarks,
    this.submit,
    this.guardianType,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
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

class Steps {
  final String reg;
  final String kyc;
  final String photo;
  final String consent;
  final String deposit;
  final String step1;
  final String step2;
  final String step3;
  final String step4;
  final String step5;
  final String mobile;
  final String firstname;
  final String middlename;
  final String lastname;
  final String button;
  final String fromDate;
  final String toDate;
  final String minAmt;
  final String maxAmt;
  final String stepsIf;
  final String stepsIs;
  final String then;
  final String amount;
  final String back;
  final String condition;
  final String type;

  Steps({
    this.reg,
    this.kyc,
    this.photo,
    this.consent,
    this.deposit,
    this.step1,
    this.step2,
    this.step3,
    this.step4,
    this.step5,
    this.mobile,
    this.firstname,
    this.middlename,
    this.lastname,
    this.button,
    this.fromDate,
    this.toDate,
    this.minAmt,
    this.maxAmt,
    this.stepsIf,
    this.stepsIs,
    this.then,
    this.amount,
    this.back,
    this.condition,
    this.type,
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
