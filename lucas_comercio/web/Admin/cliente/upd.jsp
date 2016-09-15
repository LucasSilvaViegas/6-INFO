<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "testando";
    String classe = "alert-danger";
    Cliente obj = new Cliente();
    
//Verifica se é post, ou seja, quero alterar
    if (request.getMethod().equals("POST")) {
        ClienteDAO dao = new ClienteDAO();
        
        obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
        obj.setNome(request.getParameter("txtNome"));
        obj.setEmail(request.getParameter("txtEmail"));
        obj.setCep(request.getParameter("txtCep"));
        obj.setCidade(request.getParameter("txtCidade"));
        obj.setEndereco(request.getParameter("txtEndereco"));
        obj.setEstado(request.getParameter("txtEstado"));
        obj.setSenha(request.getParameter("txtSenha"));
        obj.setBairro(request.getParameter("txtBairro"));
        
        
        
        
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
        ClienteDAO dao = new ClienteDAO();
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

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
            Cliente
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo"readonly value="<%=obj.getCodigo()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome" value="<%=obj.getNome()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Email</label>
                        <input class="form-control" type="text" name="txtEmail" value="<%=obj.getEmail()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text" name="txtEndereco" value="<%=obj.getEndereco()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Bairro</label>
                        <input class="form-control" type="text" name="txtBairro" value="<%=obj.getBairro()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Cidade</label>
                        <input class="form-control" type="text" name="txtCidade" value="<%=obj.getCidade()%>"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Estado</label>
                        <input class="form-control" type="text" name="txtEstado" value="<%=obj.getEstado()%>"/>
                    </div>
                        
                    <div class="form-group">
                        <label>CEP</label>
                        <input class="form-control" type="text" name="txtCep" value="<%=obj.getCep()%>"/>
                    </div>
                        <label>Senha</label>
                        <input class="form-control" type="password" name="txtSenha" value="<%=obj.getSenha()%>"/>
                    <div class="form-group">
                        
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>