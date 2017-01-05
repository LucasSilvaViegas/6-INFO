<%@page import="util.Criptografia"%>
<%@include file="../cabecalho.jsp"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%
    
    String msg =  "Olá!";
    String classe = "";
    
 
    //Gravar a categoria no banco
    UsuarioDAO dao = new UsuarioDAO();
    //Monto o objeto com os dados para sem inserir
    Usuario obj = new Usuario();
    //verifico se foi enviado o campo txtNome
    if (request.getParameter("txtNome") == null) {
        msg = "Dados inválidos";
        classe = "alert-danger";//volta para a tela da listagem

    }
  
    if (request.getParameter("txtNome") != null) {
        msg = "Gravado com sucesso!";
        classe = "alert-success";//volta para a tela da listagem

        obj.setLogin(request.getParameter("txtNome"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtP")));
        
        if (request.getParameter("admin") != null){
            obj.setAdmin(true);
        }else{
            obj.setAdmin(false);
        }
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
            Categoria
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Login</label>
                        <input class="form-control" type="text" name="txtNome" required />
                        
                        <label>Senha</label>
                        <input class="form-control" type="password" name="txtP" required />
                        
                        <label>Administrador?</label>
                        <input class="form-control" type="checkbox" name="admin" />
                    </div>



                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>