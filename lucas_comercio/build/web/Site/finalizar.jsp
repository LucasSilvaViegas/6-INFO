<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Carrinho"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Itemcarrinho"%>
<%@include file="cabecalho.jsp"%>

<%   Cliente c;
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {

        c = ((Cliente) session.getAttribute("usuario"));
        Carrinho carrinho;
        if (session.getAttribute("carrinho") != null) {
            carrinho = (Carrinho) session.getAttribute("carrinho");
        } else {
            carrinho = new Carrinho();
        }
        if (request.getMethod().equals("POST")) {

            Integer codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            Integer qtd = Integer.parseInt(request.getParameter("txtQuantidade"));

            Itemcarrinho item = new Itemcarrinho();
            item.setQuantidade(qtd);
            ProdutoDAO pdao = new ProdutoDAO();
            Produto produto = pdao.buscarPorChavePrimaria(codigo);
            item.setProduto(produto);

            //VER SE A LISTA JA EXISTE
            if (carrinho.getItens() == null) {
                List<Itemcarrinho> itens = new ArrayList<Itemcarrinho>();
                itens.add(item);
                carrinho.setItens(itens);
                carrinho.setTotal(qtd * produto.getPreco().doubleValue());
            } else {
                carrinho.getItens().add(item);
                Double total = (carrinho.getTotal() + (qtd * produto.getPreco().doubleValue()));
                carrinho.setTotal(total);
            }
            session.setAttribute("carrinho", carrinho);
        }


%>


<!-- check-out -->
<div class="check">
    <div class="container">	 

        <div class="col-md-9 cart-items">

            <h1>FINALIZAR COMPRA</h1>


            <%                if (carrinho.getItens() != null) {
                    for (Itemcarrinho item : carrinho.getItens()) {

            %>



            <span>A ser enviado para <%=c.getNome()%>. <br/>
                ENDEREÇO: <%=c.getEndereco()%>, <%=c.getBairro()%>, <%=c.getCidade()%>, <%=c.getEstado()%>. <br/>
                CEP <%=c.getCep()%>.<br/>
            </span>
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
                            <li></li>
                        </ul>
                        <div class="delivery">

                            <span><%=item.getProduto().getDescricao()%></span>
                            <div class="clearfix"></div>
                        </div>	
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>	
            <%                    }
                }
            %>
        </div>
        <div class="delivery">

        </div>

        <div class="col-md-3 cart-total">
            <h1 class="continue">Price total : $<%=carrinho.getTotal()%></h1>
            <input type="submit" value="Place Order" class="order">
        </div>
        <div class="clearfix"> </div>
    </div>
</div>

<%
    }
%>


<%@include file="rodape.jsp"%>
