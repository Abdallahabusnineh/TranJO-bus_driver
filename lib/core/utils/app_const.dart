import 'package:bus_driver/core/utils/cash_helper.dart';

const String GOOGLE_MAP_API_KEY = "AIzaSyB5uJvWTi4s65y_ZR8CAimaj1cBItFQN8k";
String token="";
  String toggleWorkingStatus="/api/driver/toggleWorkingStatus";
  String dropPassenger="/api/driver/drop-pas";
  String addPassenger="/api/driver/add-pas";
  String login="/api/driver/login";
  String appLogout="/logout";
  String updateBusLocation="/api/driver/updateBusLocation";
  class AppConst
  {
    static int numberOfPassenger=CashHelper.getData(key: "numberOfPassenger");
  }
