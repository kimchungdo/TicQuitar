
String intToStar(int num){
  String result = "";
  int temp = 5-num;
  result = "★" * num + "☆" * temp;
  return result;
}