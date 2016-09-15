package org.apache.jsp.Admin.produto;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import util.Upload;
import modelo.Categoria;
import dao.CategoriaDAO;
import java.math.BigInteger;
import modelo.Produto;
import dao.ProdutoDAO;
import java.util.List;
import dao.MarcaDAO;
import modelo.Marca;

public final class add_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Admin/produto/../cabecalho.jsp");
    _jspx_dependants.add("/Admin/produto/../rodape.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"pt-br\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("        <title>Sistema de Comércio Eletrônico</title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap Core CSS -->\n");
      out.write("        <link href=\"../css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Custom CSS -->\n");
      out.write("        <link href=\"../css/sb-admin.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <!-- Custom Fonts -->\n");
      out.write("        <link href=\"../font-awesome/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("\n");
      out.write("        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n");
      out.write("        <!--[if lt IE 9]>\n");
      out.write("            <script src=\"https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js\"></script>\n");
      out.write("            <script src=\"https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js\"></script>\n");
      out.write("        <![endif]-->\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div id=\"wrapper\">\n");
      out.write("\n");
      out.write("            <!-- Navigation -->\n");
      out.write("            <nav class=\"navbar navbar-inverse navbar-fixed-top\" role=\"navigation\">\n");
      out.write("                <!-- Brand and toggle get grouped for better mobile display -->\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">\n");
      out.write("                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                        <span class=\"icon-bar\"></span>\n");
      out.write("                    </button>\n");
      out.write("                    <a class=\"navbar-brand\" href=\"../home\">\n");
      out.write("                        Área Administrativa\n");
      out.write("                    </a>\n");
      out.write("                </div>\n");
      out.write("                <!-- Top Menu Items -->\n");
      out.write("                <ul class=\"nav navbar-right top-nav\">\n");
      out.write("\n");
      out.write("                    <li class=\"dropdown\">\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"><i class=\"fa fa-user\"></i> John Smith <b class=\"caret\"></b></a>\n");
      out.write("                        <ul class=\"dropdown-menu\">\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\"><i class=\"fa fa-fw fa-user\"></i> Profile</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\"><i class=\"fa fa-fw fa-envelope\"></i> Inbox</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\"><i class=\"fa fa-fw fa-gear\"></i> Settings</a>\n");
      out.write("                            </li>\n");
      out.write("                            <li class=\"divider\"></li>\n");
      out.write("                            <li>\n");
      out.write("                                <a href=\"#\"><i class=\"fa fa-fw fa-power-off\"></i> Log Out</a>\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->\n");
      out.write("                <div class=\"collapse navbar-collapse navbar-ex1-collapse\">\n");
      out.write("                    <ul class=\"nav navbar-nav side-nav\">\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"../categoria/\"><i class=\"fa fa-fw fa-edit\"></i> Categoria</a>\n");
      out.write("                        </li>\n");
      out.write("                        <li>\n");
      out.write("                            <a href=\"../produto/\"><i class=\"fa fa-fw fa-bar-chart-o\"></i> Produto (COMING SOON)</a>\n");
      out.write("                        </li>\n");
      out.write("\n");
      out.write("                        <li><a href=\"../cliente\">Cliente</a></li>\n");
      out.write("                        \n");
      out.write("                        <li><a href=\"../marca\">Marca</a></li>\n");
      out.write("                        \n");
      out.write("                        <li><a href=\"../status\">Status</a></li>\n");
      out.write("                        <li><a href=\"../usuario\">Usuario</a></li>\n");
      out.write("\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("                <!-- /.navbar-collapse -->\n");
      out.write("            </nav>\n");
      out.write("\n");
      out.write("            <div id=\"page-wrapper\">\n");
      out.write("\n");
      out.write("                <div class=\"container-fluid\">\n");
      out.write("\n");
      out.write("                    <!-- Page Heading -->\n");
      out.write('\n');


    String msg = "testando";
    String classe = "alert-danger";

    MarcaDAO mDAO = new MarcaDAO();
    List<Marca> mLista = mDAO.listar();

    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();

    Upload upload = new Upload();

    upload.setFolderUpload("fotos");

    if (upload.formProcess(getServletContext(), request)) {

        ProdutoDAO dao = new ProdutoDAO();
        Produto obj = new Produto();

        if (request.getParameter("txtNome") != null) {
            msg = "Gravado com sucesso!";
            classe = "alert-success";//volta para a tela da listagem

            obj.setTitulo(upload.getForm().get("txtNome").toString());
            obj.setDescricao(upload.getForm().get("txtDescricao").toString());

            if (request.getParameter("destaque") != null) {
                obj.setDestaque(true);
            } else {
                obj.setDestaque(false);
            }

            obj.setPreco(upload.getForm().get("txtPreco").toString());
            obj.setQuant(Integer.parseInt(upload.getForm().get("txtEstado").toString()));

            Categoria categoria = new Categoria();
            categoria.setCodigo(Integer.parseInt(upload.getForm().get("selCategoria").toString()));
            obj.setCodcategoria(categoria);

            Marca marca = new Marca();
            marca.setCodigo(Integer.parseInt(upload.getForm().get("selMarca").toString()));
            obj.setCodmarca(marca);

            if (!upload.getFiles().isEmpty()) {
            obj.setImagem1(upload.getFiles().get(0));
            obj.setImagem2(upload.getFiles().get(1));
            obj.setImagem3(upload.getFiles().get(2));
        }
            
            dao.incluir(obj);

        } else {

            msg = "Dados inválidos";
            classe = "alert-danger";//volta para a tela da listagem

        }
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"col-lg-12\">\n");
      out.write("        <h1 class=\"page-header\">\n");
      out.write("            Sistema de Comércio Eletrônico\n");
      out.write("            <small>Admin</small>\n");
      out.write("        </h1>\n");
      out.write("        <ol class=\"breadcrumb\">\n");
      out.write("            <li>\n");
      out.write("                <i class=\"fa fa-dashboard\"></i>  <a href=\"index.jsp\">Área Administrativa</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"active\">\n");
      out.write("                <i class=\"fa fa-file\"></i> Aqui vai o conteúdo de apresentação\n");
      out.write("            </li>\n");
      out.write("        </ol>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- /.row -->\n");
      out.write("\n");
      out.write("<div class=\"row\">\n");
      out.write("    <div class=\"panel panel-default\">\n");
      out.write("        <div class=\"panel-heading\">\n");
      out.write("            Categoria\n");
      out.write("        </div>\n");
      out.write("        <div class=\"panel-body\">\n");
      out.write("\n");
      out.write("            <div class=\"alert ");
      out.print(classe);
      out.write("\">\n");
      out.write("                ");
      out.print(msg);
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <form action=\"#\" method=\"post\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                <form action=\"#\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                    <label>Nome:</label><input type=\"text\" name=\"txtNome\"/><br />\n");
      out.write("\n");
      out.write("                    <label>Marca:</label>\n");
      out.write("                    <select name=\"selMarca\">\n");
      out.write("                        <option value=\"\">Selecione</option>\n");
      out.write("                        ");

                            for (Marca mar : mLista) {
                        
      out.write("\n");
      out.write("                        <option value=\"");
      out.print(mar.getCodigo());
      out.write("\" >");
      out.print(mar.getNome());
      out.write("</option>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </select>\n");
      out.write("\n");
      out.write("                    <label>Categoria:</label>\n");
      out.write("                    <select name=\"selCategoria\">\n");
      out.write("                        <option value=\"\">Selecione</option>\n");
      out.write("                        ");

                            for (Categoria cat : cLista) {
                        
      out.write("\n");
      out.write("                        <option value=\"");
      out.print(cat.getCodigo());
      out.write("\" >");
      out.print(cat.getNome());
      out.write("</option>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </select>\n");
      out.write("\n");
      out.write("                    <label>Preço</label>\n");
      out.write("                    <input type=\"text\" name=\"txtPreco\" /><br/>\n");
      out.write("\n");
      out.write("                    <label>Quantidade</label>\n");
      out.write("                    <input type=\"number\" name=\"txtQtd\" /><br/>\n");
      out.write("\n");
      out.write("                    <label>Você só pode colocar fotos uma vez nos três campos!</label><br/>\n");
      out.write("\n");
      out.write("                    <label>Foto A:</label><br/>\n");
      out.write("                    <input type=\"file\" name=\"txtFoto1\" /><br/>\n");
      out.write("\n");
      out.write("                    <label>Foto B:</label><br/>\n");
      out.write("                    <input type=\"file\" name=\"txtFoto2\" /><br/>\n");
      out.write("\n");
      out.write("                    <label>Foto C:</label><br/>\n");
      out.write("                    <input type=\"file\" name=\"txtFoto3\" /><br/>\n");
      out.write("\n");
      out.write("                    <label>DESTAQUE:</label> <input type=\"checkbox\" name=\"destaque\"/><br/>\n");
      out.write("\n");
      out.write("                    <button class=\"btn btn-primary btn-sm\" type=\"submit\">Salvar</button>\n");
      out.write("\n");
      out.write("                </form>    \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<!-- /.row -->\n");
      out.write("</div>\n");
      out.write("<!-- /.container-fluid -->\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<!-- /#page-wrapper -->\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("<!-- /#wrapper -->\n");
      out.write("\n");
      out.write("<!-- jQuery -->\n");
      out.write("<script src=\"../js/jquery.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Bootstrap Core JavaScript -->\n");
      out.write("<script src=\"../js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
