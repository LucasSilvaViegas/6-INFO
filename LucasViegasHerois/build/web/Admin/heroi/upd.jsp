<%@page import="dao.EditoraDAO"%>
<%@page import="dao.RegiaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Editora"%>
<%@page import="modelo.Regiao"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<%
    if (request.getParameter("codigo") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    /*
        1. Buscar o objeto a partir da chave primária
        2. Exibo as informações do objeto no formulário
        
     */

    HeroiDAO dao = new HeroiDAO();
    Heroi obj;
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    obj = dao.buscarPorChavePrimaria(codigo);

    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();

    RegiaoDAO rDAO = new RegiaoDAO();
    List<Regiao> rLista = rDAO.listar();

    EditoraDAO eDAO = new EditoraDAO();
    List<Editora> eLista = eDAO.listar();

%>
<%@include file="../cabecalho.jsp"%>
<div>
    <h1 class="centro">Alteração de Heroi</h1>

    <div>

        <form action="upd-ok.jsp" method="post" enctype="multipart/form-data">
            <label>LEMBRE-SE! VOCÊ NÃO PODE ALTERAR A FOTO, E TEM QUE COLOCAR OS CAMPOS REGIÃO, CATEGORIA E EDITORA OUTRA VEZ, MAS OS CAMPOS SELECIONADOS DESTA JÁ ESTÃO SELECIONADOS.</label><br/>
            <label>Código</label><input type="text" name="txtCodigo" 
                                        value="<%=obj.getCodigo()%>" readonly /><br />
            <label>Nome:</label><input type="text" 
                                       name="txtNome"
                                       value="<%=obj.getNome()%>"/><br />
            <label>Codinome:</label><input type="text" 
                                           name="txtCodinome"
                                           value="<%=obj.getCodinome()%>"/><br />
            <label>Descrição</label>
            <textarea name="txtDescricao"><%=obj.getDescricao()%></textarea><br />
             
           
            <label>Inteligência:</label><input type="number" 
                                               name="txtInteligencia" 
                                               min="1" max="10"
                                              value="<%=obj.getInteligencia()%>"/><br />
            <label>Velocidade:</label><input type="number" 
                                             name="txtVelocidade"
                                             min="1" max="10"
                                             value="<%=obj.getVelocidade()%>"/><br />
            <label>Resistência:</label><input type="number" 
                                              name="txtResistecia"
                                              min="1" max="10"
                                              value="<%=obj.getResistencia()%>"/><br />
            <label>Projeção de Energia:</label><input type="number" 
                                                      value="<%=obj.getProjecaoenergia()%>"
                                                      name="txtProjecaodeEnergia"
                                                      min="1" max="10" /><br />
            <label>Habilidade em Combate:</label><input type="number" 
                                                        name="txtHabilidadeemCombate"
                                                        min="1" max="10"
                                                        value="<%=obj.getHabilidadecombate()%>"/><br />
            <label>Força:</label><input type="number" 
                                        name="txtForca"
                                        min="1" max="10"
                                        value="<%=obj.getForca()%>"/><br />
            
            <label>Categoria:</label>
            <select name="selCategoria">
                <option>Selecione</option>
                <%
                    String marcadoR;
                    for (Categoria cat : cLista) {
                        if (cat.getCodigo() == obj.getCategoria().getCodigo()) {
                            marcadoR = ">";
                        } else {
                            marcadoR = "";
                        }
                %>
                <option value="<%=cat.getCodigo()%>"><%=marcadoR%><%=cat.getNome()%></option>
                <%
                    }
                %>                

            </select>
            <br />
            <label>Editora:</label>
            <select name="selEditora">
                <option>Selecione</option>
                <%
                    for (Editora edi : eLista) {
                        if (edi.getCodigo() == obj.getEditora().getCodigo()) {
                            marcadoR = ">";
                        } else {
                            marcadoR = "";
                        }
                %>

                <option value="<%=edi.getCodigo()%>"><%=marcadoR%><%=edi.getNome()%></option>
                <%
                    }
                %>                
            </select>
            <br />
            <label>Região</label>
            <select name="selRegiao">
                <option>Selecione</option>
                <%
                    for (Regiao reg : rLista) {
                        if (reg.getCodigo() == obj.getRegiao().getCodigo()) {
                            marcadoR = ">";
                        } else {
                            marcadoR = "";
                        }
                %>
                
                <option value="<%=reg.getCodigo()%>"><%=marcadoR%><%=reg.getNome()%></option>
                <%
                    }
                %>

            </select>
            <br />
            <input type="reset" value="Limpar" />
            <input type="submit" value="Salvar" />
        </form>
    </div>
</div>



</body>
</html>
