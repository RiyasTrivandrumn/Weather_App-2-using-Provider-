
void main(){

 Map<String, dynamic> json = {
  "id": '2',
  "name": 'riyas',
  "course": 'Science',
  "adress": 'vazhppally  veedu',
  "status": 0
 };


 Student s1=Student.fromJson(json);

 print(s1.adress);


 final studentjson =s1.toJson();

 print(studentjson);
 

}







class Student{

String?id;
String?name;
String?course;
String?adress;
int? status;
 
 Student({this.id,this.name,this.course,this.adress,this.status});



  // dart  <---json

 factory Student.fromJson(Map<String,dynamic>json){


  return Student(
    id:json['id'],
    name:json['name'],
    course:json['course'],
    adress:json['adress'],
    status:json['status']

  );




 }
 Map<String,dynamic> toJson(){

    final Map<String,dynamic> data=Map();


    data['id'] =id;
    data['name']=name;
    data['course'] =course;
    data['adress'] =adress;
    data['status'] = status;
 
    return data;


 }






}