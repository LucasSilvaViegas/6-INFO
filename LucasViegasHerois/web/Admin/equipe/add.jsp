<%@page import="modelo.Heroi" %>
<%@page import="java.util.List" %>
<%@page import="dao.HeroiDAO" %>
<%@include file="../cabecalho.jsp"%>
<div>
    <h1 class="centro">Cadastro de Equipe</h1>

    <div>

        <form method="post" action="add-ok.jsp">
        <label>Nome:</label><input type="text" name="txtNome" placeholder="Insira o Nome de Login" required/><br />
        <label>Descricao:</label><input type="text" name="Desc" placeholder="Insira a Descrição" required/><br />
        <label>Heróis</label><br/>
        <%                
            HeroiDAO dao = new HeroiDAO();
            List<Heroi> lista = dao.listar();
            for (Heroi hero : lista) {
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
