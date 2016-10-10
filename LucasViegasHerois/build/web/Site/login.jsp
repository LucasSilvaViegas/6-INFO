<%-- 
    Document   : login
    Created on : 25/05/2016, 22:02:04
    Author     : Cliente
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HeroiDAO dao = new HeroiDAO();
    List<Heroi> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }
%>

<%
    if (request.getParameter("txtLogin") != null && request.getParameter("txtSenha") != null) {
        String loginCerto = "Admin";
        String senhaCerta = "123";

        if (request.getParameter("txtLogin").equals(loginCerto) && request.getParameter("txtSenha").equals(senhaCerta)) {
            session.setAttribute("usuario", request.getParameter("txtLogin"));
            response.sendRedirect("index.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        
    </head>
    <body>
        <div id="loginbar">
            <%if (session.getAttribute("usuario") != null) {%>
            Bem vindo, <span><%=session.getAttribute("usuario")%></span> - <a href="logoff.jsp">Logoff</a>
            <%  } else {  %>
            Bem vindo, faça login para ter acesso ao seu baralho.
            <%  }  %>                                                         
        </div>

        <div id="body">
            <div id="background" class="background6">
                <div>
                    <div>
                        <form method="post">
                            <div    id="login22">
                                <label><h2>Login:</h2></label>
                                <input type="text" name="txtLogin" size="32" placeholder="Digite o login" required id="login21"/><br />     
                                <label><h2>Senha:<h2/></label>   
                                <input type="text" name="txtSenha" size="32" placeholder="Digite a senha" required/><br /> 
                                <input type="submit" value="Entrar"/><br />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
        <a href="index.jsp"><div class="box">HOME PAGE</div></a>
    </body>
</html>