package test;


import dao.VworkDAO;
import entity.Vwork;

public class VworkTest {
	static VworkDAO vworkdao = new VworkDAO();
	public static void main(String[] args) {
		 String name = "llt";
	  	 String uid  = "2016303189";
	  	 String time  = "2016303196";
	  	 String name1 = "lly";
	  	 String uid1  = "2016303189";
	  	 String time1  = "2016303195";
	  	 Vwork work = new Vwork(name,uid,time);
	  	 Vwork work1 = new Vwork(name1,uid1,time1);
	  	vworkdao.add(work);
	  	vworkdao.add(work1);
	  	vworkdao.update(uid, time, "0");
	  	
	  	System.out.println("添加成功！");
	  	vworkdao.delete(uid1, time1);
		System.out.println("删除成功！");
	  	System.out.println(vworkdao.get(uid1, time1).getName());
	  	System.out.println(vworkdao.get(uid1, time1).getUid());
	  	System.out.println(vworkdao.get(uid1, time1).getTime());
	  	
	}
}  
