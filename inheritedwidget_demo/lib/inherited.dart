import 'package:flutter/cupertino.dart';

class ButtonColor extends InheritedWidget {
  const ButtonColor({
    Key key,
    @required this.color,
    @required Widget child,
  }) : super(key: key, child: child);
  final Color color;
  
  //sentencia para facilitar el acceso al color
  static ButtonColor of(BuildContext context) {
    final ButtonColor result =
        context.dependOnInheritedWidgetOfExactType<ButtonColor>();
    assert(result != null, 'No CounterInfo found in context');
    return result;
  }

  @override
  bool updateShouldNotify(ButtonColor oldWidget){
    print('change!');
    return color!=oldWidget.color;//actualizar UI solo si el color cambió
  }
}
