<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "testando";
    String classe = "alert-danger";
    Produto obj = new Produto();
    
//Verifica se � post, ou seja, quero alterar
    if (request.getMethod().equals("POST")) {
        ProdutoDAO dao = new ProdutoDAO();
        
        obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setTitulo(request.getParameter("txtNome"));
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg="Registro alterado com sucesso";
            classe = "alert-success";
        }else{
            msg="Registro N�O FOI alterado com sucesso";
            classe = "alert-danger";
        }

//Popular com o que ele digitou no form
    } else {
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        ProdutoDAO dao = new ProdutoDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

//Se for um registro inv�lido, sai da tela 
        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Com�rcio Eletr�nico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">�rea Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conte�do de apresenta��o
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Produto
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>C�digo</label>
                        <input class="form-control" type="text" name="txtCodigo"readonly value="<%=obj.getCodigo()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" value="<%=obj.getTitulo()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Descri��o</label>
                        <input class="form-control" type="text" name="desc" value="<%=obj.getDescricao()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Quantidade</label>
                        <input class="form-control" type="text" name="qtd" value="<%=obj.getQuant()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Marca</label>
                        <input class="form-control" type="text" name="marca" value="<%=obj.getCodmarca().getNome()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Categoria</label>
                        <input class="form-control" type="text" name="txtNome" value="<%=obj.getNome()%>"/>
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>