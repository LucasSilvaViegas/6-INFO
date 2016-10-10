<%@page import="modelo.Regiao"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.RegiaoDAO"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp"%>

<%
CategoriaDAO cDAO = new CategoriaDAO();
List<Categoria> cLista = cDAO.listar();

RegiaoDAO rDAO = new RegiaoDAO();
List<Regiao> rLista = rDAO.listar();

EditoraDAO eDAO = new EditoraDAO();
List<Editora> eLista = eDAO.listar();


%>
        <div>
            <h1 class="centro">Cadastro de Herói</h1>
            
            <div>
                
                <form action="add-ok.jsp" method="post" enctype="multipart/form-data">
                    <label>Nome:</label><input type="text" 
                                     name="txtNome"/><br />
                    <label>Codinome:</label><input type="text" 
                                     name="txtCodinome"/><br />
                    <label>Descrição</label>
                    <textarea name="txtDescricao"></textarea><br />
                    
                    <label>Foto: (VC SÓ PODE COLOCAR ESSE CAMPO UMA VEZ)</label><br/>
                    <input type="file" name="txtFoto" /><br/>
                    
                    <label>Inteligência:</label><input type="number" 
                                     name="txtInteligencia" 
                                     min="1" max="10"/><br />
                    <label>Velocidade:</label><input type="number" 
                                     name="txtVelocidade"   
                                     min="1" max="10"/><br />
                    <label>Resistência:</label><input type="number" 
                                     name="txtResistecia"
                                     min="1" max="10"/><br />
                    <label>Força:</label><input type="number" 
                                     name="txtForca"
                                     min="1" max="10"/><br />
                    <label>Projeção de Energia:</label><input type="number" 
                                     name="txtProjecaodeEnergia"
                                     min="1" max="10"/><br />
                    <label>Habilidade em Combate:</label><input type="number" 
                                     name="txtHabilidadeemCombate"
                                     min="1" max="10"/><br />
                    <label>Categoria:</label>
                    <select name="selCategoria">
                        <option value="">Selecione</option>
                        <%
                        for(Categoria cat:cLista)
                        {
                        %>
                            <option value="<%=cat.getCodigo()%>" ><%=cat.getNome()%></option>
                        <%
                        }
                        %>
                        
                    </select>
                    <br />
                    <label>Editora:</label>
                        <select name="selEditora">
                            <option value="">Selecione</option>
                                                <%
                                for(Editora ed:eLista)
                                {
                                %>
                                    <option value="<%=ed.getCodigo()%>" ><%=ed.getNome()%></option>
                                <%
                                }
                                %>
                            </select>
                    <br />
                    <label>Região</label>
                    <select name="selRegiao">
                        <option value="">Selecione</option>
                        <%
                        for(Regiao reg:rLista)
                        {
                        %>
                            <option value="<%=reg.getCodigo()%>" ><%=reg.getNome()%></option>
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
