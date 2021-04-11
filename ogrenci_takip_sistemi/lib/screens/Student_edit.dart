import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/students.dart';
import 'package:ogrenci_takip_sistemi/validation/student_validation.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent){
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentAddState(selectedStudent){
    this.selectedStudent=selectedStudent;
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Seren"),
      validator: validateFirstName,
      onSaved: (String value){
        selectedStudent.firstName = value;
      },
    );
  }
  Widget buildLastNameField(){
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Öğrenci Soyadı", hintText: "Akyüz"),
      validator: validateLastName,
      onSaved: (String value){
        selectedStudent.lastName = value;
      },
    );
  }
  Widget buildGradeField(){
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String value){
        selectedStudent.grade =int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          savedStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void savedStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}