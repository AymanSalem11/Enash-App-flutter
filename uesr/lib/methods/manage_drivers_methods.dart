import 'package:user11_app/models/online_nearby_drivers.dart';

class ManageDriversMethods {
  static List<OnlineNearbyDrivers> nearbyOnlineDriversList = [];

  static void removeDriverFromList(String driverID) {
    int index =
    nearbyOnlineDriversList.indexWhere((driver) => driver.uidDriver == driverID);

    if (index != -1) {
      nearbyOnlineDriversList.removeAt(index);
    } else {
      // Handle the case where the driver is not found in the list
      print("Driver not found in the nearby drivers list.");
    }
  }

  static void updateOnlineNearbyDriversLocation(
      OnlineNearbyDrivers nearbyOnlineDriverInformation) {
    int index = nearbyOnlineDriversList.indexWhere(
            (driver) => driver.uidDriver == nearbyOnlineDriverInformation.uidDriver);

    if (index != -1) {
      nearbyOnlineDriversList[index].latDriver =
          nearbyOnlineDriverInformation.latDriver;
      nearbyOnlineDriversList[index].lngDriver =
          nearbyOnlineDriverInformation.lngDriver;
    } else {
      // Handle the case where the driver is not found in the list
      print("Driver not found in the nearby drivers list.");
    }
  }
}
