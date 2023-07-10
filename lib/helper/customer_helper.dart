import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
final String customerTable = 'customerTable';
final String idColumn = 'idColumn';
final String interestedColumn = 'interestedColumn';

final String phoneColumn = 'phoneColumn';
final String imgColumn = 'imgColumn';
final String  firstnameColumn  = 'firstnameColumn';
final String middlenameColumn = 'middlenameColumn';
final String lastnameColumn = 'lastnameColumn';

final String areaColumn = 'areaColumn';

final String guardianFatherColumn = 'guardianColumn';
final String guardianNameColumn = 'guardianNameColumn';
final String guardianEmailColumn = 'guardianEmailColumn';

final String propertyCategoryColumn = 'propertyCategoryColumn';
final String propertyClassColumn = 'propertyClassColumn';
final String houseNumberColumn = 'houseNumberColumn';
final String localityColumn = 'localityColumn';
final String townColumn = 'townColumn';
final String pinCodeColumn = 'pinCodeColumn';
final String districtCodeColumn = 'districtCodeColumn';
final String MDPEAllowColumn = 'MDPEAllowColumn';
final String ResidentStatusColumn = 'ResidentStatusColumn';
final String numberKitchanStatusColumn = 'numberKitchanStatusColumn';
final String numberBathroomStatusColumn = 'numberBathroomStatusColumn';
final String exitingCookingColumn = 'exitingCookingColumn';
final String reasonColumn = 'reasonColumn';
final String familyMemberColumn = 'familyMemberColumn';
final String latColumn = 'latColumn';
final String logColumn = 'logColumn';
final String remarksColumn = 'remarksColumn';
final String idAdaharColumn = 'idAdaharColumn';
final String idProofNoColumn = 'idProofNoColumn';
final String idProofFrontPath = 'idProofFrontPath';
final String idProofFrontLNamePath = 'idProofFrontLNamePath';
final String idProofBackPath = 'idProofBackPath';
final String idProofBackLNamePath = 'idProofBackLNamePath';
final String electricBillColumn= 'electricBillColumn';
final String OwnerShipProofColumn= 'OwnerShipProofColumn';
final String docOwenerIDColumn= 'docOwenerIDColumn';
final String docproofnoColumn= 'docproofnoColumn';
final String dofrontPathColumn= 'dofrontPathColumn';
final String dofrontPathLNameColumn= 'dofrontPathLNameColumn';
final String docBackPathColumn= 'docBackPathColumn';
final String docBackPathLastNameColumn= 'docBackPathLastNameColumn';
final String doccoverLNamePhotoColumn= 'doccoverLNamePhotoColumn';
final String docbillingModeColumn= 'docbillingModeColumn';
final String docCustomerBankColumn= 'docCustomerBankColumn';
final String docCustomerAccountColumn= 'docCustomerAccountColumn';
final String docCustomerIFSCCodeColumn= 'docCustomerIFSCCodeColumn';
final String docCustomerBankAddress= 'docCustomerBankAddress';
final String docCustomerAcceptRedioPolicy ='docCustomerAcceptRedioPolicy';
final String docextrafittingRedioPolicy ='docextrafittingRedioPolicy';
final String imgCancelPath ='imgCancelPath';
final String imgCancelPathLastName ='imgCancelPathLastName';
final String depositeStatus ='depositeStatus';
final String ModeOfdeposite ='ModeOfdeposite';
final String deposite_type ='deposite_type';
final String deposite_amount ='deposite_amount';
final String checkNumber ='checkNumber';
final String checkDate ='checkDate';
final String customerbankName ='customerbankName';
final String chequeBankAccountNumber ='customerBankAccountNumber';
final String imagechequePhoto ='chequePhoto';
final String imagechequeLastNamePhoto ='imagechequeLastNamePhoto';
final String DateAndTime ='DateAndTime';

//final String reasonColumn = 'reasonColumn';
class CustomerHelper {
  static final CustomerHelper _instance = CustomerHelper.internal();
  factory CustomerHelper() => _instance;
  CustomerHelper.internal();
  Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }
    Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'customernew.db');
    return await openDatabase(path, version: 1,
        onCreate: (db, newerVersion) async {
          await db.execute(
              'CREATE TABLE $customerTable('
                  '$idColumn INTEGER PRIMARY KEY,'
                  '$interestedColumn TEXT,'
                  '$areaColumn TEXT,'
                  '$phoneColumn TEXT,'
                  '$firstnameColumn TEXT,'
                  '$middlenameColumn TEXT,'
                  '$lastnameColumn TEXT,'
                  '$guardianFatherColumn TEXT,'
                  '$guardianNameColumn TEXT,'
                  '$guardianEmailColumn TEXT,'
                  '$propertyCategoryColumn TEXT,'
                  '$propertyClassColumn TEXT,'
                  '$houseNumberColumn TEXT'
          );

        });
  }

  Future<Contact> saveContact(Contact contact) async {
    var dbContact = await db;
    contact.id = await dbContact.insert(customerTable, contact.toMap());
    return contact;
  }

  Future<Contact> getContact(int id) async {
    var dbContact = await db;
    List<Map> maps = await dbContact.query(customerTable,
        columns: [idColumn, interestedColumn, guardianEmailColumn, phoneColumn, imgColumn],
        where: '$idColumn = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Contact.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int id) async {
    var dbContact = await db;
    return await dbContact
        .delete(customerTable, where: '$idColumn = ?', whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    var dbContact = await db;
    return await dbContact.update(customerTable, contact.toMap(),
        where: '$idColumn = ?', whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    var dbContact = await db;
    List listMap = await dbContact.rawQuery('SELECT * FROM $customerTable');
    var listContact = <Contact>[];
    for (Map m in listMap) {
      listContact.add(Contact.fromMap(m));
    }
    return listContact;
  }

 /* Future<int> getNumber() async {
    var dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery('SELECT COUNT(*) FROM $customerTable'));
  }

  Future close() async {
    var dbContact = await db;
    dbContact.close();
  }*/
  Future<Customer> saveCustomer(Customer customer) async {
    var dbCustomer = await db;
    customer.id = (await dbCustomer.insert(customerTable, customer.toMap()));
    return customer;
  }

  Future<Customer> getCustomer(int id) async {
    var dbCustomer= await db;
    List<Map> maps = await dbCustomer.query(customerTable,
        columns: [idColumn, firstnameColumn, middlenameColumn, lastnameColumn],
        where: '$idColumn = ?',
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Customer.fromMap(maps.first);
    } else {
      return null;
    }
  }
  Future<int> deleteCustomer(int id) async {
    var dbCustomer = await db;
    return await dbCustomer
        .delete(customerTable, where: '$idColumn = ?', whereArgs: [id]);
  }
  Future<int> updateCustomer(Customer customer) async {
    var dbCustomer = await db;
    return await dbCustomer.update(customerTable, customer.toMap(),
        where: '$idColumn = ?', whereArgs: [customer.id]);
  }
  Future<List> getAllCustomer() async {
    var dbCustomer = await db;
    List listMap = await dbCustomer.rawQuery('SELECT * FROM $customerTable');
    var listCustomer = <Customer>[];
    for (Map m in listMap) {
      listCustomer.add(Customer.fromMap(m));
    }
    return listCustomer;
  }
  Future<int> getNumber() async {
    var dbCustomer = await db;
    return Sqflite.firstIntValue(
        await dbCustomer.rawQuery('SELECT COUNT(*) FROM $customerTable'));
  }
  Future close() async {
    var dbCustomer = await db;
    dbCustomer.close();
  }
}
class Contact {
  int id;
  String name;
  String email;
  String phone;
  String img;
  Contact();
  Contact.fromMap(Map map) {
    id    = map[idColumn];
    name  = map[interestedColumn];
    email = map[guardianEmailColumn];
    phone = map[phoneColumn];
    img   = map[imgColumn];
  }

  Map toMap() {
    var map = <String, dynamic>{
      interestedColumn: name,
      guardianEmailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Contact('
        'id: $id,'
        'name: $name, '
        'email: $email, '
        'phone: $phone, '
        'img: $img)';
  }
}

class Customer {
    int  id;
   String interestedColumn;
   String phoneColumn ;
   String imgColumn ;
   String  firstnameColumn ;
   String middlenameColumn;
   String lastnameColumn ;
   String areaColumn ;
   String guardianFatherColumn ;
   String guardianNameColumn ;
   String guardianEmailColumn ;
   String propertyCategoryColumn ;
   String propertyClassColumn ;
   String houseNumberColumn ;
   String localityColumn ;
   String townColumn ;
   String pinCodeColumn;
   String districtCodeColumn ;
   String MDPEAllowColumn ;
   String ResidentStatusColumn ;
   String numberKitchanStatusColumn ;
   String numberBathroomStatusColumn ;
   String exitingCookingColumn ;
   String reasonColumn ;
   String familyMemberColumn ;
   String latColumn ;
   String logColumn;
   String remarksColumn ;
   String idAdaharColumn ;
   String idProofNoColumn ;
   String idProofFrontPath ;
   String idProofFrontLNamePath;
   String idProofBackPath;
   String idProofBackLNamePath;
   String electricBillColumn;
   String OwnerShipProofColumn;
   String docOwenerIDColumn;
   String docproofnoColumn;
   String dofrontPathColumn;
   String dofrontPathLNameColumn;
   String docBackPathColumn;
   String docBackPathLastNameColumn;

   String doccoverLNamePhotoColumn;
   String docbillingModeColumn;
   String docCustomerBankColumn;
   String docCustomerAccountColumn;
   String docCustomerIFSCCodeColumn;
   String docCustomerBankAddress;
   String docCustomerAcceptRedioPolicy;
   String docextrafittingRedioPolicy ;
   String imgCancelPath ;
   String imgCancelPathLastName;
   String depositeStatus ;
   String ModeOfdeposite;
   String deposite_type ;
   String deposite_amount;
   String checkNumber ;
   String checkDate;
   String customerbankName ;
   String chequeBankAccountNumber;
   String imagechequePhoto;
   String imagechequeLastNamePhoto ;
   String DateAndTime ;
   Customer();
   Customer.fromMap(Map map) {
     id    = map[idColumn];
     interestedColumn  = map[interestedColumn];
     phoneColumn = map[phoneColumn];
     firstnameColumn = map[firstnameColumn];
     lastnameColumn = map[lastnameColumn];
     phoneColumn = map[phoneColumn];
     imgColumn = map[imgColumn];
     areaColumn = map[areaColumn];
     guardianFatherColumn = map[guardianFatherColumn];
     guardianNameColumn = map[guardianNameColumn];
     guardianEmailColumn = map[guardianEmailColumn];
     propertyCategoryColumn = map[propertyCategoryColumn];
     propertyClassColumn = map[propertyClassColumn];
     houseNumberColumn = map[houseNumberColumn];
     localityColumn = map[localityColumn];
     townColumn = map[townColumn];
     pinCodeColumn = map[pinCodeColumn];
     districtCodeColumn = map[districtCodeColumn];
     MDPEAllowColumn = map[MDPEAllowColumn];
     ResidentStatusColumn = map[ResidentStatusColumn];
     numberKitchanStatusColumn = map[numberKitchanStatusColumn];
     numberBathroomStatusColumn = map[numberBathroomStatusColumn];
     exitingCookingColumn = map[exitingCookingColumn];
     reasonColumn = map[reasonColumn];
     familyMemberColumn = map[familyMemberColumn];
     latColumn = map[latColumn];
     logColumn = map[logColumn];
     remarksColumn = map[remarksColumn];
     idAdaharColumn = map[idAdaharColumn];
     idProofNoColumn = map[idProofNoColumn];
     idProofFrontLNamePath = map[idProofFrontLNamePath];
     idProofBackPath = map[idProofBackPath];
     idProofBackLNamePath = map[idProofBackLNamePath];
     electricBillColumn = map[electricBillColumn];
     OwnerShipProofColumn = map[OwnerShipProofColumn];
     docOwenerIDColumn = map[docOwenerIDColumn];
     docproofnoColumn = map[docproofnoColumn];
     dofrontPathColumn = map[dofrontPathColumn];
     dofrontPathLNameColumn = map[dofrontPathLNameColumn];
     docBackPathColumn = map[docBackPathColumn];
     docBackPathLastNameColumn = map[docBackPathLastNameColumn];
     doccoverLNamePhotoColumn = map[doccoverLNamePhotoColumn];
     docbillingModeColumn = map[docbillingModeColumn];
     docCustomerBankColumn = map[docCustomerBankColumn];
     docCustomerAccountColumn = map[docCustomerAccountColumn];
     docCustomerIFSCCodeColumn = map[docCustomerIFSCCodeColumn];
     docCustomerBankAddress = map[docCustomerBankAddress];
     docCustomerAcceptRedioPolicy = map[docCustomerAcceptRedioPolicy];
     imgCancelPath = map[imgCancelPath];
     imgCancelPathLastName = map[imgCancelPathLastName];
     depositeStatus = map[depositeStatus];
     ModeOfdeposite = map[ModeOfdeposite];
     deposite_type = map[deposite_type];
     deposite_amount = map[deposite_amount];
     checkNumber = map[checkNumber];
     checkDate = map[checkDate];
     customerbankName = map[customerbankName];
     chequeBankAccountNumber = map[chequeBankAccountNumber];
     imagechequePhoto = map[imagechequePhoto];
     imagechequeLastNamePhoto = map[imagechequeLastNamePhoto];
     DateAndTime = map[DateAndTime];

   }

   Map toMap() {
     var map = <String, dynamic>{
      interestedColumn:interestedColumn,
      phoneColumn:phoneColumn,
      imgColumn:imgColumn,
     firstnameColumn:firstnameColumn,
     middlenameColumn:middlenameColumn,
     lastnameColumn:lastnameColumn,
     areaColumn:areaColumn,
     guardianFatherColumn:guardianFatherColumn,
     guardianNameColumn:guardianNameColumn,
     guardianEmailColumn:guardianEmailColumn,
     propertyCategoryColumn:propertyCategoryColumn,
     propertyClassColumn:propertyClassColumn,
     houseNumberColumn:houseNumberColumn,
     localityColumn:localityColumn,
     townColumn:townColumn,
     pinCodeColumn:pinCodeColumn,
     districtCodeColumn:districtCodeColumn,
     MDPEAllowColumn:MDPEAllowColumn,
     ResidentStatusColumn:ResidentStatusColumn,
     numberKitchanStatusColumn:numberKitchanStatusColumn,
     numberBathroomStatusColumn:numberBathroomStatusColumn,
     exitingCookingColumn:exitingCookingColumn,
     exitingCookingColumn:exitingCookingColumn,
     reasonColumn:reasonColumn,
     familyMemberColumn:familyMemberColumn,
     latColumn:latColumn,
     logColumn:logColumn,
     remarksColumn:remarksColumn,
     idAdaharColumn:idAdaharColumn,
     idProofNoColumn:idProofNoColumn,
     idProofFrontPath:idProofFrontPath,
     idProofBackPath:idProofBackPath,
     idProofBackLNamePath:idProofBackLNamePath,
     idProofBackLNamePath:idProofBackLNamePath,
     electricBillColumn:electricBillColumn,
     OwnerShipProofColumn:OwnerShipProofColumn,
     docOwenerIDColumn:docOwenerIDColumn,
     docproofnoColumn:docproofnoColumn,
     dofrontPathColumn:dofrontPathColumn,
     dofrontPathLNameColumn:dofrontPathLNameColumn,
     dofrontPathLNameColumn:dofrontPathLNameColumn,
     docBackPathColumn:docBackPathColumn,
     docBackPathLastNameColumn:docBackPathLastNameColumn,

     doccoverLNamePhotoColumn:doccoverLNamePhotoColumn,
     docbillingModeColumn:docbillingModeColumn,
     docCustomerBankColumn:docCustomerBankColumn,
     docbillingModeColumn:docbillingModeColumn,
     docCustomerBankColumn:docCustomerBankColumn,
     docCustomerBankColumn:docCustomerBankColumn,


     docCustomerIFSCCodeColumn:docCustomerIFSCCodeColumn,
     docCustomerBankAddress:docCustomerBankAddress,
     docCustomerAcceptRedioPolicy:docCustomerAcceptRedioPolicy,
     docextrafittingRedioPolicy:docextrafittingRedioPolicy,
     imgCancelPath:imgCancelPath,
     imgCancelPathLastName:imgCancelPathLastName,
     depositeStatus:depositeStatus,
     ModeOfdeposite:ModeOfdeposite,
     deposite_type:deposite_type,
     deposite_amount:deposite_amount,
     checkNumber:checkNumber,
     checkDate:checkDate,
     customerbankName:customerbankName,
     chequeBankAccountNumber:chequeBankAccountNumber,
     imagechequePhoto:imagechequePhoto,
     imagechequeLastNamePhoto:imagechequeLastNamePhoto,
       DateAndTime:DateAndTime,


     };
     if (id != null) {
       map[idColumn] = id;
     }
     return map;
   }
  @override
  String toString() {
    return 'Customer{idColumn: $idColumn, interestedColumn: $interestedColumn, '
        'phoneColumn: $phoneColumn, imgColumn: $imgColumn, firstnameColumn: $firstnameColumn, middlenameColumn: $middlenameColumn, lastnameColumn: $lastnameColumn, areaColumn: $areaColumn, guardianFatherColumn: $guardianFatherColumn, guardianNameColumn: $guardianNameColumn, guardianEmailColumn: $guardianEmailColumn, propertyCategoryColumn: $propertyCategoryColumn, propertyClassColumn: $propertyClassColumn, houseNumberColumn: $houseNumberColumn, localityColumn: $localityColumn, townColumn: $townColumn, pinCodeColumn: $pinCodeColumn, districtCodeColumn: $districtCodeColumn, MDPEAllowColumn: $MDPEAllowColumn, ResidentStatusColumn: $ResidentStatusColumn, numberKitchanStatusColumn: $numberKitchanStatusColumn, numberBathroomStatusColumn: $numberBathroomStatusColumn, exitingCookingColumn: $exitingCookingColumn, reasonColumn: $reasonColumn, familyMemberColumn: $familyMemberColumn, latColumn: $latColumn, logColumn: $logColumn, remarksColumn: $remarksColumn, idAdaharColumn: $idAdaharColumn, idProofNoColumn: $idProofNoColumn, idProofFrontPath: $idProofFrontPath, idProofFrontLNamePath: $idProofFrontLNamePath, idProofBackPath: $idProofBackPath, idProofBackLNamePath: $idProofBackLNamePath, electricBillColumn: $electricBillColumn, OwnerShipProofColumn: $OwnerShipProofColumn, docOwenerIDColumn: $docOwenerIDColumn, docproofnoColumn: $docproofnoColumn, dofrontPathColumn: $dofrontPathColumn, dofrontPathLNameColumn: $dofrontPathLNameColumn, docBackPathColumn: $docBackPathColumn, docBackPathLastNameColumn: $docBackPathLastNameColumn,doccoverLNamePhotoColumn: $doccoverLNamePhotoColumn, docbillingModeColumn: $docbillingModeColumn, docCustomerBankColumn: $docCustomerBankColumn, docCustomerAccountColumn: $docCustomerAccountColumn, docCustomerIFSCCodeColumn: $docCustomerIFSCCodeColumn, docCustomerBankAddress: $docCustomerBankAddress, docCustomerAcceptRedioPolicy: $docCustomerAcceptRedioPolicy, docextrafittingRedioPolicy: $docextrafittingRedioPolicy, imgCancelPath: $imgCancelPath, imgCancelPathLastName: $imgCancelPathLastName, depositeStatus: $depositeStatus, ModeOfdeposite: $ModeOfdeposite, deposite_type: $deposite_type, deposite_amount: $deposite_amount, checkNumber: $checkNumber, checkDate: $checkDate, customerbankName: $customerbankName, chequeBankAccountNumber: $chequeBankAccountNumber, imagechequePhoto: $imagechequePhoto, imagechequeLastNamePhoto: $imagechequeLastNamePhoto}';
  }



/*  Customer();

  Customer.fromMap(Map map) {
    id    = map[idColumn];
    firstname  = map[firstnameColumn];
    middlename = map[middlenameColumn];
    lastname = map[lastnameColumn];
    phone = map[phoneColumn];

  }

  Map toMap() {
    var map = <String, dynamic>{
      firstnameColumn: firstname,
      middlenameColumn: middlename,
      lastnameColumn: lastname,
      phoneColumn: phone
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Customer('
        'id: $id,'
        'firstname: $firstname, '
        'middlename: $middlename, '
        'lastname: $lastname, '
        'phone: $phone)';
  }*/




/*  Customer();

  Customer.fromMap(Map map) {
    id    = map[idColumn];
    firstname  = map[firstnameColumn];
    middlename = map[middlenameColumn];
    lastname = map[lastnameColumn];
    phone = map[phoneColumn];

  }

  Map toMap() {
    var map = <String, dynamic>{
      firstnameColumn: firstname,
      middlenameColumn: middlename,
      lastnameColumn: lastname,
      phoneColumn: phone
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'Customer('
        'id: $id,'
        'firstname: $firstname, '
        'middlename: $middlename, '
        'lastname: $lastname, '
        'phone: $phone)';
  }*/
}