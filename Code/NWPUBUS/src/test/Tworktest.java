package test;

import dao.TworkDAO;
import entity.Twork;


public class Tworktest {
	static TworkDAO tworkdao = new TworkDAO();
	public static void main(String[] args) {
		 String name = "llt";
	  	 String uid  = "2016303189";
	  	 String day = "mon";
	  	 String time  = "2016303196";
	  	 String name1 = "lly";
	  	 String uid1  = "2016303189";
	  	 String day1 = "mons";
	  	 String time1  = "2016303195";
	  	 Twork work = new Twork(name,uid,day,time);
	  	 Twork work1 = new Twork(name1,uid1,day1,time1);
	  	tworkdao.add(work);
	  	tworkdao.add(work1);
	  	tworkdao.update("tu",uid1,day1, time1);
	  	
	  	System.out.println("添加成功！");
	  	tworkdao.delete(uid1, "tu",time1);
		System.out.println("删除成功！");
	  	System.out.println(tworkdao.get(uid,day, time).getName());
	  	System.out.println(tworkdao.get(uid, day,time).getUid());
	  	System.out.println(tworkdao.get(uid, day,time).getTtime());
	  	
	}
}
