
<%@page import="modelo.Regiao"%>
<%@page import="dao.RegiaoDAO"%>
<%
    //VERIFICO DE VEIO O C�DIGO POR GET
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;//PARO A EXECU��O AQUI
    }
    
    RegiaoDAO dao = new RegiaoDAO();
    Regiao obj = new Regiao();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    
    obj = dao.buscarPorChavePrimaria(codigo);
    dao.excluir(obj);
    
    %>
<%@include file="../cabecalho.jsp"%>

         <h1 >Exclus�o de Regi�o</h1>
            
         <p class="done">
             Registro exclu�do com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>
