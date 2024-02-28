import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    BlocProvider.of<LoginBloc>(context).add(LoginLoadingPageEvent());
    /*  BlocProvider.of<NetworkBloc>(context)
        .add(NetworkObserveEvent(context: context));*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          titleAppBar: "Login",
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginGetSubmitState) {
              return Center(
                child: _buildLayout(dataState: state),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  _buildLayout({required LoginGetSubmitState dataState}) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _appLogoWidget(),
          _emailWidget(dataState: dataState),
          _horizontal(),
          _passwordWidget(dataState: dataState),
          _horizontal(),
          _loginWidget(dataState: dataState),
          _horizontal(),
        ],
      ),
    ));
  }

  onWillPop() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to exit'),
          actions: [
            TextButton(
              child: Text('Yes'),
              onPressed: () => Navigator.pop(context, true),
            ),
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(context, false),
            ),
          ],
        );
      },
    );
    return shouldPop!;
  }

  Widget _appLogoWidget() {
    var h = MediaQuery.of(context).size.height;
    print(h * 0.17);
    return Column(
      children: [
        Image.asset(
          AppString.appLogo,
          height: h * 0.17,
        ),
        Text(
          AppString.appName,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: h * 0.09,
        )
      ],
    );
  }

  Widget _emailWidget({required LoginGetSubmitState dataState}) {
    return _textField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      // controller: _usernameController,
      hintText: "Enter Your Username",
      labelText: "Enter Your Username",
      onChanged: (val) {
        BlocProvider.of<LoginBloc>(context)
            .add(LoginSetEmailEvent(email: val.toString().replaceAll(" ", "")));
      },
      prefix: Icon(Icons.email, color: AppColor.appBlueColor),
    );
  }

  Widget _passwordWidget({required LoginGetSubmitState dataState}) {
    return _textField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: [AutofillHints.password],
      hintText: "Enter Your Password",
      labelText: "Enter Your Password",
      obscureText: dataState.isPassword,
      onChanged: (val) {
        BlocProvider.of<LoginBloc>(context).add(LoginSetPasswordEvent(
            password: val.toString().replaceAll(" ", "")));
      },
      prefix: Icon(
        Icons.lock,
        color: AppColor.appBlueColor,
      ),
      suffixIcon: IconButton(
        icon: Icon(
            dataState.isPassword ? Icons.visibility_off : Icons.visibility,
            color: AppColor.appBlueColor),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginSetHideShowPwdEvent(
              isHideShowPwd: dataState.isPassword == true ? false : true));
        },
      ),
    );
  }

  Widget _loginWidget({required LoginGetSubmitState dataState}) {
    return ButtonWidget(
      text: "LOG IN",
      onPressed: () {
        FocusScope.of(context).unfocus();
        TextInput.finishAutofillContext();
        BlocProvider.of<LoginBloc>(context).add(LoginSetSubmitDataEvent(
          context: context,
          isLoginLoader: true,
        ));
      },
    );
  }

  Widget _horizontal() {
    var h = MediaQuery.of(context).size.height;
    print(h * 0.015);
    return SizedBox(
      height: h * 0.015,
    );
  }

  Widget _textField({
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    Iterable<String>? autofillHints,
    Widget? suffixIcon,
    TextEditingController? controller,
    bool? obscureText,
    void Function(String)? onChanged,
    Widget? prefix,
    String? labelText,
    String? hintText,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      controller: controller,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        isDense: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(width: 1, color: AppColor.appBlueColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(width: 1, color: AppColor.appBlueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          borderSide: BorderSide(width: 1, color: AppColor.appBlueColor),
        ),
      ),
    );
  }
}
