package egovframework.example.sendmail.web;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class MailLinux {

	public static Message message = null;

	public static void createMail() {

		MimeBodyPart mbp = new MimeBodyPart();

		try {

			// 메일 제목 넣기

			message.setSubject("집에갑시다!!!");

			// 메일 본문을 넣기

			message.setContent("<h1>Hello world</h1>", "text/html");

			// 보내는 날짜

			message.setSentDate(new Date());

			// 보내는 메일 주소

			message.setFrom(new InternetAddress("knd@naver.com"));
			InternetAddress[] receive_address = { new InternetAddress("5jose7@naver.com") };
			message.setRecipients(RecipientType.TO, receive_address);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void connectSMTP() {
		Properties prop = new Properties();
		// 사내 메일 망일 경우 smtp host 만 설정해도 됨 (특정 포트가 아닐경우)
		prop.put("mail.smtp.host", "192.168.110.17");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.port", "25");

		Session session = Session.getDefaultInstance(prop, null);

		try {

			message = new MimeMessage(session);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public static void sendMail() {

		try {

			Transport.send(message);
			System.out.println("메일전송 성공 !!");

		} catch (MessagingException e) {
			System.out.println("메일전송 실패 !!");
			e.printStackTrace();

		}

	}

	public static void main(String[] args) {

		connectSMTP();
		createMail();
		sendMail();

	}
}
