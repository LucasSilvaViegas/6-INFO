<%@page import="modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    ClienteDAO dao = new ClienteDAO();
    List<Cliente> lista;

    if (request.getParameter("codigo") != null) {
        Cliente obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (obj != null) {
            Boolean funcionou = dao.excluir(obj);
            if (funcionou) {
                out.print("dsdsdsdsd");
            }
        }
    }

    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }    %>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Clientes

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
                <input type="text" name="txtFiltro" class="form-control" placeholder="digite o nome do usu�rio ou a cidade">
                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
            </div>
        </form>
        <div class="panel-body">


            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>C�digo</th>
                            <th>Nome</th>
                            <th>Email</th>
                            <th>Endere�o</th>
                            <th>Bairro</th>
                            <th>Cidade</th>
                            <th>Estado</th>
                            <th>CEP</th>
                            <th >A��es</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Cliente item : lista) {
                        %>
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getNome()%></td>
                            <td><%=item.getEmail()%></td>
                            <td><%=item.getEndereco()%></td>
                            <td><%=item.getBairro()%></td>                  
                            <td><%=item.getCidade()%></td> 
                            <td><%=item.getEstado()%></td> 
                            <td><%=item.getCep()%></td> 
                            <td>
                                <a href="index.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-danger btn-sm">Excluir</a>  
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                    <!-- ALTERAR MANTIDO EM SEQUESTRO PRIVADO POR UM MOMENTO!
                /.table-responsive <a href="upd.jsp?codigo=<%//=item.getCodigo()%>" class="btn  btn-primary btn-sm">Alterar</a>-->
            </div>

        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<%@include file="../rodape.jsp" %>
