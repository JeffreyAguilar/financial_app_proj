class Profile{
  late String name;
  late String accountnum;
  late int age;
}

bool isChild({
  required age,
}) {
  if (age < 18){
    return true;
  }
  else{
    return false;
  }
}
