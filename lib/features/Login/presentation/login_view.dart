import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    BlocProvider.of<LoginBloc>(context).add(LoginPageLoadingEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: RoutesName.login,
      ),
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginFetchDataState) {
              return _buildLayout(dataState: state);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildLayout({required LoginFetchDataState dataState}) {
    var h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical:  h *0.09),
        child: Column(
          children: [
            _logoWidget(),
            _sizedBox(),
            _emailWidget(dataState: dataState),
            _sizedBox(),
            _passwordWidget(dataState: dataState),
            _sizedBox(),
            _sizedBox(),
            _sizedBox(),
            _loginBtnWidget(dataState: dataState),
          ],
        ),
      ),
    );
  }

  Widget _logoWidget() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(23.0),
      child: Image.asset(
        ImgAsset.appLogo,
        width: w * 0.4,
        height: h * 0.16,
      ),
    );
  }

  Widget _emailWidget({required LoginFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.emailLabel,
      hintText: AppString.emailLabel,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(Icons.email, color: AppColor.prime),
      autofillHints: const [AutofillHints.email],
      onChanged: (val) {
        BlocProvider.of<LoginBloc>(context).add(
            LoginSetEmailIdEvent(emailId: val.toString().replaceAll(" ", "")));
      },
    );
  }

  Widget _passwordWidget({required LoginFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.passwordLabel,
      hintText: AppString.passwordLabel,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(Icons.lock_outline, color: AppColor.prime),
     // focusNode: passwordFocusNode,
      autofillHints: const [AutofillHints.password],
      obscureText: dataState.isPassword,
      suffixIcon: IconButton(
        icon: Icon(dataState.isPassword ? Icons.visibility_off : Icons.visibility, color: AppColor.prime),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginHideShowPasswordEvent(
              isHideShow: dataState.isPassword == true ? false : true));
        },
      ),
      onChanged: (val) {
        BlocProvider.of<LoginBloc>(context).add(LoginSetPasswordEvent(
            password: val.toString().replaceAll(" ", "")));
      },
    );
  }

  Widget _loginBtnWidget({required LoginFetchDataState dataState}) {
    return dataState.isPageLoader == false
        ? ButtonWidget(
            text: AppString.login,
            onPressed: () {
              FocusScope.of(context).unfocus();
              TextInput.finishAutofillContext();
              BlocProvider.of<LoginBloc>(context).add(
                  LoginSubmitDataEvent(context: context, isLoginLoading: true));
            })
        : const DottedLoaderWidget();
  }

  Widget _sizedBox() {
    var h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * 0.01,
    );
  }
}
