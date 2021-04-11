import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/screens/Student_edit.dart';
import 'package:ogrenci_takip_sistemi/screens/student_add.dart';

import 'models/students.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";
  Student selectedStudent = Student.withId(0,"", "", 0);

  List<Student> students = [
    Student.withId(1,"Umut", "AKSELOĞLU", 85),
    Student.withId(2,"Seren", "AKYÜZ", 50),
    Student.withId(3,"İlayda", "AKDERE", 25)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        //backgroundImage: NetworkImage(""),
                      ),
                      title: Text(students[index].firstName +
                          " " +
                          students[index].lastName),
                      subtitle: Text("Sınavdan Aldığı Not : " +
                          students[index].grade.toString()),
                      trailing: buildStatusIcon(students[index].grade),
                      onTap: () {
                        setState(() {
                          selectedStudent = students[index];
                        });
                        print(selectedStudent);
                      },
                    );
                  })),
          Text("Seçilen Öğrenci : " + selectedStudent.firstName),
          Row(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.lightGreenAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 0.5),
                      Text("Yeni Öğrenci"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.amberAccent,
                  child: Row(
                    children: [
                      Icon(Icons.update),
                      SizedBox(width: 5.0),
                      Text("Güncelle"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
                  },
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 5.0),
                      Text("Sil"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });

                    var mesaj = "Öğrenci Silindi " + selectedStudent.firstName;
                    mesajGonder(context, mesaj);
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }



  void mesajGonder(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildStatusIcon(int grade) {
    if (grade > 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
