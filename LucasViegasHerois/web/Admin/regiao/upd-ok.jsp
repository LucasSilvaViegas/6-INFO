
<%@page import="dao.RegiaoDAO"%>
<%@page import="modelo.Regiao"%>

<%
if(request.getParameter("txtNome") == null || request.getParameter("txtCodigo") == null){
    response.sendRedirect("index.jsp");
    return;
}
    
    RegiaoDAO dao = new RegiaoDAO();
    Regiao obj = new    Regiao();
    obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
    obj.setNome(request.getParameter("txtNome"));
    obj.setDescricao(request.getParameter("Desc"));
    dao.alterar(obj);
    
    
%>
<%@include file="../cabecalho.jsp"%>

         <h1 >Alteração de Região</h1>
            
         <p class="done">
             Registro cadastrado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>