class Hotel{
  var _roomNumber = 0;
  int capacity = 100, _cost = 0;
  Map<int, int> _classes = {
    1 : 3500,
    2 : 1500,
    3 : 500
  };
  late Map<String, int> _arr;
  addRoom(int choose, String name){
    capacity--;
    _roomNumber++;
    _cost = _classes[choose] as int;
    _arr = {name : _roomNumber};
    print("Your room number is ${_roomNumber} and cost: $_cost");
  }
  removeRoom(String name){
    capacity++;
    _roomNumber--;
    _arr.remove(name);
  }
}