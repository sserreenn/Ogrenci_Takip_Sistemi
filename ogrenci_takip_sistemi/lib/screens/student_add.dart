import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/students.dart';
import 'package:ogrenci_takip_sistemi/validation/student_validation.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student>students){
    this.students=students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student>students){
    this.students=students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Öğrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
  }
  Widget buildFirstNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Seren"),
      validator: validateFirstName,
      onSaved: (String value){
        student.firstName = value;
      },
    );
  }
  Widget buildLastNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Akyüz"),
      validator: validateLastName,
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }
  Widget buildGradeField(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String value){
        student.grade =int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          students.add(student);
          savedStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void savedStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}