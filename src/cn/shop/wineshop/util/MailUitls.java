package cn.shop.wineshop.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * 发送邮件类
 * 
 * @author zoushun
 *
 */
public class MailUitls {
	/**
	 * 发送邮件的方法
	 * 
	 * @param to
	 *            :收件人
	 * @param code
	 *            :激活码
	 * @throws MessagingException
	 * @throws AddressException
	 */
	public static void sendMail(String to, String code) throws AddressException, MessagingException {
		/**
		 * 1.获得一个Session对象. 2.创建一个代表邮件的对象Message. 3.发送邮件Transport
		 */
		// 1.获得连接对象
		Properties properties = new Properties();
		properties.put("mail.transport.protocol", "smtp");// 连接协议
		properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
		properties.put("mail.smtp.port", 465);// 端口号
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
		properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
		// 得到回话对象
		Session session = Session.getInstance(properties);
		// 获取邮件对象
		Message message = new MimeMessage(session);
		// 设置发件人邮箱地址
		message.setFrom(new InternetAddress("1677474181@qq.com"));
		// 设置收件人地址 m
		message.setRecipients(RecipientType.TO, new InternetAddress[] { new InternetAddress(to) });
		// 抄送 CC 密送BCC
		// 设置标题
		message.setSubject("来自美酒之家官方官方激活邮件");
		// 设置邮件正文:
		message.setContent(
				"<h1>美酒之家官方激活邮件!点下面链接完成激活操作!</h1><h3><a href='http://192.168.33.24:8080/ssh_WinShop/user_active.action?code="
						+ code + "'>http://192.168.33.24:8080/ssh_WinShop/user_active.action?code=" + code
						+ "</a></h3>",
				"text/html;charset=UTF-8");
		// 3.发送邮件:

		// 得到邮箱对象
		Transport transport = session.getTransport();
		// 连接自己的邮箱账户
		transport.connect("1677474181@qq.com", "bzbidedidkgzecjh");// 密码为刚才得到的授权码
		// 发送邮件
		transport.sendMessage(message, message.getAllRecipients());
	}

	public static void main(String[] args) {
		try {
			sendMail("aaa@shop.com", "11111111111111");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
