import 'package:bus_driver/core/utils/cash_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
const String GOOGLE_MAP_API_KEY = "AIzaSyB5uJvWTi4s65y_ZR8CAimaj1cBItFQN8k";
String token="";
  String toggleWorkingStatus="/api/driver/toggleWorkingStatus";
  String dropPassenger="/api/driver/drop-pas";
  String addPassenger="/api/driver/add-pas";
  String login="/api/driver/login";
  String appLogout="/api/driver/logout";
  String updateBusLocation="/api/driver/updateBusLocation";
  String  resetNumberOfPass="/api/driver/rest-pas";
  String  userDetails="/api/driver/getDriver";
 String forgotPassword = '/api/driver/reset-password';
 String verificationCodee = '/api/driver/change-password';

String userDetailsEmail='';
String userDetailsName='';
bool toggle =  false;
  class AppConst
  {

    static int numberOfPassenger=CashHelper.getData(key: "numberOfPassenger");
  }
