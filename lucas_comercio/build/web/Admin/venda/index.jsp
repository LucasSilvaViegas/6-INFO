<%@page import="dao.ItemvendaDAO"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Venda"%>
<%@page import="dao.VendaDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Marca"%>
<%@include file="../cabecalho.jsp" %>
<%

    VendaDAO vendadao = new VendaDAO();
    List<Venda> listavenda = vendadao.listar();

    ClienteDAO cdao = new ClienteDAO();
    List<Cliente> listacliente = cdao.listar();

    ProdutoDAO produtodao = new ProdutoDAO();
    List<Produto> listaproduto;

    ItemvendaDAO itemvendadao = new ItemvendaDAO();
    List<Itemvenda> listaitemvenda = itemvendadao.listar();

    if (request.getParameter("codigo") != null) {
        Venda obj = vendadao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    }

%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de VENDAS

        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">

            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>

        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" name="txtFiltro" class="form-control" placeholder="digite...">
                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
            </div>
        </form>
        <div class="panel-body">

            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <% 
                    for (Venda item : listavenda) {
                        for (Cliente cliente : listacliente) {
                            if (item.getCodcliente() == cliente.getCodigo()) {
                %>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=item.getCodigo()%>" aria-expanded="true" aria-controls="collapseOne">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Código</th>
                                                <th>Cliente</th>
                                                <th>Data da venda</th>
                                                <th>Status</th>
                                                <th>Preço</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><%=item.getCodigo()%></td>
                                                <td><%=cliente.getNome()%></td>
                                                <td><%=item.getDatavenda()%></td>
                                                <td>ENVIADO</td>
                                                <td><%=item.getTotal()%></td>
                                                <td>Detalhes</td>

                                            </tr>

                                        </tbody>
                                    </table>

                                    <!-- /.table-responsive -->
                                </div>                            </a>
                        </h4>
                    </div>
                    <div id="collapse<%=item.getCodigo()%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <div class='col-md-8 col-md-offset-2'>
                                <br/>
                                <br/>
                                <table class='table table-bordered'>
                                    <div class="cart-header">

                                        <tr>
                                            <td><h2>Foto</h2></td>
                                            <td><h2>Titulo</h2></td>
                                            <td><h2>Quantidade</h2></td>
                                            <td><h2>Preço</h2></td>
                                            <td><h2>Descrição</h2></td>
                                        </tr>
                                        <%
                                            VendaDAO vdao = new VendaDAO();
                                            Venda carrinho = vdao.buscarPorChavePrimaria(item.getCodigo());

                                            for (Itemvenda itemv : carrinho.getItemvendaList()) {

                                        %>
                                        <tr>
                                            <td>
                                                <img src="../fotos/<%=itemv.getProduto().getImagem1()%>" class="img-responsive" alt=""/>
                                            </td>
                                            <td><%=itemv.getProduto().getTitulo()%></td>
                                            <td><%=itemv.getQuant()%></td>
                                            <td>$<%=itemv.getProduto().getPreco()%></td>
                                            <td><%=itemv.getProduto().getDescricao()%></td>
                                        </tr>
                                        <%}
                                        %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    }
                %>
            </div>
        </div>
    </div>
</div>
<%@include file="../rodape.jsp" %>