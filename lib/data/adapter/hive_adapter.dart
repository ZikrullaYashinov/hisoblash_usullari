import 'package:hisoblash_usullari/data/model/equation.dart';
import 'package:hive/hive.dart';

class QuadraticEquationAdapter extends TypeAdapter<QuadraticEquation> {
  @override
  QuadraticEquation read(BinaryReader reader) {
    var a = reader.read() as double;
    var b = reader.read() as double;
    var c = reader.read() as double;
    var min = reader.read() as double;
    var max = reader.read() as double;
    var error = reader.read() as double;
    return QuadraticEquation(a, b, c, min, max, error);
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, QuadraticEquation obj) {
    writer.write(obj.a);
    writer.write(obj.b);
    writer.write(obj.c);
    writer.write(obj.min);
    writer.write(obj.max);
    writer.write(obj.error);
  }
}
