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
        String body = "Dear "+ to +",\n\n"
                + "We hope this message finds you well.\n\n"
                + "As part of our commitment to security and privacy, we have processed your request to reset your password. Below, you will find your new login credentials:\n\n"
                + "New Password: " + newPassword + "\n\n"
                + "For your security, please log in with your new password at your earliest convenience and consider changing it to a personalized password of your choice.\n\n"
                + "If you did not initiate this password reset or have any concerns, please contact our support team immediately.\n\n"
                + "Thank you for choosing Luxury Spa.\n\n"
                + "Best regards,\n"
                + "Luxury Spa Team";
        sendEmail(to, subject, body);

    }

    public static void sendRegistrationConfirmationEmail(String to, String username) {
        String subject = "Registration Confirmation";
        String body = "Dear "+ username +",\n\n"
                + "Thank you for registering with our service. We are delighted to welcome you to our community!\n\n"
                + "You are now part of Luxury Spa Team. Here are a few things you can do:\n"
                + "- Explore our features and services\n"
                + "- Connect with other users\n"
                + "- Customize your profile settings\n\n"
                + "If you have any questions or need assistance, feel free to reach out to our support team.\n\n"
                + "Once again, welcome aboard!\n\n"
                + "Best regards,\n"
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

            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
