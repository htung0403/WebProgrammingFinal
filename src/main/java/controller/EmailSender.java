package controller;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class EmailSender {
    private static final String FROM_EMAIL = "serverwonderlandvn@gmail.com";
    private static final String EMAIL_PASSWORD = "gtto buuu tnoe flcp";


    public static void sendForgetPasswordEmail(String to, String newPassword) {
        String subject = "Luxury Spa - Password Reset";
        String body = "Dear "+ to +",<br><br>"
                + "We hope this message finds you well.<br><br>"
                + "As part of our commitment to security and privacy, we have processed your request to reset your password. Below, you will find your new login credentials:<br><br>"
                + "New Password: " + newPassword + "<br><br>"
                + "For your security, please log in with your new password at your earliest convenience and consider changing it to a personalized password of your choice.<br><br>"
                + "If you did not initiate this password reset or have any concerns, please contact our support team immediately.<br><br>"
                + "Thank you for choosing Luxury Spa.<br><br>"
                + "Best regards,<br>"
                + "Luxury Spa Team";
        sendEmail(to, subject, body);
    }

    public static void sendConfirmEmail(String to, String name) {
        String subject = "Let's Cafe";
        String body = " " + name + "<br><br>"
                + "Chúng tôi đã nhận được thông tin của bạn<br><br>"
                + "Let's Cafe sẽ liên hệ lại bạn trong thời gian gần nhất<br>"
                + "Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi<br><br>"
                + "Let's Cafe";
        sendEmail(to, subject, body);
    }
    public static void sendRegistrationConfirmationEmail(String to, String username) {
        String subject = "Registration Confirmation";
        String body = "Dear "+ username +",<br><br>"
                + "Thank you for registering with our service. We are delighted to welcome you to our community!<br><br>"
                + "You are now part of Luxury Spa Team. Here are a few things you can do:<br>"
                + "- Explore our features and services<br>"
                + "- Connect with other users<br>"
                + "- Customize your profile settings<br><br>"
                + "If you have any questions or need assistance, feel free to reach out to our support team.<br><br>"
                + "Once again, welcome aboard!<br><br>"
                + "Best regards,<br>"
                + "Luxury Spa Team";

        sendEmail(to, subject, body);
    }
    private static void sendEmail(String to, String subject, String body) {
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");

        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);
            message.setContent(body, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
