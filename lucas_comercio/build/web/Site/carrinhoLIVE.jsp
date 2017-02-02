<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Itemcarrinho"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Carrinho"%>
<%@include file="cabecalho.jsp"%>


<%    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {

        Carrinho carrinho;
        ProdutoDAO pdao = new ProdutoDAO();

        if (session.getAttribute("carrinho") == null) {
            carrinho = new Carrinho();
        } else {
            
            carrinho = (Carrinho) session.getAttribute("carrinho");

            if (request.getParameter("codigo") != null) {

                //EXCLUIR PRODUTO DO CARRINHO
                for (Itemcarrinho teste : carrinho.getItens()) {
                    if (teste.getProduto().getCodigo() == Integer.parseInt(request.getParameter("codigo"))) {
                        carrinho.getItens().remove(teste);
                        Double total = (carrinho.getTotal() - ((teste.getProduto().getPreco().doubleValue()) * (teste.getQuantidade())));
                        carrinho.setTotal(total);
                        break;
                    }
                }
            }
        }

        if (request.getMethod().equals("POST")) {

            Integer qtd = Integer.parseInt(request.getParameter("txtQuantidade"));
            Itemcarrinho item = new Itemcarrinho();
            Produto produto = pdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtCodigo")));

            item.setQuantidade(qtd);
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

        if (carrinho.getItens() != null) {
            for (Itemcarrinho item : carrinho.getItens()) {
                Double precototalunidade = (item.getProduto().getPreco().doubleValue() * item.getQuantidade());


%>


<img src="../fotos/<%=item.getProduto().getImagem1()%>"/>
<ul>
    <li><p>Nome : <%=item.getProduto().getTitulo()%> </p></li>
    <li><p>Qtd : <%=item.getQuantidade()%></p></li>
    <li><p>Preço : $<%=item.getProduto().getPreco()%></p></li>
    <li><p>Preço total : $<%=precototalunidade%></p></li>
    <li><span><%=item.getProduto().getDescricao()%></span></li>
</ul>
<a href="CarrinhoLive.jsp?codigo=<%=item.getProduto().getCodigo()%>">Excluir</a>
--------------
<h1>Price total : $<%=carrinho.getTotal()%></h1>
<a class="order" href="finalizarLIVE.jsp">Finalizar Compra</a>

<%
            }
        }
    }
%>