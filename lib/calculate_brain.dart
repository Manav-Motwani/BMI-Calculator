import 'dart:math';

class CalculateBrain{
  CalculateBrain({this.weight,this.fheight,this.inheight});

  final int fheight;
  final int inheight;
  final int weight;

  double _bmi;

  String calculateBMI(){

    double h = fheight/3.2808;
    h += inheight/39.370;
    _bmi = weight/pow(h, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if (_bmi>=25){
      return 'Overweight';
    }
    else if(_bmi>=18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if (_bmi>=25){
      return 'You have a higher than normal body weight. Try exercise more.';
    }
    else if(_bmi>=18.5){
      return 'You have a Normal body weight. Good Job.';
    }
    else{
      return 'You have a Lower than normal body weight. You can eat bit more.';
    }

  }

}