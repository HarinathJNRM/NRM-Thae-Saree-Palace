package com.nrmpattusaries.filter;


import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

@WebFilter({

    "/sareelist",
    "/sareeview",
    "/cart",
    "/checkout",
    "/orders"

})

public class UserFilter implements Filter {

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

        chain.doFilter(request, response);
    }
}
