
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%
    //VERIFICO DE VEIO O CÓDIGO POR GET
    if(request.getParameter("txtNome")==null)
    {
        response.sendRedirect("index.jsp");
        return;//PARO A EXECUÇÃO AQUI
    }
    
    JogadorDAO dao = new JogadorDAO();
    Jogador obj = new Jogador();
    
    obj = dao.buscarPorChavePrimaria(request.getParameter("txtNome"));
    dao.excluir(obj);
    
    %>
<%@include file="../cabecalho.jsp"%>

         <h1 >Exclusão de Jogador</h1>
            
         <p class="done">
             Registro excluído com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>
