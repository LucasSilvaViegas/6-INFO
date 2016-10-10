
<%@page import="modelo.Equipe"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>
<%@page import="dao.HeroiDAO"%>
<%@page import="modelo.Heroi"%>

<%
    HeroiDAO dao = new HeroiDAO();
    List<Heroi> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }
%>

<!DOCTYPE HTML>
<!--
        Phase Shift by TEMPLATED
        templated.co @templatedco
        Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>


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
    <body>
     
        <!-- Wrapper -->
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

            <!-- Banner -->
            <div id="banner" class="container">
                <section>

                    <%if (session.getAttribute("usuario") != null) {%>
                    Olá, <span><%=session.getAttribute("usuario")%></span>. 
                    <p>Bem-vindo ao <strong>Super Heroes</strong>, veja seus heróis favoritos aqui.
                        <%  } else {  %>
                    <p>Bem-vindo ao <strong>Super Heroes</strong>, veja seus heróis favoritos aqui. 
                        <%  }  %>      

                </section>
            </div>

            <!-- Extra -->
            <div id="banner" class="container">
                <section>
                    <form method="post">
                        <!--  Monta o filtro  -->
                        <input type="text" name="txtFiltro" placeholder="Digite o texto da pesquisa" />


                        OU selecione uma Editora:
                        <%
                            EditoraDAO eDAO = new EditoraDAO();
                            List<Editora> eLista = eDAO.listar();
                        %>


                        <select name="selEditora">
                            <option value="">Selecione</option>
                            <%
                                for (Editora ed : eLista) {
                            %>
                            <option value="<%=ed.getNome()%>"><%=ed.getNome()%></option>
                            <%
                                }
                            %>

                        </select>
                            
                        <input type="submit" value="Pesquisar"/><br />
                        
                        
                    </form>
                </section>
            </div>

            <div id="extra">
                <div class="container">
                    <div class="row no-collapse-1">


                        <%
                            if (request.getParameter("txtFiltro") != null && !request.getParameter("txtFiltro").isEmpty()) {
                                lista = dao.listar(request.getParameter("txtFiltro"));
                            } else if (request.getParameter("selEditora") != null && !request.getParameter("selEditora").isEmpty()) {
                                lista = dao.listar(request.getParameter("selEditora"));
                            } else {
                                lista = dao.listar();
                            }
                            for (Heroi hero : lista) {
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
                    </div></div></div></div></body></html>
