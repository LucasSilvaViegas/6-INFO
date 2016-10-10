<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
    if(request.getParameter("txtNome") == null || request.getParameter("txtCodigo") ==null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    CategoriaDAO dao = new CategoriaDAO();
    Categoria obj = new Categoria();
    //Monto o objeto a partir das informações do formulário
    obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
    obj.setNome(request.getParameter("txtNome"));
    //Gravo a atualização na base de dados
    dao.alterar(obj);
    
%>


<%@include file="../cabecalho.jsp"%>

         <h1 >Alteração de Categoria</h1>
            
         <div>
             Registro alterado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>