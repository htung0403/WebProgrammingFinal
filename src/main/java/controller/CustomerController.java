package controller;

import entity.Customer;
import jakarta.persistence.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class CustomerController extends HttpServlet {
    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        entityManagerFactory = Persistence.createEntityManagerFactory("default");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        String email = request.getParameter("input-name");
        String password = request.getParameter("input-password");

        TypedQuery<Customer> query = entityManager.createQuery(
                "SELECT c FROM Customer c WHERE c.email = :email AND c.password = :password",
                Customer.class);
        query.setParameter("email", email);
        query.setParameter("password", password); // should be hashed and salted

        try {
            Customer customer = query.getSingleResult();
            // Login successful, store user in session and redirect to index.jsp
            request.getSession().setAttribute("user", customer);
            response.sendRedirect("index.jsp");

        } catch (NoResultException e) {
            // Login failed, redirect back to login page or show error
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public void destroy() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}

