package controller;

import entity.Customer;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get new user information from request parameters
        String name = req.getParameter("name");
        String address = req.getParameter("address");
        String telNumber = req.getParameter("telNumber");
        String userName = req.getParameter("userName");

        // Get the user object from the session
        HttpSession session = req.getSession();
        Customer user = (Customer) session.getAttribute("user");

        // Update the user object if the parameters are not null
        if (name != null) {
            user.setName(name);
        }
        if (address != null) {
            user.setAddress(address);
        }
        if (telNumber != null) {
            user.setTelNumber(telNumber);
        }
        if (userName != null) {
            user.setEmail(userName);
        }

        // Use JPA to update the user in the database
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(user);
        em.getTransaction().commit();

        // Redirect back to the profile page
        resp.sendRedirect("profile.jsp");
    }
}