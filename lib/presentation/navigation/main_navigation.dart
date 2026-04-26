class MainNavigation {
  static Future<bool> onWillPop(int selectedIndex, Function goHome) async {
    if (selectedIndex != 0) {
      goHome();
      return false;
    }
    return true;
  }
}
