<%@include file="../cabecalho.jsp" %>
<%@page import="modelo.Status"%>
<%@page import="dao.StatusDAO"%>
<%
    
    String msg =  "Olá!";
    String classe = "";
    
    //Gravar a categoria no banco
    StatusDAO dao = new StatusDAO();
    //Monto o objeto com os dados para sem inserir
    Status obj = new Status();
    //verifico se foi enviado o campo txtNome
    if (request.getParameter("txtNome") == null) {
        msg = "Dados inválidos";
        classe = "alert-danger";//volta para a tela da listagem

    }
  
    if (request.getParameter("txtNome") != null) {
        msg = "Gravado com sucesso!";
        classe = "alert-success";//volta para a tela da listagem

        obj.setDescricao(request.getParameter("txtNome"));

        //executo o insert na DAO    
        dao.incluir(obj);
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Status
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" required />
                    </div>
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>