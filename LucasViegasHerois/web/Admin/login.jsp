<%

    if (request.getParameter("L") != null && request.getParameter("S") != null) {
        String LC = "AdminLucasSilvaViegasIFSUL2016";
        String SC = "123AdminLucasSilvaViegasIFSUL2016";
        if (request.getParameter("L").equals(LC) && request.getParameter("S").equals(SC)) {
            session.setAttribute("usuario", request.getParameter("L"));
            response.sendRedirect("home");
        }
    }

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login.jsp" method="post">
            <label> Login </label><input type="text" name="L" required><br/>
            <label> Senha </label><input type="password" name="S" required><br/>
            <input type="submit" value="ENTRAR" />
            <a href="#">Esqueci a senha</a>
        </form>
    </body>
</html>
