<%@page import="java.util.List"%>
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%
        JogadorDAO jDAO = new JogadorDAO();
        List<Jogador> lista = jDAO.listar();
    %>

    <!DOCTYPE HTML>



    <head>
        <title>Heróis da Galáxia!</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.dropotron.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-layers.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/style-wide.css" />
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
    </head>


    <!-- Wrapper -->
    <div class="kkj">

        <!-- Header -->
        <div id="header" class="skel-panels-fixed">
            <div id="logo">
                <h1><a href="index.jsp">Super Herois</a></h1>
                <span class="tag">by LUCAS VIEGAS</span>
            </div>
            <nav id="nav">
                <ul>
                                       <li class="active"><a href="index.jsp">Homepage</a></li>
                        <li><a href="../Admin/login.jsp">Cadastro</a></li>
                        <li><a href="equipa.jsp">Equipes</a></li>
                            <%if (session.getAttribute("usuario") != null) {%>
                        <li>
                            <a class="login" href="Cartas Heróis">JOGAR!</a>
                        </li>
                        <li><a href="jogador.jsp">Jogadores</a></li>
                        <li><a href="logoff.jsp">Logoff</a></li>
                            <%  } else {  %>
                        <li>
                            <a class="login" href="login.jsp">Login</a>
                        </li>
                        <%  }  %>                

                </ul>
            </nav>
        </div>

        <!-- Banner -->
        <div id="banner" class="container">
            <section>

                <p><strong> Aqui está a lista de Jogadores </strong></p>

            </section>
        </div>

        <!-- Extra -->

        <div id="extra">

            <div class="container">
                <div class="row no-collapse-1">
                    <%
                        for (Jogador player : lista) {
                    %>
                    <div id="extra">
                        <div class="container">
                            <div class="row no-collapse-1">
                                <section class="4u">
                                    <div class="box">
                                        <p><strong> <%=player.getLogin()%></strong></p>
                                        <p><%=player.getEmail()%></p>
                                    </div>
                                    <br/>
                                </section>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
