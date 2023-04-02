import 'package:petmutualaid/models/mymodels.dart';
import 'package:petmutualaid/services/localdb.dart';
import 'package:uuid/uuid.dart';

/// Function for Signing Up
String signUpF(
    MyUserModel myUser
    ){

  //
  var uuid = Uuid();

  //Check whether the user exists
  bool result = userExist(myUser.username);

  // If the user exists
  // Then Exit the function, returning null
  if (result){
    return "User Already Exists";
  }

  // Generate User Id
  myUser.id = uuid.v1();

  // Save the User to the Database
  LocalDbC.myUsersBox.put(myUser.username, myUser);

  //
  return "Success";

}

/// Function to Check if the Password & Username exist
MyUserModel? loginF(String username,String password){

  //
  MyUserModel? user = LocalDbC.myUsersBox.get(username);

  //
  if(user != null){
    if(user.password == password){
      return user;
    }
  }

  //
  user = null;

  //
  return user;

}


/// Function/Method to check if the UserName is already Taken
bool userExist(username){

  //
  var result = LocalDbC.myUsersBox.get(username);

  //
  if(result != null){
    return true;
  }

  return false;
}