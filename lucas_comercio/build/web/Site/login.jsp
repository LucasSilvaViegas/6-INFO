<%@page import="util.Criptografia"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="cabecalho.jsp" %>
<%    if (request.getMethod().equals("POST")) {
        ClienteDAO dao = new ClienteDAO();
        List<Cliente> cliente = dao.listar();
        for (Cliente item : cliente) {
            if (request.getParameter("txtEmail").equals(item.getEmail()) && Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")).equals(item.getSenha())) {
                session.setAttribute("usuario", item);
            response.sendRedirect("index.jsp");
            }
        }
    }
%>



        <script>
            // Can also be used with $(document).ready()
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>
    </head>
    <body>
        <div class="content">
            <div class="main-1">
                <div class="container">
                    <div class="login-page">
                        <div class="account_grid">
                            <div class="col-md-6 login-left">
                                <h3>Novos Clientes</h3>
                                <p>Ao criar uma conta em nossa loja, você será capaz de fazer compras, receber novidades, obter cupons de disconto, entre outras novidades.</p>
                                <a class="acount-btn" href="newaccount.jsp">Criar uma conta</a>
                            </div>
                            <div class="col-md-6 login-right">
                                <h3>Registro de Clientes</h3>
                                <p>Se você já possuir uma conta conosco, por favor logue-se.</p>
                                <form method="POST">
                                    <div>
                                        <span>Email<label>*</label></span>
                                        <input type="text" name="txtEmail"> 
                                    </div>
                                    <div>
                                        <span>Senha<label>*</label></span>
                                        <input type="password" name="txtSenha"> 
                                    </div>
                                    <input type="submit" value="ENTRAR" >
                                </form>
                            </div>	
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </body>
</html>
<%@include file="rodape.jsp" %>