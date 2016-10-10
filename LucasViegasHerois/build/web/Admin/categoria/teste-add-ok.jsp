<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
    //verifico se foi enviado o campo txtNome
    if(request.getParameter("txtNome") == null){
        //volta pra tela da listagem
        response.sendRedirect("index.jsp");
        return;
    }
    //verifica se o campo esta vazio
    if(request.getParameter("txtNome").isEmpty()){
        //volta pra tela da listagem
        response.sendRedirect("index.jsp");
    }
    //Gravar categoria do banco
    CategoriaDAO dao = new CategoriaDAO();
    //Monto o objeto com os dados para sem inserir
    Categoria obj = new Categoria();
    
    obj.setNome(request.getParameter("txtNome"));
    //executo o insert na DAO
    dao.incluir(obj);
%>
<%@include file="../cabecalho.jsp" %>
    
    <h1>Cadastro de Categoria</h1>
    <div>
        Registro cadastrado com sucesso.<br/><br/>
        <a href="index.jsp">Voltar para a Listagem</a>
    </div>    
    
    </body>
</html>