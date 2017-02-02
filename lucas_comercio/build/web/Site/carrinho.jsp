<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Carrinho"%>
<%@page import="modelo.Itemcarrinho"%>
<%@include file="cabecalho.jsp"%>

<%  if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {
        Carrinho carrinho;
        ProdutoDAO pdao = new ProdutoDAO();

        if (session.getAttribute("carrinho") != null) {
            carrinho = (Carrinho) session.getAttribute("carrinho");
            if (request.getParameter("codigo") != null) {
                for (Itemcarrinho teste : carrinho.getItens()) {
                    if (teste.getProduto().getCodigo() == Integer.parseInt(request.getParameter("codigo"))) {
                        carrinho.getItens().remove(teste);
                        Double total = (carrinho.getTotal() - ((teste.getProduto().getPreco().doubleValue()) * (teste.getQuantidade())));
                        carrinho.setTotal(total);
                        break;
                    }
                }
            }
        } else {
            carrinho = new Carrinho();
        }
        if (request.getMethod().equals("POST")) {

            Integer codigo = Integer.parseInt(request.getParameter("txtCodigo"));
            Integer qtd = Integer.parseInt(request.getParameter("txtQuantidade"));

            Itemcarrinho item = new Itemcarrinho();
            item.setQuantidade(qtd);
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

            <h1>CARRINHO DE COMPRAS</h1>


            <%                if (carrinho.getItens() != null) {
                    for (Itemcarrinho item : carrinho.getItens()) {
                        Double kk = (item.getProduto().getPreco().doubleValue() * item.getQuantidade());


            %>





            <div class="cart-header">
                <div class="close1"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </div>
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
                            <li></li>
                        </ul>
                        <div class="delivery">

                            <span><%=item.getProduto().getDescricao()%></span>
                            <button  class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo =<%=item.getProduto().getCodigo()%>">Excluir</button>

                            <div class="clearfix"></div>
                        </div>	
                    </div>
                    <div class="clearfix"></div>

                </div>
            </div>	
            <%                    }
                }

            %>
        </div><div class="col-md-3 cart-total">
            <h1 class="continue">Price total : $<%=carrinho.getTotal()%></h1>
            <a class="order" href="finalizar.jsp">Finalizar Compra</a>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<%
    }
%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Confirme a escolha</h4>
            </div>
            <div class="modal-body">
                Você tem certeza de que quer excluir?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                <button type="button" class="btn btn-primary" onclick="excluir()">Sim</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>

    var codigo;

    function excluir() {
        document.location.href = "carrinho.jsp?codigo=" + codigo;
    }


</script>



<%@include file="rodape.jsp"%>
