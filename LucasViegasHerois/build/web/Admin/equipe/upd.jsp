<%@page import="java.util.List"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%@page import="modelo.Equipe"%>
<%@page import="dao.EquipeDAO"%>
<%
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    //BUSCAR O OBJETO A PARTIR DA CHAVE PRIMÁRIA E EXIBIR AS INFORMAÇOES DO OBJETO NO FORMULARIO
    
    EquipeDAO dao = new EquipeDAO();
    Equipe obj = new Equipe();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    obj = dao.buscarPorChavePrimaria(codigo);
    
    %>

<%@include file="../cabecalho.jsp"%>
        <div>
            <h1 class="centro">Alteração de Equipe</h1>
            
            <div>
                
                <form action="upd-ok.jsp" method="post">
                    <label>Código</label><input type="text" 
                                               value="<%=obj.getCodigo()%>" name="txtCodigo" readonly/><br/>
                    <label>Nome:</label><input type="text" 
                                               value="<%=obj.getNome()%>" name="txtNome" /><br />
                    <label>Descrição:</label><input type="text" name="Desc" placeholder="Insira a descrição" 
                                    value="<%=obj.getDescricao()%>"/><br />
                    <label>Heróis</label><br/>
        <%                
            HeroiDAO Heroidao = new HeroiDAO();
            List<Heroi> Heroilista = Heroidao.listar();
            for (Heroi hero : Heroilista) {
        %>

        <input type="checkbox" name="heroi" value="<%=hero.getCodigo()%>"/> <%=hero.getCodinome()%> <br/>

        <%}%>
                    <input type="reset" value="Limpar" />
                    <input type="submit" value="Salvar" />
                    <br/><br/>
                </form>
            </div>
        </div>

        


    </body>
</html>
