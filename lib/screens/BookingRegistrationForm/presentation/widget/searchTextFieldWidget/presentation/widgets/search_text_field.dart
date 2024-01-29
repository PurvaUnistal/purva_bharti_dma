import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pbg_app/screens/BookingRegistrationForm/presentation/widget/searchTextFieldWidget/bloc/search_text_field_bloc.dart';

class SearchTextField extends StatelessWidget {

  final void Function(dynamic) onChange;
  final void Function(dynamic) onClick;
  final List<dynamic> list;
  final String label;
  final double height;
  final TextEditingController controller;
  final int maxLines;

  const SearchTextField({
    this.onChange,
    this.onClick,
    this.label,
    this.height,
    this.maxLines,
    this.list, this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      SearchTextFieldBloc()
        ..add(SearchTextFieldPageLoadEvent(list: list,
            controllerValue: controller != null ? controller.text.toString() : "")),
      child: BlocBuilder<SearchTextFieldBloc, SearchTextFieldState>(
        builder: (context, state) {
          if(state is FetchSearchTextFieldDataState){
            return _searchTextField(dataState: state, context: context);
          }else{
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _searchTextField({ FetchSearchTextFieldDataState dataState,
    BuildContext context}) {
    return  Column(
      children: [
        TextField(
          controller: dataState.searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            labelText: label,
            labelStyle: TextStyle(fontSize: 14.0),
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1,
                style: BorderStyle.none,
              ),
            ),
          ),
          onChanged: (keyWord) {
            onChange.call(keyWord);
            BlocProvider.of<SearchTextFieldBloc>(context).add(
                SearchTextFieldSearchKeyWordEvent(keyWord: keyWord));
          },
        ),
        _list(dataState: dataState, context: context),
      ],
    );
  }

  Widget _list({ FetchSearchTextFieldDataState dataState,
     BuildContext context}) {
    return  dataState.searchList.isNotEmpty ?
    SizedBox(
      height: dataState.searchList.length == 1 ?  MediaQuery.of(context).size.height * 0.07
          : dataState.searchList.length == 2 ?  MediaQuery.of(context).size.height * 0.12
          : dataState.searchList.length == 3 ?  MediaQuery.of(context).size.height * 0.19
          : dataState.searchList.length == 4 ?  MediaQuery.of(context).size.height * 0.16
          :  MediaQuery.of(context).size.height/3,
      child: Card(
        child: ListView.builder(
            itemCount: dataState.searchList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                child: InkWell(
                  onTap: () {
                    onClick.call(dataState.searchList[index].toString());
                    BlocProvider.of<SearchTextFieldBloc>(context).add(
                        SearchTextFieldSearchKeyWordEvent(keyWord: ""));
                    BlocProvider.of<SearchTextFieldBloc>(context).add(
                        SearchTextFieldSetListValueEvent(listValue: dataState.searchList[index].toString()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dataState.searchList[index].toString(),
                        style: TextStyle(color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400),),
                      dataState.searchList.length -1 != index ? Divider() : SizedBox.shrink(),
                    ],
                  ),
                ),
              );

            }),
      ),
    ): SizedBox.shrink();
  }
}
