
<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>


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
    JogadorDAO dao = new JogadorDAO();
    //monto o objeto com os dados para sem inserir
    Jogador obj = new Jogador();
    
    obj.setLogin(request.getParameter("txtNome"));
    obj.setEmail(request.getParameter("Email"));
    obj.setSenha(request.getParameter("repetir_senha"));
    
    //EXECUTO O INSERT NA DAO
    dao.incluir(obj);

%>
<%@include file="../cabecalho.jsp"%>

         <h1 >Cadastro de Jogador</h1>
            
         <p class=done>
             Registro cadastrado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>



