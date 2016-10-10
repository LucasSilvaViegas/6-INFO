<%@page import="dao.RegiaoDAO"%>
<%@page import="modelo.Regiao"%>
<%@page import="java.util.List"%>
<link rel="stylesheet" href="../style.css" />
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    //Instanciar DAO
    RegiaoDAO dao = new RegiaoDAO();
    //verificar se veio algo no filtro
    //se vier passamos o filtro para DAO
    //se não tiver filtro traz todos registros
    List<Regiao> lista;
    if(request.getParameter("txtFiltro") !=null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }
    else{
        //Chama o método que retorna 
        //todos os registros do Banco de Dados
        lista = dao.listar();
    }
%>  

<%@include file="../cabecalho.jsp" %>


<div>

    <h1>Região</h1>
    <a href="add.jsp">Novo</a><br/>
    <form method="post">
                    <input type="text" name="txtFiltro" placeholder="digite o texto da pesquisa" />
                    <input type="submit" value="Pesquisar"/>
                </form><br />
                    <br/><table>
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th>Descrição</th>
                            <th>Ações</th>
                        </tr>
                            <%for(Regiao item: lista)
                             {
                             %>
                            
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getNome()%></td>
                            <td><%=item.getDescricao()%></td>
                            
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