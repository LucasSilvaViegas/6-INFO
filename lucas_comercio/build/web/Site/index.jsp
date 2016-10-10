<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>

<%

    ProdutoDAO dao = new ProdutoDAO();
    List<Produto> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }

%>

<div class="header-end">
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <%    for (Produto item : lista) {
                    if (item.getDestaque() == true) {
            %>
            <div class="carousel-inner" role="listbox">

                <div class="item active">

                    <img src="../fotos/<%=item.getImagem1()%>" height="1000" width="500">

                    <div class="carousel-caption car-re-posn">
                        <h3><a href="produto.jsp?codigo=<%=item.getCodigo()%>"><%=item.getTitulo()%></a></h3>
                        <h4><%=item.getDescricao()%></h4>
                        <span class="color-bar"></span>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left car-icn" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right car-icn" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <div class="clearfix"></div>
            <%
                    }
                }
            %>
        </div>

        <div class="shop-grid">
            <div class="container">
                <%    for (Produto item : lista) {

                %>
                <div class="col-md-4 grid-stn simpleCart_shelfItem">
                    <!-- normal -->
                    <div class="ih-item square effect3 bottom_to_top">
                        <div class="bottom-2-top">
                            <div class="img"><img src="../fotos/<%=item.getImagem1()%>" alt="/" class="img-responsive gri-wid"></div>
                            <div class="info">
                                <div class="pull-left styl-hdn">
                                    <h3><%=item.getTitulo()%></h3>
                                </div>
                                <div class="pull-right styl-price">
                                    <p><a  href="#" class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">$<%=item.getPreco()%></span></a></p>
                                </div>
                                <div class="clearfix"></div>
                            </div></div>
                    </div>
                    <!-- end normal -->
                    <div class="quick-view">
                        <a href="produto.jsp?codigo=<%=item.getCodigo()%>">Quick view</a>
                    </div>
                </div>
                <% }%>
                <br/><br/>

                <%@include file="rodape.jsp"%>