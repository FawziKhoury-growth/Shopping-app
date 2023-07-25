
import 'package:task4/navigator/route_generator.dart';

class RouteNavigator{
  static void goTo (String routeName){
    RouteGenerator.navigatorKey.currentState?.pushNamed('/$routeName');
  }

  static void goToAndRemove (String routeName){
    RouteGenerator.navigatorKey.currentState?.pushNamedAndRemoveUntil('/$routeName', (route) => route.isFirst);
  }
}