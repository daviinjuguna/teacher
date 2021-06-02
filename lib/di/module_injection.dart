import 'package:battery/battery.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

//*this is for injecting third party libraries
@module
abstract class InjectionModules {
  //*shared preferences for cache storage
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  //*check connectivity of the phone
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  //*picking files
  @lazySingleton
  FilePicker get filePicker => FilePicker.platform;

  //*picking images
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  //*checking battery charging,discharging,low
  @lazySingleton
  Battery get battery => Battery();
}
