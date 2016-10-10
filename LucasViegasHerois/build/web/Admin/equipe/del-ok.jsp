
<%@page import="modelo.Equipe"%>
<%@page import="dao.EquipeDAO"%>
<%
    //VERIFICO DE VEIO O CÓDIGO POR GET
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;//PARO A EXECUÇÃO AQUI
    }
    
    EquipeDAO dao = new EquipeDAO();
    Equipe obj = new Equipe();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    
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
