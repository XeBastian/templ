// ignore_for_file: constant_identifier_names

///This is the Global base route of the app.
///All routes are to be defined only in this file and from the rest a reference be made.
class AppRoutes {
  /// The routes corresponding to the side menu items
  static const OverViewPageRoute = "Overview";
  static const DriversPageRoute = "Drivers";
  static const ClientsPageRoute = "Clients";
  static const AuthenticationPageRoute = "Authentication";

  static List sideMenuItems = [
    OverViewPageRoute,
    DriversPageRoute,
    ClientsPageRoute,
    AuthenticationPageRoute,
  ];
}
