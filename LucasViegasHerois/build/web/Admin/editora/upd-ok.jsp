<%@page import="java.sql.Date"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%
if(request.getParameter("txtNome") == null || request.getParameter("txtCodigo") == null){
    response.sendRedirect("index.jsp");
    return;
}
    
    EditoraDAO dao = new EditoraDAO();
    Editora obj = new Editora();
    obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
    obj.setNome(request.getParameter("txtNome"));
    obj.setDatafundacao(Date.valueOf(request.getParameter("DataF")));
    dao.alterar(obj);
    
    
%>
<%@include file="../cabecalho.jsp"%>

         <h1 >Alteração de Editora</h1>
            
         <p class="done">
             Registro cadastrado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>