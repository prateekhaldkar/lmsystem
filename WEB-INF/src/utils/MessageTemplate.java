package utils;

public class MessageTemplate {
    public static String getSignupSuccessMessage(){
        String signupSuccessMessage = "Account Created. check email to verify your email";

        return signupSuccessMessage;
    }

    public static String getEmailVerificationSuccessMessage(){

        String emailVerificationSuccessMessage = "Your Email is verified. Panding Your Mannual Verification.";

        return emailVerificationSuccessMessage;
    }

    public static String getIncorrectEmailMessage(){
        String incorrectEmailMessage = "Incorrect Email, Please Check";

        return incorrectEmailMessage;
    }

    public static String getInvalidPasswordMessage(){
        String invalidEmailMessage = "Incorrect Password, Please check";

        return invalidEmailMessage;
    }

    public static String getIncompleteEmailVerificationMessage(String email){
        String hiddenEmail = AppUtil.partiallyHiddenEmail(email);

        String  incompleteEmailVerificationmessage ="Click On the Link --> <a href='resend_verification_mail.do?email=" + email + "'>Resend Verification Mail</a> to resend the Email Verification Link... on " + hiddenEmail;

        return incompleteEmailVerificationmessage;
    }

    public static String getResendEmailVerificationSuccessMessage(String email){
        String resendEmailVerificationSuccessMessage = "Email verification link has been sent to " + AppUtil.partiallyHiddenEmail(email) + "Verify your account...!";

        return resendEmailVerificationSuccessMessage;
    }

    public static String getIncompleteManualVerificationMessage() {
        String incompleteManualVerificationMessage = "Manual Verification is Under Process...";

        return incompleteManualVerificationMessage;
    }
}
