import 'package:equations/equations.dart';
import 'package:hive/hive.dart';
import 'package:math_expressions/math_expressions.dart';

@HiveType(typeId: 0)
class QuadraticEquation {
  @HiveField(0)
  String fun;
  @HiveField(1)
  String fun1;
  @HiveField(2)
  String fun2;
  @HiveField(3)
  double min;
  @HiveField(4)
  double max;
  @HiveField(5)
  double error;

  QuadraticEquation(
    this.min,
    this.max,
    this.error,
    this.fun,
    this.fun1,
    this.fun2,
  );

  double absolute(double number) {
    if (number < 0) {
      return -number;
    } else {
      return number;
    }
  }

  double calculateText(String text, double _x) {
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(text);
    ContextModel cm = ContextModel();
    cm.bindVariable(x, Number(_x));
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    return eval;
  }

  double calculate(double _x, {int derivativeDegree = 0}) {
    if (derivativeDegree == 1) {
      return calculateText(fun1, _x);
    }
    if (derivativeDegree == 2) {
      return calculateText(fun2, _x);
    }
    return calculateText(fun, _x);
  }

  List<double> solutionMethodOfBisectingCrossSection() {
    try {
      double myMin = min;
      double myMax = max;
      double error = this.error;

      double? med;
      double? delta;
      double? deltaPercent;

      double minY = calculate(myMin);
      double maxY = calculate(myMax);

      if (maxY * minY < 0) {
        while (true) {
          minY = calculate(myMin);
          maxY = calculate(myMax);

          double newMed = (myMin + myMax) / 2;
          if (med != null) {
            delta = absolute(newMed - med);
            if (med == newMed) {
              return [];
            }
            deltaPercent = ((newMed - med) / newMed) * 100;
          }
          med = newMed;

          double medY = calculate(med);
          if (medY * minY < 0) {
            myMax = med;
          } else if (medY * maxY < 0) {
            myMin = med;
          } else {
            return [med, myMin, myMax];
          }
          if(delta != null) {
            if (delta < error) {
              break;
            }
          }
        }
        return [med, myMin, myMax];
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  List<double> solutionMethodOfVatars() {
    try {
      double myMin = min;
      double myMax = max;
      double error = this.error;

      double delta;
      double deltaPercent;

      double minY = calculate(myMin);
      double maxY = calculate(myMax);

      double dot;
      double x = 0;

      if (maxY * minY < 0) {
        double f_2_min = calculate(myMin, derivativeDegree: 2);
        double f_2_max = calculate(myMax, derivativeDegree: 2);
        if (minY * f_2_min > 0) {
          dot = myMin;
        } else if (maxY * f_2_max > 0) {
          dot = myMax;
        } else {
          return [];
        }
        while (true) {
          double f_x = calculate(x);
          double f_dot = calculate(dot);

          double x2 = x - f_x * (dot - x) / (f_dot - f_x);

          delta = absolute(x - x2);
          if (x != 0) {
            deltaPercent = (1 - x2 / x) * 100;
          }
          x = x2;

          if (delta < error) {
            break;
          }
        }
        return [x, delta];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  List<double> solutionMethodOfUrinma() {
    try {
      double myMin = min;
      double myMax = max;
      double error = this.error;

      double delta;
      double deltaPercent;

      double minY = calculate(myMin);
      double maxY = calculate(myMax);

      double dot;
      double x;

      if (maxY * minY < 0) {
        double f_2_min = calculate(myMin, derivativeDegree: 2);
        double f_2_max = calculate(myMax, derivativeDegree: 2);
        if (minY * f_2_min > 0) {
          dot = myMin;
        } else if (maxY * f_2_max > 0) {
          dot = myMax;
        } else {
          return [];
        }
        x = dot;

        while (true) {
          double f_x = calculate(x);
          double f_x_1 = calculate(x, derivativeDegree: 1);

          double x2 = x - f_x / f_x_1;

          delta = absolute(x - x2);
          if (x != 0) {
            deltaPercent = (1 - x / x2) * 100;
          }
          x = x2;

          if (delta < error) {
            break;
          }
        }
        return [x, delta];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  List<double> solutionMethodOfUrinmaModifikatsiya() {
    try {
      double myMin = min;
      double myMax = max;
      double error = this.error;

      double delta;
      double deltaPercent;

      double minY = calculate(myMin);
      double maxY = calculate(myMax);

      double dot;
      double x;

      if (maxY * minY < 0) {
        double f_2_min = calculate(myMin, derivativeDegree: 2);
        double f_2_max = calculate(myMax, derivativeDegree: 2);
        if (minY * f_2_min > 0) {
          dot = myMin;
        } else if (maxY * f_2_max > 0) {
          dot = myMax;
        } else {
          return [];
        }
        x = dot;
        double f_x_1 = calculate(x, derivativeDegree: 1);

        while (true) {
          double f_x = calculate(x);

          double x2 = x - f_x / f_x_1;

          delta = absolute(x - x2);
          if (x != 0) {
            deltaPercent = (1 - x / x2) * 100;
          }
          x = x2;

          if (delta < error) {
            break;
          }
        }
        return [x, delta];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
