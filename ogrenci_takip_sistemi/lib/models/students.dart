class Student{
  int Id;
  String firstName;
  String lastName;
  int grade;
  String _status;


  Student.withId(int Id,String firstName, String lastName, int grade, /*String status*/){
    this.Id= Id;
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;

  }
  Student(String firstName, String lastName, int grade, /*String status*/){
    this.firstName=firstName;
    this.lastName=lastName;
    this.grade=grade;

  }

  Student.withoutInfo(){

  }
  String get getStatus{
    String message="";
    if(this.grade>=50){
      message="Geçti";
    }else if(this.grade>=40){
      message="Bütünlemeye Kaldı";
    }else{
      message="Kaldı";
    }
    return message;
  }
}