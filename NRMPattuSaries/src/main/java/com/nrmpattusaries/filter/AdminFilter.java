package com.nrmpattusaries.filter;


import java.io.IOException;

import com.nrmpattusaries.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

@WebFilter({

    "/admin-dashboard",
    "/AdminSareeList",
    "/AdminViewSaree",
    "/EditSaree",
    "/DeleteSaree",
    "/manage-users",
    "/admin-orders"

})

public class AdminFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)

            throws IOException, ServletException {

        HttpServletRequest req =
                (HttpServletRequest) request;

        HttpServletResponse res =
                (HttpServletResponse) response;

        HttpSession session =
                req.getSession(false);

        // NOT LOGGED IN
        if(session == null ||
           session.getAttribute("user") == null) {

            res.sendRedirect("login");

            return;
        }

        User user =
        (User) session.getAttribute("user");

        // NOT ADMIN
        if(!"ADMIN".equals(user.getRole())) {

            res.sendRedirect("sareelist");

            return;
        }

        // ADMIN ALLOWED
        chain.doFilter(request, response);
    }
}