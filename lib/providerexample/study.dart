void main(){


StudentDetails(name: 'Riyas', sports:null);


}


void StudentDetails({
  required String  name,
  required String? sports
}){

  print("Name:" + name);
  print("Sports:" + sports!);



}