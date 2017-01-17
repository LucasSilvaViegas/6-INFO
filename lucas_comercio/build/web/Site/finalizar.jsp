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
<%@include file="cabecalho.jsp"%>

<%    Cliente c;
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {

        c = ((Cliente) session.getAttribute("usuario"));
        Carrinho carrinho = null;

        if (session.getAttribute("carrinho") == null) {
            response.sendRedirect("index.jsp");
        } else {
            carrinho = (Carrinho) session.getAttribute("carrinho");

        }

        if (request.getParameter("final")!= null && request.getParameter("final").equals("true")) {

            Venda venda = new Venda();
            VendaDAO vendadao = new VendaDAO();

            //Set venda total
            venda.setCodcliente(c.getCodigo());
            venda.setDatavenda(Date.valueOf(LocalDate.now()));
            venda.setTotal(carrinho.getTotal());
            venda.setCodstatus(1);
            vendadao.incluir(venda);
            //Set venda de cada produto
            ItemvendaDAO itemvendadao = new ItemvendaDAO();

            for (Itemcarrinho item : carrinho.getItens()) {

                Itemvenda L = new Itemvenda();
                L.setItemvendaPK(new ItemvendaPK(venda.getCodigo(), item.getProduto().getCodigo()));

                L.setProduto(item.getProduto());
                L.setQuant(item.getQuantidade());
                L.setPreco(item.getProduto().getPreco().doubleValue());
                L.setVenda(venda);

                itemvendadao.incluir(L);
            }

        }


%>


<!-- check-out -->
<div class="check">
    <div class="container">	 
        <div class="col-md-9 cart-items">
            <h1>FINALIZAR COMPRA</h1>
            <span>A ser enviado para <%=c.getNome()%>. <br/>
                ENDEREÇO: <%=c.getEndereco()%>, <%=c.getBairro()%>, <%=c.getCidade()%>, <%=c.getEstado()%>. <br/>
                CEP <%=c.getCep()%>.<br/>
            </span>
            <%
                if (carrinho.getItens() != null) {
                    for (Itemcarrinho item : carrinho.getItens()) {
                        Double kk = (item.getProduto().getPreco().doubleValue() * item.getQuantidade());
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
                            <li><p>Qty : <%=item.getQuantidade()%></p></li>
                            <li><p>Price each : $<%=item.getProduto().getPreco()%></p></li>
                            <li><p>Price total : $<%=kk%></p></li>
                        </ul>
                        <div class="delivery">
                            <span><%=item.getProduto().getDescricao()%></span>
                            <div class="clearfix"></div>
                        </div>	
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div><%}
                }%>
        </div>
        <div class="delivery">
        </div>
        <div class="col-md-3 cart-total">
            <h1 class="continue">Price total : $<%=carrinho.getTotal()%></h1>
            <a class="order" href="finalizar.jsp?final=true">Finalizar a compra</a>
        </div>
        <div class="clearfix"> </div>
    </div>
</div><%}%>
<%@include file="rodape.jsp"%>
