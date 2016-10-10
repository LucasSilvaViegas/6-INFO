
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%
    //VERIFICO DE VEIO O CÓDIGO POR GET
    if(request.getParameter("txtCodigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;//PARO A EXECUÇÃO AQUI
    }
    
    EditoraDAO dao = new EditoraDAO();
    Editora obj = new Editora();
    Integer codigo = Integer.parseInt(request.getParameter("txtCodigo"));
    
    obj = dao.buscarPorChavePrimaria(codigo);
    dao.excluir(obj);
    
    %>
<%@include file="../cabecalho.jsp"%>

         <h1 >Exclusão de Equipe</h1>
            
         <p class="done">
             Registro excluído com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>
