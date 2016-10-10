
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.EquipeDAO"%>
<%@page import="modelo.Equipe"%>

<%
if(request.getParameter("txtNome") == null || request.getParameter("txtCodigo") == null){
    response.sendRedirect("index.jsp");
    return;
}
    
    EquipeDAO dao = new EquipeDAO();
    Equipe obj = new Equipe();
    obj.setCodigo(Integer.parseInt(request.getParameter("txtCodigo")));
    obj.setNome(request.getParameter("txtNome"));
    obj.setDescricao(request.getParameter("Desc"));
    
    String[] heroisForm = request.getParameterValues("heroi");
    
    List<Heroi> lista = new ArrayList<Heroi>();
    for(String heroif:heroisForm){
        Heroi h = new Heroi();
        h.setCodigo(Integer.parseInt(heroif));
        lista.add(h);
    }
    obj.setHeroiList(lista);
    dao.alterar(obj);
    
    
%>
<%@include file="../cabecalho.jsp"%>

         <h1 >Alteração de Equipe</h1>
            
         <p class="done">
             Registro cadastrado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>