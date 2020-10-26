package utils;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class Send {

	public static void sendEmail(String email) {
		String smtphost = "smtp.126.com"; // 发送邮件服务器
		String user = "cno700@126.com"; // 邮件服务器登录用户名
		String password = "cno70000"; // 邮件服务器登录密码
		String from = "cno700@126.com"; // 发送人邮件地址
		String to = email; // 接受人邮件地址
		String subject = "接收您的密改验证码"; // 邮件标题
		String body = "您的验证码是：698045"; // 邮件内容


		// 以下为发送程序，用户无需改动
		try {
		Properties props = new Properties();
		props.put("mail.smtp.host", smtphost);
		props.put("mail.smtp.auth","true");
		Session ssn = Session.getInstance(props, null);

		MimeMessage message = new MimeMessage(ssn);

		InternetAddress fromAddress = new InternetAddress(from);
		message.setFrom(fromAddress);
		InternetAddress toAddress = new InternetAddress(to);
		message.addRecipient(Message.RecipientType.TO, toAddress);

		message.setSubject(subject);
		message.setText(body);

		Transport transport = ssn.getTransport("smtp");
		transport.connect(smtphost, user, password);
		transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
		//transport.send(message);
		transport.close();
		} catch(Exception m) {
			m.printStackTrace();
		}
	}
}
