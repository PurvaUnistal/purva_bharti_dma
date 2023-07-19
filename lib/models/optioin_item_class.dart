import 'package:hive/hive.dart';
import '../helper/DropDownCustom.dart';

part 'optioin_item_class.g.dart';

@HiveType(typeId: 2)
class OptionItemClass extends HiveObject {
  @HiveField(1)
  OptionItem optionItem;
  OptionItemClass(this.optionItem);
}