<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%
if(request.getParameter("codigo") == null)
{
    response.sendRedirect("index.jsp");
    return;
}
/*
        1. Buscar o objeto a partir da chave primária
        2. Exibo as informações do objeto no formulário
        
*/
CategoriaDAO dao = new CategoriaDAO();
Categoria obj;
Integer codigo = Integer.parseInt(request.getParameter("codigo"));
obj = dao.buscarPorChavePrimaria(codigo);
%>
<%@include file="../cabecalho.jsp"%>
<div>
    <h1 class="centro">Alteração de Categoria</h1>

    <div>

        <form action="upd-ok.jsp" method="post">
            <label>Código</label><input type="text" name="txtCodigo" 
                                        value="<%=obj.getCodigo()%>" readonly /><br />
            <label>Nome:</label><input type="text" name="txtNome" 
                                       value="<%=obj.getNome()%>"/><br />
            <input type="reset" value="Limpar" />
            <input type="submit" value="Salvar" />
        </form>
    </div>
        </div>



    </body>
</html>