class UserModel{
  String photo;
  String name;
  String id;

  UserModel({
    @override this.photo,
    @override this.name,
    @override this.id,

  });

  UserModel.fromMap(Map<String, dynamic> map){
    photo=map["pp"];name=map["nick"];id=map["id"];
  }
}

UserModel userModel;