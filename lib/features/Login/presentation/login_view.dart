import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/background_widget.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_config.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';

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
    super.initState();
    BlocProvider.of<LoginBloc>(context).add(LoginPageLoadingEvent());
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBarWidget(
        title: AppString.login,
        boolLeading: false,
      ),
      body: SafeArea(
        child: BackgroundWidget(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginFetchDataState) {
                return Center(
                  child: _itemBuilder(context, dataState: state, width: width),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, {required LoginFetchDataState dataState, required double width}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          reverse: true,
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Card(

            elevation: 8,
            shadowColor: AppColor.prime1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _verticalSpace(context),
                _logo(context),
                _verticalSpace(context),
                _verticalSpace(context),
                _emailTextField(context),
                _verticalSpace(context),
                _passwordTextField(dataState),
                _verticalSpace(context),
                _loginButton(dataState),
                _verticalSpace(context),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom * 0.4,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logo(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Hero(
      tag: 'logo',
      child: SizedBox(
        height: height * 0.22,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              bottom: height * 0.08,
              child: Image.asset(
                AppConfig.instanceInit()!.client == Client.mahaNagar
                    ? AppIcon.mglLogo
                    : AppIcon.pbgplLogo,
                width: width * 0.30,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppIcon.colourStrip,
                color: AppColor.prime1,
                fit: BoxFit.cover,
                width: width,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: TextFieldWidget(
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
      ),
    );
  }

  Widget _passwordTextField(LoginFetchDataState dataState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      child: TextFieldWidget(
        label: AppString.passwordLabel,
        hintText: AppString.passwordLabel,
        autofillHints: const [AutofillHints.password],
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
            BlocProvider.of<LoginBloc>(context).add(
              LoginHideShowPasswordEvent(isHideShow: !dataState.isPassword),
            );
          },
        ),
        obscureText: dataState.isPassword,
        onChanged: (val) {
          BlocProvider.of<LoginBloc>(context).add(
            LoginSetPasswordEvent(password: val.toString().replaceAll(" ", "")),
          );
        },
      ),
    );
  }

  Widget _loginButton(LoginFetchDataState dataState) {
    final width = MediaQuery.of(context).size.width;
    return dataState.isPageLoader == false
        ? Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: ButtonWidget(
        text: AppString.login,
        onPressed: () {
          FocusScope.of(context).unfocus();
          TextInput.finishAutofillContext();
          BlocProvider.of<LoginBloc>(context).add(
            LoginSubmitDataEvent(context: context, isLoginLoading: true),
          );
        },
      ),
    )
        : DottedLoaderWidget();
  }

  Widget _verticalSpace(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(height: width * 0.07);
  }
}
