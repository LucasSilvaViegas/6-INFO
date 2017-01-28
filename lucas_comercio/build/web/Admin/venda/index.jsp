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
                <%                            for (Venda item : listavenda) {
                        for (Cliente cliente : listacliente) {
                            if (item.getCodcliente() == cliente.getCodigo()) {

                                //AQUI O USUARIO PODERIA CLICAR E VER O QUE ESTÁ COMPRANDO

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
                                                <td><a href="produtos.jsp?codigo=<%=item.getCodigo()%>">Detalhes</a>

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
                                <%
                                    VendaDAO vdao = new VendaDAO();
                                    Venda carrinho = vdao.buscarPorChavePrimaria(item.getCodigo());

                                    for (Itemvenda itemv : carrinho.getItemvendaList()) {

                                %>
                                <br/>
                                <br/>
                                <table class='table table-bordered'>
                                    <div class="cart-header">
                                        <tr>
                                            <td>Foto</td>
                                            <td>Titulo</td>
                                            <td>Quantidade</td>
                                            <td>Preço</td>
                                            <td>Descrição</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <img src="../fotos/<%=itemv.getProduto().getImagem1()%>" class="img-responsive" alt=""/>

                                            </td>
                                            <td><%=itemv.getProduto().getTitulo()%></td>
                                            <td><%=itemv.getQuant()%></td>
                                            <td>$<%=itemv.getProduto().getPreco()%></td>
                                            <td><%=itemv.getProduto().getDescricao()%></td>
                                        </tr>
                                        <!--<div class="cart-item-info">
                                            <ul class="qty">
                                                <li><p>Nome :  </p></li>
                                                <li><p>Qty : </p></li>
                                                <li><p>Price each : </p></li>
                                            </ul>
                                            <div class="delivery">
                                                <span></span>
                                                <div class="clearfix"></div>
                                            </div>	
                                        </div>-->

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
                <!-- <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingTwo">
                         <h4 class="panel-title">
                             <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                 Collapsible Group Item #2
                             </a>
                         </h4>
                     </div>
                     <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                         <div class="panel-body">
                             Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                         </div>
                     </div>
                 </div>
                 <div class="panel panel-default">
                     <div class="panel-heading" role="tab" id="headingThree">
                         <h4 class="panel-title">
                             <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                 Collapsible Group Item #3
                             </a>
                         </h4>
                     </div>
                     <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                         <div class="panel-body">
                             Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                         </div>
                     </div>
                 </div>-->
            </div>


        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<%@include file="../rodape.jsp" %>