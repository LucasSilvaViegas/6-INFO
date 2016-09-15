    <%@page import="util.Criptografia"%>
<%@include file="../cabecalho.jsp" %>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%
    
    String msg =  "Olá!";
    String classe = "";
    
    //Gravar a categoria no banco
    ClienteDAO dao = new ClienteDAO();
    //Monto o objeto com os dados para sem inserir
    Cliente obj = new Cliente();
    //verifico se foi enviado o campo txtNome
    if (request.getParameter("txtNome") == null) {
        msg = "Dados inválidos";
        classe = "alert-danger";//volta para a tela da listagem

    }
  
    if (request.getParameter("txtNome") != null) {
        msg = "Gravado com sucesso!";
        classe = "alert-success";//volta para a tela da listagem

        obj.setNome(request.getParameter("txtNome"));
        obj.setEmail(request.getParameter("txtEmail"));
        obj.setCep(request.getParameter("txtCep"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        obj.setEndereco(request.getParameter("txtEndereco"));
        obj.setEstado(request.getParameter("txtEstado"));
        obj.setCidade(request.getParameter("txtCidade"));
        obj.setBairro(request.getParameter("txtBairro"));
     //   obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
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
            Cliente
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post">
                
                <div class="col-lg-6">

                    <div class="form-group">
                         <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo" readonly/>
                    </div>

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="txtNome"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Email</label>
                        <input class="form-control" type="text" name="txtEmail"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text" name="txtEndereco"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Bairro</label>
                        <input class="form-control" type="text" name="txtBairro"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Cidade</label>
                        <input class="form-control" type="text" name="txtCidade"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Estado</label>
                        <input class="form-control" type="text" name="txtEstado"/>
                    </div>
                        
                    <div class="form-group">
                        <label>CEP</label>
                        <input class="form-control" type="text" name="txtCep"/>
                    </div>
                        <label>Senha</label>
                        <input class="form-control" type="password" name="txtSenha"/>
                    <div class="form-group">
                        
                    </div>
                    


                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>