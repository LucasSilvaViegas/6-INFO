<%@page import="java.util.List"%>
<%@page import="dao.VendaDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.ItemvendaDAO"%>
<%@page import="modelo.ItemvendaPK"%>
<%@page import="modelo.Status"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Carrinho"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Itemcarrinho"%>

<%

    VendaDAO dao = new VendaDAO();
    ItemvendaDAO ivdao = new ItemvendaDAO();
    ProdutoDAO pdao = new ProdutoDAO();
    Venda carrinho = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    List<Produto> lista = pdao.listar();
    List<Itemvenda> listaVenda = ivdao.listar();


%>


<!-- check-out -->
<div class="check">
    <div class="container">	 
        <div class="col-md-9 cart-items">
            <%                for (Itemvenda  : carrinho.getItemvendaList()) {

            %>
            <br/>
            <br/>
            <div class="cart-header">
                <div class="cart-sec simpleCart_shelfItem">
                    <div class="cart-item cyc">
                        <img src="../fotos/<%=item.getProduto().getImagem1()%>" class="img-responsive" alt=""/>
                    </div>
                    <div class="cart-item-info">
                        <ul class="qty">
                            <li><p>Nome : <%=item.getProduto().getTitulo()%> </p></li>
                            <li><p>Qty : <%=item.getQuant()%></p></li>
                            <li><p>Price each : $<%=item.getProduto().getPreco()%></p></li>
                            <li><p>Price total : $<%=item.getPreco()%></p></li>
                        </ul>
                        <div class="delivery">
                            <span><%=item.getProduto().getDescricao()%></span>
                            <div class="clearfix"></div>
                        </div>	
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div><%}
            %>
        </div>
        
