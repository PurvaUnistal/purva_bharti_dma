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
        title: AppString.login,
        boolLeading: false,
      ),
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginFetchDataState) {
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

  Widget _buildLayout({required LoginFetchDataState dataState}) {
    var h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height:h * 0.6,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _emailWidget(dataState: dataState),
                        _sizedBox(),
                        _passwordWidget(dataState: dataState),
                        _sizedBox(),
                        _sizedBox(),
                        _loginBtnWidget(dataState: dataState),
                      ],
                    ),
                  ),

                ),
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: .0,
            right: .0,
            child: _logoWidget(),)
        ],
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
      label:  AppString.emailLabel,
      hintText: AppString.emailLabel,
      autofillHints: [AutofillHints.email,AutofillHints.password],
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(
        Icons.email,
        color: Colors.green.shade800,
      ),
      onChanged: (val) {
        BlocProvider.of<LoginBloc>(context).add(
            LoginSetEmailIdEvent(emailId: val.toString().replaceAll(" ", "")));
      },
    );
  }

  Widget _passwordWidget({required LoginFetchDataState dataState}) {
    return TextFieldWidget(
      label: AppString.passwordLabel,
      hintText:  AppString.passwordLabel,
      autofillHints: const [AutofillHints.password,AutofillHints.email],
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(
        Icons.password,
        color: Colors.green.shade800,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          dataState.isPassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.green.shade800,
        ),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginHideShowPasswordEvent(
              isHideShow: dataState.isPassword == true ? false : true));
        },
      ),
      obscureText: dataState.isPassword,
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
        : DottedLoaderWidget();
  }

  Widget _sizedBox() {
    var h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * 0.03,
    );
  }
}
