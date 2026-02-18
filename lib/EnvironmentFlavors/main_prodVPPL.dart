import 'package:flutter/cupertino.dart';
import 'package:pbg_app/Utils/common_widgets/res/enums.dart';
import 'package:pbg_app/Utils/common_widgets/res/environment_config.dart';
import 'package:pbg_app/root.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var configurationApp = EnvironmentConfig(
    child: Root(client: Client.vppl),
    flavors: EnvironmentFlavors.prodVPPL,
  );
  runApp(configurationApp);
}
