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
<%@include file="cabecalho.jsp"%>

<%

    CategoriaDAO Cdao = new CategoriaDAO();
    Categoria cat = new Categoria();
    MarcaDAO Mdao = new MarcaDAO();
    Marca marca = new Marca();
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
                        <a href="index.jsp">N-AIR</a>
                    </div>
                    <div class="login-bars">
                        <a class="btn btn-default log-bar" href="register.html" role="button">Sign up</a>
                        <a class="btn btn-default log-bar" href="signup.html" role="button">Login</a>
                        <div class="cart box_1">
                            <a href="checkout.html">
                            <h3>
                                <div class="total">
<span class="simpleCart_total"></span>(<span id="simpleCart_quantity" class="simpleCart_quantity"></span>)</div></h3>
                            </a>
                            <p><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
                            <div class="clearfix"> </div>
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
                                        <li><a href="lista.jsp">Shoes</a></li>
                                        <li><a href="lista.jsp">Tees</a></li>
                                        <li><a href="lista.jsp">Tops</a></li>
                                        <li class="divider"></li>
                                        <li><a href="lista.jsp">Tracks</a></li>
                                        <li class="divider"></li>
                                        <li><a href="lista.jsp">Gear</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Men<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-3">
                                        <div class="row">
                                            <div class="col-sm-4 menu-img-pad">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="lista.jsp">Joggers</a></li>
                                                    <li><a href="lista.jsp">Foot Ball</a></li>
                                                    <li><a href="lista.jsp">Cricket</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="lista.jsp">Tennis</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="lista.jsp">Casual</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4 menu-img-pad">
                        <a href="#"><img src="images/menu1.jpg" alt="/" class="img-rsponsive men-img-wid" /></a>
                                            </div>
                                            <div class="col-sm-4 menu-img-pad">
                        <a href="#"><img src="images/menu2.jpg" alt="/" class="img-rsponsive men-img-wid" /></a>
                                            </div>
                                        </div>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Women<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="lista.jsp">Tops</a></li>
                                                    <li><a href="lista.jsp">Bottoms</a></li>
                                                    <li><a href="lista.jsp">Yoga Pants</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="lista.jsp">Sports</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="lista.jsp">Gym</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6">
                        <a href="#"><img src="images/menu3.jpg" alt="/" class="img-rsponsive men-img-wid" /></a>
                                            </div>
                                        </div>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Kids<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="lista.jsp">Tees</a></li>
                                        <li><a href="lista.jsp">Shorts</a></li>
                                        <li><a href="lista.jsp">Gear</a></li>
                                        <li class="divider"></li>
                                        <li><a href="lista.jsp">Watches</a></li>
                                        <li class="divider"></li>
                                        <li><a href="lista.jsp">Shoes</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Kids<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="lista.jsp">Tees</a></li>
                                        <li><a href="lista.jsp">Shorts</a></li>
                                        <li><a href="lista.jsp">Gear</a></li>
                                        <li class="divider"></li>
                                        <li><a href="lista.jsp">Watches</a></li>
                                        <li class="divider"></li>
                                        <li><a href="lista.jsp">Shoes</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Catch</a></li>
                                <div class="clearfix"></div>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <!--/.navbar-collapse-->
                        <div class="clearfix"></div>
                    </nav>
                    <!--/.navbar-->   
                        <div class="clearfix"></div>
                    </div>
                    <!--/.content--->
                </div>
                    <!--header-bottom-->
            </div>
        </div>