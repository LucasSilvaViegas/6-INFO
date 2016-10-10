<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<link rel="stylesheet" href="../style.css" />

<%
    //Instanciar DAO
    CategoriaDAO dao = new CategoriaDAO();
    //verificar se veio algo no filtro
    //se vier passamos o filtro para DAO
    //se não tiver filtro traz todos registros
    List<Categoria> lista;
    if(request.getParameter("txtFiltro") !=null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }
    else{
        //Chama o método que retorna 
        //todos os registros do Banco de Dados
        lista = dao.listar();
    }
%>    

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="../cabecalho.jsp" %>


<div>

    <h1>Categoria</h1>
    <a href="add.jsp">Novo</a><br/>
    <form method="post">
                    <input type="text" name="txtFiltro" placeholder="digite o texto da pesquisa" />
                    <input type="submit" value="Pesquisar"/><br />
                </form>
                    <table>
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                           
                            <th>Ações</th>
                        </tr>
                        
                        <%for(Categoria item: lista){%>
                            
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getNome()%></td>
                            
                            <td><a href="upd.jsp?codigo=<%=item.getCodigo()%>">Editar</a>
                                <a href="del-ok.jsp?codigo=<%=item.getCodigo()%>">Excluir</a>
                            </td>
                        </tr>
                        
                        <%}%>
                        
                    </table>
    <br/><br/>    <br/><br/>

        </div>

    </body>
</html>