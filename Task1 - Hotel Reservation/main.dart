import 'dart:io';
import './Hotel System.dart';
main(){
  var hotel = Hotel();
  print("Do you want a Room (Yes, No): ");
  var answer = (stdin.readLineSync())!.toLowerCase();
  if(answer == "yes"){
    int choose = 0;
    while(true) {
      stdout.writeln("""
      What type of room you want
      1. Luxury Room
      2. Normal Room
      3. Budget Room
      4. Remove Client
      5. Exit
      Empty room: ${hotel.capacity} 
      Enter your choose: """);
      choose = takeInteger();
      String? name;
      if(choose == 5) {
        print("Good Bye.");
        break;
      } else if(choose == 4){
        print("Client Name: ");
        name = stdin.readLineSync();
        hotel.removeRoom(name!);
        print("-------------------------");
      }
      else {
        print("Enter your name: ");
        name = stdin.readLineSync();
        hotel.addRoom(choose, name!);
        print("-------------------------");
      }
    }
  }
  else if(answer == "no"){
    print("Good Bye.");
  }
}

takeInteger(){
  String? s = stdin.readLineSync();
  if (s != null){
    int num = int.parse(s);
    return num;
  }
}