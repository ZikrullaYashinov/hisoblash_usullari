import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class QuadraticEquation {
  @HiveField(0)
  double a;
  @HiveField(1)
  double b;
  @HiveField(2)
  double c;
  @HiveField(3)
  double min;
  @HiveField(4)
  double max;
  @HiveField(5)
  double error;

  QuadraticEquation(this.a, this.b, this.c, this.min, this.max, this.error);

  double absolute(double number) {
    if (number < 0) {
      return -number;
    } else {
      return number;
    }
  }

  double calculate(double _x, {int derivativeDegree = 0}) {
    if (derivativeDegree == 1) {
      return a * _x * 2 + b;
    }
    if (derivativeDegree == 2) {
      return a * 2;
    }
    return a * _x * _x + b * _x + c;
  }

  List<double> solutionMethodOfBisectingCrossSection() {
    double myMin = min;
    double myMax = max;
    double error = this.error;

    double med = 0;
    double delta = 0;
    double deltaPercent = 0;

    double minY = calculate(myMin);
    double maxY = calculate(myMax);

    var i = 0;

    if (maxY * minY < 0) {
      while (true) {
        minY = calculate(myMin);
        maxY = calculate(myMax);

        double newMed = (myMin + myMax) / 2;
        delta = absolute(newMed - med);
        deltaPercent = (1 - med / newMed) * 100;

        if (med == newMed) {
          return [];
        }
        med = newMed;

        double medY = calculate(med);
        if (medY * minY < 0) {
          myMax = med;
        } else if (medY * maxY < 0) {
          myMin = med;
        } else {
          return [med, myMin, myMax, delta, deltaPercent];
        }
        i++;
        if (delta < error) {
          break;
        }
      }
      return [med, myMin, myMax, delta, deltaPercent];
    } else {
      return [];
    }
  }

  List<double> solutionMethodOfVatars() {
    double myMin = min;
    double myMax = max;
    double error = this.error;

    double delta = 0;
    double deltaPercent = 0;

    double minY = calculate(myMin);
    double maxY = calculate(myMax);

    double dot = 0;
    double x = 0;

    if (maxY * minY < 0) {
      if (calculate(myMin) * calculate(myMin, derivativeDegree: 2) > 0) {
        dot = myMin;
      }
      if (calculate(myMax) * calculate(myMax, derivativeDegree: 2) > 0) {
        dot = myMax;
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
      return [x, delta, deltaPercent];
    } else {
      return [];
    }
  }

  List<double> solutionMethodOfUrinma() {
    double myMin = min;
    double myMax = max;
    double error = this.error;

    double delta = 0;
    double deltaPercent = 0;

    double minY = calculate(myMin);
    double maxY = calculate(myMax);

    double dot = 0;
    double x = 0;

    if (maxY * minY < 0) {
      if (calculate(myMin) * calculate(myMin, derivativeDegree: 2) > 0) {
        dot = myMin;
      }
      if (calculate(myMax) * calculate(myMax, derivativeDegree: 2) > 0) {
        dot = myMax;
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
      return [x, delta, deltaPercent];
    } else {
      return [];
    }
  }

  List<double> solutionMethodOfUrinmaModifikatsiya() {
    double myMin = min;
    double myMax = max;
    double error = this.error;

    double delta = 0;
    double deltaPercent = 0;

    double minY = calculate(myMin);
    double maxY = calculate(myMax);

    double dot = 0;
    double x = 0;

    if (maxY * minY < 0) {
      if (calculate(myMin) * calculate(myMin, derivativeDegree: 2) > 0) {
        dot = myMin;
      }
      if (calculate(myMax) * calculate(myMax, derivativeDegree: 2) > 0) {
        dot = myMax;
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
      return [x, delta, deltaPercent];
    } else {
      return [];
    }
  }
}
