import 'package:sixam_mart_delivery/data/api/api_client.dart';
import 'package:sixam_mart_delivery/util/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  NotificationRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getNotificationList() async {
    return await apiClient.getData('${AppConstants.notificationUri}${getUserToken()}');
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  void saveSeenNotificationCount(int count) {
    sharedPreferences.setInt(AppConstants.notificationCount, count);
  }

  int? getSeenNotificationCount() {
    return sharedPreferences.getInt(AppConstants.notificationCount);
  }
}
