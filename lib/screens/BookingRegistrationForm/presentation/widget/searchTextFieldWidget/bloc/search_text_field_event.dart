part of 'search_text_field_bloc.dart';

abstract class SearchTextFieldEvent extends Equatable {
  const SearchTextFieldEvent();
}

class SearchTextFieldPageLoadEvent extends SearchTextFieldEvent {
  final List<dynamic> list;
  final String controllerValue;
  SearchTextFieldPageLoadEvent({this.list,  this.controllerValue});
  @override
  List<Object> get props => [list, controllerValue];
}

class SearchTextFieldSearchKeyWordEvent extends SearchTextFieldEvent {
  final String keyWord;
  SearchTextFieldSearchKeyWordEvent({ this.keyWord});
  @override
  List<Object> get props => [keyWord];
}

class SearchTextFieldSelectListItemEvent extends SearchTextFieldEvent {
  final String listValue;
  SearchTextFieldSelectListItemEvent({ this.listValue});
  @override
  List<Object> get props => [listValue];
}

class SearchTextFieldSetListValueEvent extends SearchTextFieldEvent {
  final String listValue;
  SearchTextFieldSetListValueEvent({ this.listValue});
  @override
  List<Object> get props => [listValue];
}
