package utils;

public class EmailTemplates {
    public static String generateWelcomeMail(String name, String email, String verificationCode, Integer userTypeId) {
        
        String welcomeMail = "<h1>Hello "+ name +"</h1><hr><p style='font-weight:bold;font-size:22px;color:red'>" +
        "Click on the account activation link <a href='http://localhost:8080/lms/email_verify.do?email="+ email +"&verification_code="+ verificationCode +"&user_type_id="+ userTypeId +"'>" + 
        "Activation Link</a></p>";

        return welcomeMail;
    }
}