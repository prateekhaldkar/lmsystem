package utils;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
    public static String fromEmail;
    public static String password;

    private static class EmailAuthenticator extends Authenticator {
     
        public PasswordAuthentication getPasswordAuthentication () {
     
            return new PasswordAuthentication(fromEmail, password);
        }
    }

    public static void sendEmail(String to, String subject, String emailContent){
        Properties props = new Properties();

        props.put("email.Transport.protocol","smtp");
        props.put("mail.smtp.host", "smtp-mail.outlook.com");
        props.put("mail.smtp.port","587");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.starttls.enable","true");

        Session emailSession = Session.getInstance(props, new EmailAuthenticator());

        MimeMessage message = new MimeMessage(emailSession);

        try{

            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(RecipientType.TO,to);
            message.setSubject(subject);
            message.setContent(emailContent,"text/html");

            Transport.send(message);

        }catch(MessagingException e){
            e.printStackTrace();
        }
    } 
}
