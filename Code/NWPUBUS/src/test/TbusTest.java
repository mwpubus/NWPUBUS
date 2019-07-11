package test;

import dao.*;
import entity.*;
import java.util.Date;
import java.text.SimpleDateFormat;

public class TbusTest {
	 static TbusDAO Tdao = new TbusDAO();
	 static TobusDAO TOdao = new TobusDAO();
     public static void main(String[] args) {
		String name = "孙承志";
		String uid = "d001";
		String day = "星期一";
		String start = "长安";
		String time = "06:40:00";
	
    			
     //Tdao.adtbus("孙承志", "1", "星期五", "12:00:52", "长安");
		Tdao.deleteAll();
     Tdao.replace();
	}
  
}
