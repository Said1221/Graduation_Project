class RegisterModel{

  late String name;
  late String email;
  late String phone;
  late String Uid;

  RegisterModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.Uid,
});

  RegisterModel.fromJson(Map<String , dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    Uid = json['Uid'];
  }

  Map<String , dynamic>toMap(){
    return{
      'name' : name,
      'email' : email,
      'phone' : phone,
      'Uid' : Uid,
    };
  }

}