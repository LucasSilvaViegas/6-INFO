
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>
<%@page import="dao.EditoraDAO"%>
<link rel="stylesheet" href="../style.css" />
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    //Instanciar DAO
    EditoraDAO dao = new EditoraDAO();
    //verificar se veio algo no filtro
    //se vier passamos o filtro para DAO
    //se não tiver filtro traz todos registros
    List<Editora> lista;
    if(request.getParameter("txtFiltro") !=null){
        lista = dao.listar(request.getParameter("txtFiltro"));
    }
    else{
        //Chama o método que retorna 
        //todos os registros do Banco de Dados
        lista = dao.listar();
    }
    
    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
    

%>  

<%@include file="../cabecalho.jsp" %>


<div>

    <h1>Editora</h1>
    <a href="add.jsp">Novo</a><br/>
<form method="post">
                    <input type="text" name="txtFiltro" placeholder="digite o texto da pesquisa" />
                    <input type="submit" value="Pesquisar"/><br />       
                    <br/>
                    <table>

                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th>Data de Fundação</th>
                            <th>Ações</th>
                        </tr>
                        
                             <%for(Editora item: lista)
                             {
                             %>
                            
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getNome()%></td>
                            <td><%=formato.format(item.getDatafundacao())%></td>
                            
                            <td><a href="upd.jsp?txtCodigo=<%=item.getCodigo()%>">Editar</a>
                                <a href="del-ok.jsp?txtCodigo=<%=item.getCodigo()%>">Excluir</a>
                            </td>
                        </tr>
                        <%}%>
                        
                        
                    </table>
    <br/><br/>    <br/><br/>

        </div>

    </body>
</html>