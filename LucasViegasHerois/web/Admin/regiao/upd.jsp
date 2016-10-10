<%@page import="modelo.Regiao"%>
<%@page import="dao.RegiaoDAO"%>
<%
    if(request.getParameter("codigo")==null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    //BUSCAR O OBJETO A PARTIR DA CHAVE PRIMÁRIA E EXIBIR AS INFORMAÇOES DO OBJETO NO FORMULARIO
    
    RegiaoDAO dao = new RegiaoDAO();
    Regiao obj = new    Regiao();
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    obj = dao.buscarPorChavePrimaria(codigo);
    
    %>

<%@include file="../cabecalho.jsp"%>
        <div>
            <h1 class="centro">Alteração de Região</h1>
            
            <div>
                
                <form action="upd-ok.jsp" method="post">
                    <label>Código</label><input type="text" 
                                               value="<%=obj.getCodigo()%>" name="txtCodigo" readonly/><br/>
                    <label>Nome:</label><input type="text" 
                                               value="<%=obj.getNome()%>" name="txtNome" /><br />
                    <label>Descrição:</label><input type="text" name="Desc" placeholder="Insira a descrição" 
                                    value="<%=obj.getDescricao()%>"/><br />
                    <input type="reset" value="Limpar" />
                    <input type="submit" value="Salvar" />
                    <br/><br/>
                </form>
            </div>
        </div>

        


    </body>
</html>
