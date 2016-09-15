

<%@page import="util.Upload"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "Digite abaixo";
    String classe = "alert-danger";

    Upload upload = new Upload();
    upload.setFolderUpload("fotos");

    Produto obj = new Produto();
    ProdutoDAO dao = new ProdutoDAO();

    MarcaDAO mDAO = new MarcaDAO();
    List<Marca> mLista = mDAO.listar();
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();

    if (request.getMethod().equals("POST")) {
        if (upload.formProcess(getServletContext(), request)) {
            obj.setTitulo(upload.getForm().get("txtTitulo").toString());
            obj.setDescricao(upload.getForm().get("txtDesc").toString());
            obj.setImagem1(upload.getFiles().get(0));
            obj.setQuant(Integer.parseInt(upload.getForm().get("txtQuant").toString()));

            obj.setPreco(upload.getForm().get("txtPreco").toString());
            Categoria categoria = new Categoria();
            categoria.setCodigo(Integer.parseInt(upload.getForm().get("txtCat").toString()));
            obj.setCodcategoria(categoria);
            Marca marca = new Marca();
            marca.setCodigo(Integer.parseInt(upload.getForm().get("txtMarca").toString()));
            obj.setCodmarca(marca);
            if (upload.getForm().get("txtDest") != null) {
                obj.setDestaque(true);
            } else {
                obj.setDestaque(false);
            }
            if (obj == null) {
                response.sendRedirect("index.jsp");
                return;
            } else {
                if (!upload.getFiles().get(1).isEmpty()) {
                    obj.setImagem2(upload.getFiles().get(1));
                }
                if (!upload.getFiles().get(2).isEmpty()) {
                    obj.setImagem3(upload.getFiles().get(2));
                }
                if (!upload.getFiles().get(0).isEmpty()) {
                    obj.setImagem1(upload.getFiles().get(0));
                }
                dao.incluir(obj);
            }

            Boolean resultado = dao.incluir(obj);
            if (resultado) {
                msg = "Produto Adicionado com Sucesso";
                classe = "alert-success";
            } else {
                msg = "Não foi Possivel Adicionar";
                classe = "alert-danger";
            }
        }
    }


%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Usuário
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="#" method="post" enctype="multipart/form-data">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Titulo</label>
                        <input class="form-control" type="text" name="txtTitulo" required />
                    </div>
                    <div class="form-group">
                        <label>Descrição</label>
                        <input class="form-control" type="text" name="txtDesc" required />
                    </div>
                    <div class="form-group">
                        <label>Quantidade</label>
                        <input class="form-control" type="number" name="txtQuant" required />
                    </div>
                    <div class="form-group">
                        <label>Preço</label>
                        <input class="form-control" type="number" name="txtPreco" required />
                    </div>

                    <div class="form-group">
                        <label>Categoria</label>
                        <select name="txtCat" class="form-control" required>
                            <option value="">Selecione</option>
                            <%
                                for (Categoria cat : cLista) {
                            %>
                            <option value="<%=cat.getCodigo()%>" ><%=cat.getNome()%></option>
                            <%
                                }
                            %>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>Marca</label>
                        <select name="txtMarca" class="form-control" required>
                            <option value="">Selecione</option>
                            <%
                                for (Marca mar : mLista) {
                            %>
                            <option value="<%=mar.getCodigo()%>" ><%=mar.getNome()%></option>
                            <%
                                }
                            %>

                        </select>
                    </div>

                    <div class="form-group">
                        <label>Imagem</label>
                        <input class="form-control" type="file" name="txtImg1" required />
                    </div>
                    <div class="form-group">
                        <label>Imagem</label>
                        <input class="form-control" type="file" name="txtImg2" />
                    </div>
                    <div class="form-group">
                        <label>Imagem</label>
                        <input class="form-control" type="file" name="txtImg3" />
                    </div>
                    <div class="form-group">
                        <label>Destaque</label>
                        <input class="form-control" type="checkbox" name="txtDest" />
                    </div>





                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>


    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>