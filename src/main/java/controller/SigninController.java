package controller;

import entity.Customer;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Properties;

@WebServlet("/register")
public class SigninController extends HttpServlet {
    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        String name = request.getParameter("name");
        String userName = request.getParameter("username");
        String password = request.getParameter("password"); // should be hashed and salted
        String address = request.getParameter("address");
        String telNumber = request.getParameter("telNumber");

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(userName);
        customer.setPassword(password);
        customer.setAddress(address);
        customer.setTelNumber(telNumber);

        entityManager.getTransaction().begin();
        entityManager.persist(customer);
        entityManager.getTransaction().commit();

        // Registration successful, redirect to login page
        response.sendRedirect("login.jsp");

        // Send email
        EmailSender.sendRegistrationConfirmationEmail(customer.getEmail(), customer.getName());

    }

    @Override
    public void destroy() {
        entityManagerFactory.close();
    }

}
