import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BookingRegistrationFormEvent extends Equatable{}

class BookingRegistrationFormPageLoaderEvent extends BookingRegistrationFormEvent{
  final BuildContext context;
  BookingRegistrationFormPageLoaderEvent({this.context});
  @override
  // TODO: implement props
  List<Object> get props => [context];
}

class BookingRegistrationFormSetSearchPhoneNumberEvent extends BookingRegistrationFormEvent{
 final String mobileNumber;
 final BuildContext context;
 BookingRegistrationFormSetSearchPhoneNumberEvent({this.mobileNumber, this.context});
  @override
  // TODO: implement props
  List<Object> get props => [mobileNumber, context];
}
class BookingRegistrationFormSelectSearchPhoneNumberEvent extends BookingRegistrationFormEvent{
  final String mobileNumber;
  final BuildContext context;
  BookingRegistrationFormSelectSearchPhoneNumberEvent({this.mobileNumber,  this.context});
  @override
  // TODO: implement props
  List<Object> get props => [mobileNumber,context];
}

