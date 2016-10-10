<%@page import="modelo.Heroi"%>
<%@page import="modelo.Equipe"%>
<%@page import="dao.EquipeDAO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    EquipeDAO dao = new EquipeDAO();
    List<Equipe> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        //Chama o método que retorna 
        //todos os registros do Banco de Dados
        lista = dao.listar();
    }
%>  
<html>
    <a href="equipa.jsp"></a>
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

    <div class="wrapper style1">

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

        <!-- Banner 
        <div id="banner" class="container"><section><p><strong> Aqui está as equipes </strong></p></section></div>

        <form method="post">
            <input type="text" name="txtFiltro" placeholder="digite o texto da pesquisa" />
            <input type="submit" value="Pesquisar"/>
        </form>

        -->
        <%
            for (Equipe item : lista) {
        %>


        <br/><br/>
        <div class="box">
            <h2><%=item.getNome()%></h2>   
            <p><%=item.getDescricao()%></p>
        </div>
        <br/><br/><br/><br/><br/>

        <div id="extra">
            <div class="container">
                <div class="row no-collapse-1">

                    <%
                        for (Heroi hero : item.getHeroiList()) {
                    %>

                    <section class="4u"> <a href="#" class="image featured"><img src="../fotos/<%=hero.getFoto()%>" alt="" width="50" height="250"></a>
                        <div class="box">
                            <h2> <%=hero.getCodinome()%></h2><br/>
                            <p> Nome: <strong> <%=hero.getNome()%> </strong><br/>
                                Descrição: <strong> <%=hero.getDescricao()%> </strong><br/>
                                Inteligência: <strong> <%=hero.getInteligencia()%> </strong><br/>
                                Velocidade: <strong> <%=hero.getVelocidade()%> </strong><br/>
                                Resistência: <strong> <%=hero.getResistencia()%> </strong><br/>
                                Força: <strong> <%=hero.getForca()%> </strong><br/>
                                Projeção de Energia: <strong> <%=hero.getProjecaoenergia()%> </strong><br/>
                                Habilidade em Combate: <strong> <%=hero.getHabilidadecombate()%> </strong><br/>
                                Categoria: <strong> <%=hero.getCategoria().getNome()%> </strong><br/>
                                Editora:<strong> <%=hero.getEditora().getNome()%></strong><br/>
                                Região: <strong> <%=hero.getRegiao().getNome()%> </strong><br/>
                            </p>
                        </div>
                        <br/>
                        <br/>
                    </section>
                    <%}%>
                </div></div></div><br/><br/><br/><%}%></div></body></html>