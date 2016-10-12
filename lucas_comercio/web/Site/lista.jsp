<%@page import="java.lang.Integer"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.List"%>
<%@include file="cabecalho.jsp"%>

<%
    ProdutoDAO dao = new ProdutoDAO();
    List<Produto> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else if (request.getParameter("filtroM") != null){
        lista = dao.listarTipoMarca("filtroM");
    } else if (request.getParameter("filtroM") != null){
        lista = dao.listarTipoCategoria("filtroC");
    } else {
        lista = dao.listar();
    }

%>

<div class="shop-grid">
    <div class="container">
        <%    for (Produto item : lista) {  %>
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
        <%}%>
        <br/><br/>
    </div>
</div>

<%@include file="rodape.jsp"%>