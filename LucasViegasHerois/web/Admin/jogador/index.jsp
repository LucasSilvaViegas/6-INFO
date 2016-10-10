<%@page import="dao.JogadorDAO"%>
<%@page import="modelo.Jogador"%>
<%@page import="java.util.List"%>
<link rel="stylesheet" href="../style.css" />
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<%
    //Instanciar DAO
    JogadorDAO dao = new JogadorDAO();
    //verificar se veio algo no filtro
    //se vier passamos o filtro para DAO
    //se não tiver filtro traz todos registros
    List<Jogador> lista;
    if(request.getParameter("filtro") !=null){
        lista = dao.listar(request.getParameter("filtro"));
    }
    else{
        //Chama o método que retorna 
        //todos os registros do Banco de Dados
        lista = dao.listar();
    }
%>  

<%@include file="../cabecalho.jsp" %>


<div>

    <h1>Jogador</h1>
    <a href="add.jsp">Novo</a><br/>
    <form method="post">
                    <input type="text" name="filtro" placeholder="digite o texto da pesquisa" />
                    <input type="submit" value="Pesquisar"/>
                </form><br />
                    <br/><table>
                        <tr>
                            <th>Login</th>
                            <th>Email</th>
                            <th>Senha</th>
                        </tr>
                            <%for(Jogador item: lista)
                             {
                             %>
                            
                        <tr>
                            <td><%=item.getLogin()%></td>
                            <td><%=item.getEmail()%></td>
                            
                            
                            <td><a href="upd.jsp?txtNome=<%=item.getLogin()%>">Editar</a>
                                <a href="del-ok.jsp?txtNome=<%=item.getLogin()%>">Excluir</a>
                            </td>
                        </tr>
                        <%}%>

                        
                    </table>
    <br/><br/>    <br/><br/>

        </div>

    </body>
</html>