
<%@page import="util.Criptografia"%>
<%@page import="modelo.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "testando";
    String classe = "alert-danger";
    Usuario obj = new Usuario();
    
//Verifica se é post, ou seja, quero alterar
    if (request.getMethod().equals("POST")) {
        UsuarioDAO dao = new UsuarioDAO();
       
        obj.setLogin(request.getParameter("txtCodigo"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtP")));
        if (request.getParameter("admin") != null){
            obj.setAdmin(true);
        }else{
            obj.setAdmin(false);
        }
        
        Boolean resultado = dao.alterar(obj);
        
        if(resultado){
            msg="Registro alterado com sucesso";
            classe = "alert-success";
        }else{
            msg="Registro NÃO FOI alterado com sucesso";
            classe = "alert-danger";
        }

//Popular com o que ele digitou no form
    } else {
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        UsuarioDAO dao = new UsuarioDAO();
        obj = dao.buscarPorChavePrimaria(request.getParameter("codigo"));

//Se for um registro inválido, sai da tela 
        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
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
            Usuario
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Login</label>
                        <input class="form-control" type="text" name="txtCodigo" value="<%=obj.getLogin()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Senha</label>
                        <input class="form-control" type="password" name="txtNome" value="<%=obj.getSenha()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Admin</label>
                        <input class="form-control" type="checkbox" name="admin" />
                    </div>



                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>