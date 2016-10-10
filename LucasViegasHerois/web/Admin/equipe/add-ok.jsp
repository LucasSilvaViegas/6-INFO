
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Heroi"%>
<%@page import="modelo.Equipe"%>
<%@page import="dao.EquipeDAO"%>


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
    EquipeDAO dao = new EquipeDAO();
    //monto o objeto com os dados para sem inserir
    Equipe obj = new Equipe();
    
    obj.setNome(request.getParameter("txtNome"));
    obj.setDescricao(request.getParameter("Desc"));
    
    String[] heroisForm = request.getParameterValues("heroi");
    
    List<Heroi> lista = new ArrayList<Heroi>();
    for(String heroif:heroisForm){
        Heroi h = new Heroi();
        h.setCodigo(Integer.parseInt(heroif));
        lista.add(h);
    }
    //EXECUTO O INSERT NA DAO
    obj.setHeroiList(lista);
    dao.incluir(obj);
    
    

%>
<%@include file="../cabecalho.jsp"%>

         <h1 >Cadastro de Equipe</h1>
            
         <p class=done>
             Registro cadastrado com sucesso.<br />
             
             <a href="index.jsp">Voltar para Listagem</a>
         </p>
    </body>
</html>



