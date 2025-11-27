package org.cosmo.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void sendSimpleMail(String to, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
	     message.setTo(to);
	        message.setSubject(subject);
	        message.setText(text);
	        mailSender.send(message);
	    }
	
    public void sendHtmlMail(String to, String subject, String htmlMsg) throws Exception {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(htmlMsg, true);

        mailSender.send(message);
    }
	
	}

