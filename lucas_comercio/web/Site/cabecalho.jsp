<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<%@page import="dao.MarcaDAO"%>
<%@page import="modelo.Marca"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>

<%

    CategoriaDAO Cdao = new CategoriaDAO();
    MarcaDAO Mdao = new MarcaDAO();
    List<Categoria> cLista = Cdao.listar();
    List<Marca> cMarca = Mdao.listar();
%>

<html lang="en">
    <head>
        <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <meta charset utf="8">
        <!--fonts-->
        <link href='//fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>

        <!--fonts-->
        <!--bootstrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <!--coustom css-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <!--shop-kart-js-->
        <script src="js/simpleCart.min.js"></script>
        <!--default-js-->
        <script src="js/jquery-2.1.4.min.js"></script>
        <!--bootstrap-js-->
        <script src="js/bootstrap.min.js"></script>
        <!--script-->
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="header-top">
                    <div class="logo">
                        <a href="index.jsp"><img src="../fotos/a.jpg"></a>
                    </div>

                    <div class="login-bars">
                        <a class="btn btn-default log-bar" href="../Admin" role="button">Sign up</a>
                        <a class="btn btn-default log-bar" href="../Admin" role="button">Login</a>
                        <div class="cart box_1">
                            <a href="checkout.html">
                                <h3>
                                    <div class="total">
                                        <span class="simpleCart_total"></span>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div></h3>
                            </a>
                            <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                            <div class="clearfix"> </div> <br/>
                            <form method="post">
                                <!--  Monta o filtro  -->
                                <input type="text" name="txtFiltro" placeholder="PESQUISAR" />
                            </form>
                        </div>	
                    </div>

                    <div class="clearfix"></div>
                </div>
                <!---menu-----bar--->
                <div class="header-botom">
                    <div class="content white">
                        <nav class="navbar navbar-default nav-menu" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="clearfix"></div>
                            <!--/.navbar-header-->
                            <div class="collapse navbar-collapse collapse-pdng" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav nav-font">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Shop<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="index.jsp">Shoes</a></li>
                                            <li><a href="index.jsp">Tees</a></li>
                                            <li><a href="index.jsp">Tops</a></li>
                                            <li class="divider"></li>
                                            <li><a href="index.jsp">Tracks</a></li>
                                            <li class="divider"></li>
                                            <li><a href="index.jsp">Gear</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Produtos<b class="caret"></b></a>
                                        <ul class="dropdown-menu ">

                                            <ul class="multi-column-dropdown">
                                                <li><a href="index.jsp">Em destaque</a></li>
                                                <li><a href="index.jsp?filtroD=<%=true%>">Todos os produtos</a>
                                            </ul>

                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categoria<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <%
                                                for (Categoria cat : cLista) {
                                            %>
                                            <li><a href="index.jsp?filtroC=<%=cat.getCodigo()%>"><%=cat.getNome()%></a></li>
                                                <% }%>                                           
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Marca<b class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <%
                                                for (Marca mar : cMarca) {
                                            %>
                                            <li><a href="index.jsp?filtroM=<%=mar.getCodigo()%>"><%=mar.getNome()%></a></li>
                                                <% }%>                                           
                                        </ul>
                                    </li>
                                    <div class="header-end">
                                        <div class="container">
                                            <br/><br/><br/>
                                            <div class="pull-center styl-hdn">
                                                <h3>Bem vindo ao GAME STOP, a sua cabana dos jogos!</h3>
                                            </div>
                                            <br/><br/>
                                        </div>
                                    </div>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
