package com.bab.reset;

import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;  
  
public class SendMailSSL {  
 public boolean sendMail(String email,String password){
 
 boolean sent=false;
 
 String to=email.toLowerCase();//change accordingly  
  
  //Get the session object  
  Properties props = new Properties();  
 
  
    props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.port", "587");
   
  
  Session session = Session.getInstance(props,  
   new javax.mail.Authenticator() {  
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication("bringanybuddybab@gmail.com","BABApp_123");//change accordingly  
   }  
  });  
  
  
  
  
  //compose message  
  try {  
	  
	  
   MimeMessage message = new MimeMessage(session);  
   message.setFrom(new InternetAddress("bringanybuddy@gmail.com"));//change accordingly  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
   message.setSubject("Account Password Retrieval - BringAnyBuddy");  
   String content="Hi,\" Your password is : \""+ password+"\" You can login with your new password \" http://www.bringanybuddy.com \" Thanks,\" BAB Team";
   message.setText(content);
   message.setSentDate(new java.util.Date());
	
   System.out.println("SAending email to "+email);    
   //send message  
   Transport.send(message);  
  
   System.out.println("message sent successfully");  
   sent=true;
   return sent;
   
  } catch (MessagingException e) 
  {
	  throw new RuntimeException(e);
  }  
   
  
 }
 
 
}  