import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final Widget leading;
  final List<Widget> actions;
  const CustomAppBar({Key key, this.titleAppBar, this.leading, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: leading,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.red, Colors.blue.shade900]
            ),
          ),
        ),
        centerTitle:true,
        title: Text(titleAppBar,
          style: TextStyle(
            fontSize: 18
          ),
        ),
        actions: actions,
        /* title: GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationForm()));
          },
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios,size: 24, color:Colors.white),
              SizedBox(width: 10,),
              Text('Customer Input')
            ],
          ),
        ),*/
      ),
    );
  }
}
