
<%@page import="modelo.Regiao"%>
<%@page import="dao.RegiaoDAO"%>
<%
    //VERIFICO DE VEIO O CÓDIGO POR GET
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;//PARO A EXECUÇÃO AQUI
    }
    
    RegiaoDAO dao = new RegiaoDAO();
    Regiao obj = new Regiao();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    
    obj = dao.buscarPorChavePrimaria(codigo);
    dao.excluir(obj);
    
    %>
<%@include file="../cabecalho.jsp"%>

         <h1 >Exclusão de Região</h1>
            
         <p class="done">
             Registro excluído com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>
