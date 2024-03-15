import 'package:hisoblash_usullari/data/model/equation.dart';
import 'package:hive/hive.dart';

class QuadraticEquationAdapter extends TypeAdapter<QuadraticEquation> {
  @override
  QuadraticEquation read(BinaryReader reader) {
    var fun = reader.read() as String;
    var fun1 = reader.read() as String;
    var fun2 = reader.read() as String;
    var min = reader.read() as double;
    var max = reader.read() as double;
    var error = reader.read() as double;
    return QuadraticEquation(min, max, error, fun, fun1, fun2);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, QuadraticEquation obj) {
    writer.write(obj.fun);
    writer.write(obj.fun1);
    writer.write(obj.fun2);
    writer.write(obj.min);
    writer.write(obj.max);
    writer.write(obj.error);
  }
}
