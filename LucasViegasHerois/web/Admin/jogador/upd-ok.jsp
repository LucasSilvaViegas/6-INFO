
<%@page import="dao.JogadorDAO"%>
<%@page import="modelo.Jogador"%>

<%
if(request.getParameter("txtNome") == null){
    response.sendRedirect("index.jsp");
    return;
}
    
    JogadorDAO dao = new JogadorDAO();
    Jogador obj = new Jogador();
    obj.setEmail(request.getParameter("Email"));
    obj.setLogin(request.getParameter("txtNome"));
    obj.setSenha(request.getParameter("repetir_senha"));
    dao.alterar(obj);
    
    
%>
<%@include file="../cabecalho.jsp"%>


         <h1 >Alteração de Jogador</h1>
            
         <p class="done">
             Registro alterado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>