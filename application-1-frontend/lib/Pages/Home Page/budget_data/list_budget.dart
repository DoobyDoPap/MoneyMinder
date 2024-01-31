import 'package:MoneyMinder/Pages/Home%20Page/budget_data/money.dart';


List<money> geter() {
  money fiverr = money();
  fiverr.name = 'fiverr';
  fiverr.fee = '650';
  fiverr.time = 'today';
  fiverr.image = 'fiverr.png';
  fiverr.buy = false;
  money starbucks = money();
  starbucks.buy = true;
  starbucks.fee = '350';
  starbucks.image = 'star.png';
  starbucks.name = 'starbucks';
  starbucks.time = 'today';
  money trasfer = money();
  trasfer.buy = true;
  trasfer.fee = '100';
  trasfer.image = 'Transfer.png';
  trasfer.name = 'trasfer for dubey';
  trasfer.time = 'jan 30,2022';
  return [fiverr, starbucks, trasfer, fiverr, starbucks, trasfer];
}