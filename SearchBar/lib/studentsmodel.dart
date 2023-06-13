

class StudentsModel {

  String? name;
  int? age;
  String? grade;

  StudentsModel(this.name, this.age, this.grade);
}

List<StudentsModel> students = [
  StudentsModel("Waqas", 21, 'grade: A'),
  StudentsModel("Afzal", 21, 'grade: B'),
  StudentsModel("Adam", 21, 'grade: D'),
  StudentsModel("Babar", 21, 'grade: C'),
  StudentsModel("Ahsan", 21, 'grade: F'),
  StudentsModel("Azeem", 21, 'grade: A'),

];