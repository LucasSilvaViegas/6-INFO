<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    //BUSCAR O OBJETO A PARTIR DA CHAVE PRIM�RIA E EXIBIR AS INFORMA�OES DO OBJETO NO FORMULARIO
    
    EditoraDAO dao = new EditoraDAO();
    Editora obj = new Editora();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    obj = dao.buscarPorChavePrimaria(codigo);
    
    %>

<%@include file="../cabecalho.jsp"%>
        <div>
            <h1 class="centro">Altera��o de Editora</h1>
            
            <div>
                
                <form action="upd-ok.jsp" method="post">
                    <label>C�digo</label><input type="text" 
                                               value="<%=obj.getCodigo()%>" name="txtCodigo" readonly/><br/>
                    <label>Nome:</label><input type="text" 
                                               value="<%=obj.getNome()%>" name="txtNome" /><br />
                    <label>Data de Funda��o:</label><input type="date" name="DataF" placeholder="Insira a data" 
                                    value="<%=obj.getDatafundacao()%>"/><br />
                    <input type="reset" value="Limpar" />
                    <input type="submit" value="Salvar" />
                    <br/><br/>
                </form>
            </div>
        </div>

        


    </body>
</html>
