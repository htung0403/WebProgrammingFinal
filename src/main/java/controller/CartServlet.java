package controller;

import entity.*;
import entity.LinesItem;
import database.ProductDB;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/index.jsp";
        ServletContext sc = getServletContext();
        String action = request.getParameter("action");
        if (action == null) {
            action = "cart";
        }
        if (action.equals("shop")) {
            url = "/shop.jsp";
        }
        else if (action.equals("cart")) {
            Integer productCode = request.getParameter("productId") == null ? 0 : Integer.parseInt(request.getParameter("productId"));
            String quantityString = request.getParameter("quantity");
            String type = request.getParameter("update");
            if(type == null) type = "false";
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            int quantity;
            try {
                quantity = Integer.parseInt(quantityString);
                if (quantity < 0) {
                    quantity = 1;
                }
            } catch (NumberFormatException nfe) {
                quantity = 1;
            }

            Product product = ProductDB.getProductById(productCode);
            LinesItem lineItem = new LinesItem();
            lineItem.setProduct(product);
            lineItem.setQuantity(quantity);


            if (quantity > 0) {
                cart.addItem(lineItem, type);
                Collection<LinesItem> lineItems = cart.getItems();
                List<Product> customerPurchasedProducts = new ArrayList<>();
                for (LinesItem lineItem1 : lineItems){
                    customerPurchasedProducts.add((Product) lineItem1.getProduct());
                }

            } else if (quantity == 0) {
                cart.removeItem(lineItem);
            }
            session.setAttribute("cart", cart);
            url = "/cart.jsp";
        }
        else if (action.equals("checkout")) {
            url = "/checkout.jsp";
        }
        else if (action.equals("back")) {
            HttpSession session = request.getSession();
            // Xóa giỏ hàng hiện tại từ session
            session.removeAttribute("cart");
            url = "/index.jsp";
        }
        sc.getRequestDispatcher(url)
                .forward(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
