package test;

import dao.UserDAO;
import entity.User;

public class UserTest {
	 static UserDAO userdao = new UserDAO();
     public static void main(String[] args) {
    	  	 //String name = "llt";
    	  	 String uid  = "2016303189";
    	  	 //String uids  = "2016303196";
    		// String password = "12345";
    		// String tel  = "1123";
    		 //String utype = "23322";
  	  // User user = new User(name,uid,password,tel,utype);
  	  //userdao.add(user);
  	  //userdao.delete(uid);
  	  //userdao.update(uid, password+"x");
 	  User users = userdao.get(uid);
  	  System.out.println(users.getPassword());
	}
  
}
