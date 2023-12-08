package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import static controller.EmailSender.sendConfirmEmail;

@WebServlet("/request-info")
public class RequestInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String message = request.getParameter("message");

        sendConfirmEmail(email, name);

        // Redirect or forward to a success page...
        response.sendRedirect("index.jsp");
    }
}
