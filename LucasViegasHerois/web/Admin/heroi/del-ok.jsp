<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%
 //verifico se veio o c�digo por get  
 if(request.getParameter("txtCodigo")==null) 
 {
     response.sendRedirect("index.jsp");
     return; //paro a execu��o aqui
 }
 /*
    1. Buscar o objeto a partir da chave prim�ria
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

         <h1 >Exclus�o de Her�i</h1>
            
         <div>
             Registro exclu�do com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </div>
    </body>
</html>
