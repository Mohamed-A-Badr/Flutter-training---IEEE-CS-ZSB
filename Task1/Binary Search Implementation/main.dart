void main() {
  List<int> arr = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
  int target = 25;
  int left = 0;
  int right = arr.length - 1;
  bool found = false;
  while(right > left+1){
    int avg = ((right + left) / 2).floor();
    if(target == arr.elementAt(avg)) {
      found = true;
      print("Target Found.\n");
      break;
    } else if(target < arr.elementAt(avg)) {
      right = avg;
    } else {
      left = avg;
    }
  }
  if(found == false){
    print("Target not found.\n");
  }
}
