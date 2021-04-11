class StudentValidationMixin{
  String validateFirstName(String value){
    if(value.length<2) {
      return "İsim en az iki karakterli olmalıdır.";
    }
  }

  String validateLastName(String value){
    if(value.length<2) {
      return "Soyad en az iki karakterli olmalıdır.";
    }
  }

  String validateGrade(String value){
    var grade= int.parse(value);
    if(grade<0 || grade>100){
      return "Notunuz 0 ile 100 arasında olmalıdır.";
    }
  }
}
