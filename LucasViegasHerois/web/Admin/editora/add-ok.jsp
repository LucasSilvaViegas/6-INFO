
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
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
    EditoraDAO dao = new EditoraDAO();
    //monto o objeto com os dados para sem inserir
    Editora obj = new Editora();
   
    obj.setNome(request.getParameter("txtNome"));
    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
    
    obj.setDatafundacao(formato.parse(request.getParameter("DataF")));
    out.print(request.getParameter("DataF"));
    //EXECUTO O INSERT NA DAO
    dao.incluir(obj);
    
%>
<%@include file="../cabecalho.jsp"%>

         <h1 >Cadastro de Editora</h1>
            
         <p class=done>
             Registro cadastrado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>



