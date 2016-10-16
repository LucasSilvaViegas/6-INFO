<br/><br/>

<div class="sub-news">
    <div class="container">
        <form>
            <h3>Pesquise por produtos!</h3>
            <input type="text" class="sub-email" name="txtFiltro" placeholder="Pesquisar">

            <a class="btn btn-default subs-btn" href="#" role="button">PESQUISAR</a>
        </form>
    </div>
    <div class="header">
        <div class="container">
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
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Produtos<b class="caret"></b></a>
                                    <ul class="dropdown-menu ">

                                        <ul class="multi-column-dropdown">
                                            <li><a href="lista.jsp">Clique aqui kkkj</a></li>
                                        </ul>

                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categoria<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <%
                                            for (Categoria cat : cLista) {
                                        %>
                                        <li><a href="lista.jsp?filtroC=<%=cat.getCodigo()%>"><%=cat.getNome()%></a></li>
                                            <% }%>                                           
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Marca<b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <%
                                            for (Marca mar : cMarca) {
                                        %>
                                        <li><a href="lista.jsp?filtroM=<%=mar.getCodigo()%>"><%=mar.getNome()%></a></li>
                                            <% }%>                                           
                                    </ul>
                                </li>
                            </ul>
                            <br/><br/>
                            Copyright @LucasEnterprisesKKKJ 2016
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>