
<%@page import="modelo.Equipe"%>
<%@page import="dao.EquipeDAO"%>
<%
    //VERIFICO DE VEIO O C�DIGO POR GET
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;//PARO A EXECU��O AQUI
    }
    
    EquipeDAO dao = new EquipeDAO();
    Equipe obj = new Equipe();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    
    obj = dao.buscarPorChavePrimaria(codigo);
    dao.excluir(obj);
    
    %>
<%@include file="../cabecalho.jsp"%>

         <h1 >Exclus�o de Equipe</h1>
            
         <p class="done">
             Registro exclu�do com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>
