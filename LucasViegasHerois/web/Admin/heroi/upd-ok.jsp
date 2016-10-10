<%@page import="util.Upload"%>
<%@page import="modelo.Editora"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Regiao"%>
<%@page import="dao.RegiaoDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>

<%
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();

    RegiaoDAO rDAO = new RegiaoDAO();
    List<Regiao> rLista = rDAO.listar();

    EditoraDAO eDAO = new EditoraDAO();
    List<Editora> eLista = eDAO.listar();
    /*
    Upload upload = new Upload();
    String msg;
    
    upload.setFolderUpload("fotos");

    if (upload.formProcess(getServletContext(), request)) {

        //verifico se foi enviado o campo txtNome
        if (upload.getForm().get("txtNome") == null) {
            //volta para a tela da listagem
            response.sendRedirect("index.jsp");
            return;
        }
        //verifica se o campo está vazio
        if (upload.getForm().get("txtNome").toString().isEmpty()) {
            //volta para a tela da listagem
            response.sendRedirect("index.jsp");
        }
*/
        //Gravar a categoria no banco
        HeroiDAO dao = new HeroiDAO();
        //Monto o objeto com os dados para sem inserir
        Heroi obj = new Heroi();
        
        obj.setCodigo(Integer.parseInt(upload.getForm().get("txtCodigo").toString()));
        obj.setNome(upload.getForm().get("txtNome").toString());
        obj.setCodinome(upload.getForm().get("txtCodinome").toString());
        obj.setDescricao(upload.getForm().get("txtDescricao").toString());
        obj.setForca(Integer.parseInt(upload.getForm().get("txtForca").toString()));
        obj.setInteligencia(Integer.parseInt(upload.getForm().get("txtInteligencia").toString()));
        obj.setHabilidadecombate(Integer.parseInt(upload.getForm().get("txtHabilidadeemCombate").toString()));
        obj.setProjecaoenergia(Integer.parseInt(upload.getForm().get("txtProjecaodeEnergia").toString()));
        obj.setVelocidade(Integer.parseInt(upload.getForm().get("txtVelocidade").toString()));
        obj.setResistencia(Integer.parseInt(upload.getForm().get("txtResistecia").toString()));
        //obj.setFoto(up);
        //AGORA AS FK
        Regiao regiao = new Regiao();
        regiao.setCodigo(Integer.parseInt(upload.getForm().get("selRegiao").toString()));
        obj.setRegiao(regiao);

        Categoria categoria = new Categoria();
        categoria.setCodigo(Integer.parseInt(upload.getForm().get("selCategoria").toString()));
        obj.setCategoria(categoria);

        Editora editora = new Editora();
        editora.setCodigo(Integer.parseInt(upload.getForm().get("selEditora").toString()));
        obj.setEditora(editora);

        if (!upload.getFiles().isEmpty()) {
            obj.setFoto(upload.getFiles().get(0));
        }

   
        dao.alterar(obj);
        
        msg = "Registro cadastrado com sucesso.";
    }
    else{
        msg = "Não foi possível inserir o registro.";
    }
%>


<%@include file="../cabecalho.jsp"%>

<h1 >Alteração de Herói</h1>

<div>
    <%=msg%><br />

    <a href="index.jsp">Voltar para Listagem</a>
</div>
</body>
</html>
