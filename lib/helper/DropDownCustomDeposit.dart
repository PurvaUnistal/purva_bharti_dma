import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectDropListDeposit extends StatefulWidget {
  DepositItem itemSelected;

  final DropListDepositModel dropListModel;
  DropDownControllerDeposit controller;
  Function(DepositItem optionItem) onOptionSelected;
  Icon icon;
  Decoration decoration;

  SelectDropListDeposit(this.dropListModel,
      {this.icon,
        this.itemSelected,
        this.controller,
        this.decoration,
        this.onOptionSelected}) {
    if (controller != null)
      controller.selectedItem =
          itemSelected ?? dropListModel.listOptionItems[0];
    if (itemSelected == null) {
      itemSelected = dropListModel.listOptionItems[0];
    }
    if (decoration == null) {
      decoration = new BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      );
    }
  }

  @override
  _SelectDropListDepositState createState() =>
      _SelectDropListDepositState(itemSelected, dropListModel);
}

class _SelectDropListDepositState extends State<SelectDropListDeposit>
    with SingleTickerProviderStateMixin {
  DepositItem optionItemSelected;
  final DropListDepositModel dropListModel;

  AnimationController expandController;
  Animation<double> animation;

  bool isShow = false;

  _SelectDropListDepositState(this.optionItemSelected, this.dropListModel);

  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    _runExpandCheck();
  }

  void _runExpandCheck() {
    if (isShow) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            decoration: widget.decoration,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.icon != null ? widget.icon : Container(),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        this.isShow = !this.isShow;
                        _runExpandCheck();
                        setState(() {});
                      },
                      child: Text(
                        optionItemSelected.title,
                        style: TextStyle(
                            color:Theme.of(context).textTheme.headline6.color,
                            fontSize: 16),
                      ),
                    )),
                Align(
                  alignment: Alignment(1, 0),
                  child: Icon(
                    isShow ? Icons.arrow_drop_down : Icons.arrow_right,
                    color:Theme.of(context).textTheme.headline6.color,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizeTransition(
              axisAlignment: 1.0,
              sizeFactor: animation,
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: widget.decoration,
                  child: _buildDropListOptions(
                      dropListModel.listOptionItems, context))),
//          Divider(color: Colors.grey.shade300, height: 1,)
        ],
      ),
    );
  }

  Column _buildDropListOptions(List<DepositItem> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  Widget _buildSubMenu(DepositItem  item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 5, bottom: 5),
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey[200], width: 1)),
                ),
                child: Text(item.title,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.headline6.color,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        onTap: () {
          this.optionItemSelected = item;
          isShow = false;
          expandController.reverse();
          setState(() {
            optionItemSelected = item;
          });
          if (widget.controller != null) widget.controller.selectedItem = item;
          if (widget.onOptionSelected != null) widget.onOptionSelected(item);
        },
      ),
    );
  }
}

class DropDownControllerDeposit {
  DepositItem  selectedItem;
}


class DropListDepositModel {
  DropListDepositModel(this.listOptionItems);

  final List<DepositItem> listOptionItems;
}




class DepositItem {
  final dynamic id;
  final String title;
  final String amount;
  final int firstamount;
  final int schememonth;
  final int gas_amount;
  final String scheme_type;
  final String scheme_code;
  final String deposit_name;
  final String deposit_amount;
  final String equipment_deposit_amount;
  final String interest_amount;
  final String registration_gst;
  final String totalAmount;
  final String nextCycleAmount;
  final String registration_tax_name;
  final int total_amount;
  final String interest_tax_amt;
  final String reg_tax;

  DepositItem({@required this.id, @required this.title,@required this.amount,@required this.firstamount,@required this.schememonth,@required this.gas_amount,
    @required this.scheme_type, @required this.scheme_code, this.deposit_name,@required this.deposit_amount,@required this.equipment_deposit_amount,@required this.interest_amount,
    @required this.registration_gst, @required this.totalAmount,@required this.nextCycleAmount,@required this.registration_tax_name, this.total_amount,@required this.interest_tax_amt,
    @required this.reg_tax});

}