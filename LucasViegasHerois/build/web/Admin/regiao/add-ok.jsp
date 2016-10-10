
<%@page import="modelo.Regiao"%>
<%@page import="dao.RegiaoDAO"%>


<%
if(request.getParameter("txtNome") == null){
    response.sendRedirect("index.jsp");
    return;
}

if(request.getParameter("txtNome").isEmpty()){
    response.sendRedirect("index.jsp");
    return;
}

    //GRAVAR A CATEGORIA NO BANCO
    RegiaoDAO dao = new RegiaoDAO();
    //monto o objeto com os dados para sem inserir
    Regiao obj = new Regiao();
    
    obj.setNome(request.getParameter("txtNome"));
    obj.setDescricao(request.getParameter("Desc"));
    
    //EXECUTO O INSERT NA DAO
    dao.incluir(obj);

%>
<%@include file="../cabecalho.jsp"%>

         <h1 >Cadastro de Região</h1>
            
         <p class=done>
             Registro cadastrado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>



