
//숫자들어오면 별내보내는 함수만들어야하는디 ㅋㅋ

String intToStar(int num){
  String result = "";
  int temp = 5-num;
  result = "★" * num + "☆" * temp;
  return result;
}