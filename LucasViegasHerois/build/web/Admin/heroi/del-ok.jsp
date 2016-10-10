<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%
 //verifico se veio o código por get  
 if(request.getParameter("txtCodigo")==null) 
 {
     response.sendRedirect("index.jsp");
     return; //paro a execução aqui
 }
 /*
    1. Buscar o objeto a partir da chave primária
    2. Mando excluir na dao
 */
    HeroiDAO dao = new HeroiDAO();
    Heroi obj = new    Heroi();
    Integer codigo = Integer.parseInt(request.getParameter("txtCodigo"));
    //Busca a categoria
    obj = dao.buscarPorChavePrimaria(codigo);
    //excluir a categoria buscada
    dao.excluir(obj);
 %>

<%@include file="../cabecalho.jsp"%>

         <h1 >Exclusão de Herói</h1>
            
         <div>
             Registro excluído com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>
