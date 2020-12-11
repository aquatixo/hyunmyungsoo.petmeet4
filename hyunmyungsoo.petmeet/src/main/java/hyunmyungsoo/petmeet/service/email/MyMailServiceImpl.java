package hyunmyungsoo.petmeet.service.email;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.domain.Email;

@Service
public class MyMailServiceImpl implements MyMailService{
	@Autowired private JavaMailSender mailSender;
	
	@Override
	public void send(Email msg) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			message.addRecipient(RecipientType.TO, new InternetAddress(msg.getTo()));
			message.setSubject(msg.getSubject());
			message.setText(msg.getText(), "utf-8", "html");
		}catch(Exception e) {}
		
		mailSender.send(message);
	}
}