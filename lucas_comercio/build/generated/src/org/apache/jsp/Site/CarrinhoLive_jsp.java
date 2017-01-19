package org.apache.jsp.Site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import modelo.Produto;
import modelo.Itemcarrinho;
import dao.ProdutoDAO;
import modelo.Carrinho;
import modelo.Cliente;
import dao.MarcaDAO;
import modelo.Marca;
import dao.CategoriaDAO;
import modelo.Categoria;
import java.util.List;

public final class CarrinhoLive_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Site/cabecalho.jsp");
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
      out.write("<!--A Design by W3layouts\n");
      out.write("Author: W3layout\n");
      out.write("Author URL: http://w3layouts.com\n");
      out.write("License: Creative Commons Attribution 3.0 Unported\n");
      out.write("License URL: http://creativecommons.org/licenses/by/3.0/\n");
      out.write("-->\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");


    CategoriaDAO Cdao = new CategoriaDAO();
    MarcaDAO Mdao = new MarcaDAO();
    List<Categoria> cLista = Cdao.listar();
    List<Marca> cMarca = Mdao.listar();

      out.write("\n");
      out.write("\n");
      out.write("<html lang=\"en\">\n");
      out.write("    <head>\n");
      out.write("        <title>N-Air a E-commerce category Flat Bootstrap Responsive Website Template | Home :: w3layouts</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"keywords\" content=\"N-Air Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design\" />\n");
      out.write("        <script type=\"application/x-javascript\"> addEventListener(\"load\", function() {setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("        <meta charset utf=\"8\">\n");
      out.write("        <!--fonts-->\n");
      out.write("        <link href='//fonts.googleapis.com/css?family=Fredoka+One' rel='stylesheet' type='text/css'>\n");
      out.write("\n");
      out.write("        <!--fonts-->\n");
      out.write("        <!--bootstrap-->\n");
      out.write("        <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("        <!--coustom css-->\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <!--shop-kart-js-->\n");
      out.write("        <script src=\"js/simpleCart.min.js\"></script>\n");
      out.write("        <!--default-js-->\n");
      out.write("        <script src=\"js/jquery-2.1.4.min.js\"></script>\n");
      out.write("        <!--bootstrap-js-->\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <!--script-->\n");
      out.write("    </head>\n");
      out.write("    <body background=\"../fotos/white-abstract-background_1.jpg\">\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"header-top\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                        <a href=\"index.jsp\"><img src=\"../fotos/a.jpg\"></a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    ");
if (session.getAttribute("usuario") == null) {
      out.write("\n");
      out.write("                    <div class=\"login-bars\">\n");
      out.write("                        <a class=\"btn btn-default log-bar\" href=\"newaccount.jsp\" role=\"button\">Sign up</a>\n");
      out.write("                        <a class=\"btn btn-default log-bar\" href=\"login.jsp\" role=\"button\">Login</a>\n");
      out.write("\n");
      out.write("                        ");

                        } else {
                        
      out.write("\n");
      out.write("\n");
      out.write("                        <div class=\"login-bars\">\n");
      out.write("                            <a class=\"btn btn-default log-bar\" href=\"logoff.jsp\" role=\"button\">DESLOGAR</a>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <div class=\"cart box_1\">\n");
      out.write("                                <a href=\"carrinho.jsp\">\n");
      out.write("                                    <h3>Carrinho de Compras</h3>\n");
      out.write("                                </a> ");

                                    }
                                
      out.write("\n");
      out.write("                                <div class=\"clearfix\"> </div> <br/>\n");
      out.write("                                <form method=\"post\">\n");
      out.write("                                    <!--  Monta o filtro  -->\n");
      out.write("                                    <input type=\"text\" name=\"txtFiltro\" placeholder=\"PESQUISAR\" />\n");
      out.write("                                </form>\n");
      out.write("                            </div>\t\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"clearfix\"></div>\n");
      out.write("                    </div>\n");
      out.write("                    <!---menu-----bar--->\n");
      out.write("                    <div class=\"header-botom\">\n");
      out.write("                        <div class=\"content white\">\n");
      out.write("                            <nav class=\"navbar navbar-default nav-menu\" role=\"navigation\">\n");
      out.write("                                <div class=\"navbar-header\">\n");
      out.write("                                    <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\n");
      out.write("                                        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                                        <span class=\"icon-bar\"></span>\n");
      out.write("                                        <span class=\"icon-bar\"></span>\n");
      out.write("                                        <span class=\"icon-bar\"></span>\n");
      out.write("                                    </button>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"clearfix\"></div>\n");
      out.write("                                <!--/.navbar-header-->\n");
      out.write("                                <div class=\"collapse navbar-collapse collapse-pdng\" id=\"bs-example-navbar-collapse-1\">\n");
      out.write("                                    <ul class=\"nav navbar-nav nav-font\">\n");
      out.write("                                        <li class=\"dropdown\">\n");
      out.write("                                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Shop<b class=\"caret\"></b></a>\n");
      out.write("                                            <ul class=\"dropdown-menu\">\n");
      out.write("                                                <li><a href=\"index.jsp\">Shoes</a></li>\n");
      out.write("                                                <li><a href=\"index.jsp\">Tees</a></li>\n");
      out.write("                                                <li><a href=\"index.jsp\">Tops</a></li>\n");
      out.write("                                                <li class=\"divider\"></li>\n");
      out.write("                                                <li><a href=\"index.jsp\">Tracks</a></li>\n");
      out.write("                                                <li class=\"divider\"></li>\n");
      out.write("                                                <li><a href=\"index.jsp\">Gear</a></li>\n");
      out.write("                                            </ul>\n");
      out.write("                                        </li>\n");
      out.write("                                        <li class=\"dropdown\">\n");
      out.write("                                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Produtos<b class=\"caret\"></b></a>\n");
      out.write("                                            <ul class=\"dropdown-menu \">\n");
      out.write("\n");
      out.write("                                                <ul class=\"multi-column-dropdown\">\n");
      out.write("                                                    <li><a href=\"index.jsp\">Em destaque</a></li>\n");
      out.write("                                                    <li><a href=\"index.jsp?filtroD=");
      out.print(true);
      out.write("\">Todos os produtos</a>\n");
      out.write("                                                </ul>\n");
      out.write("\n");
      out.write("                                            </ul>\n");
      out.write("                                        </li>\n");
      out.write("                                        <li class=\"dropdown\">\n");
      out.write("                                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Categoria<b class=\"caret\"></b></a>\n");
      out.write("                                            <ul class=\"dropdown-menu\">\n");
      out.write("                                                ");

                                                    for (Categoria cat : cLista) {
                                                
      out.write("\n");
      out.write("                                                <li><a href=\"index.jsp?filtroC=");
      out.print(cat.getCodigo());
      out.write('"');
      out.write('>');
      out.print(cat.getNome());
      out.write("</a></li>\n");
      out.write("                                                    ");
 }
      out.write("                                           \n");
      out.write("                                            </ul>\n");
      out.write("                                        </li>\n");
      out.write("                                        <li class=\"dropdown\">\n");
      out.write("                                            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Marca<b class=\"caret\"></b></a>\n");
      out.write("                                            <ul class=\"dropdown-menu\">\n");
      out.write("                                                ");

                                                    for (Marca mar : cMarca) {
                                                
      out.write("\n");
      out.write("                                                <li><a href=\"index.jsp?filtroM=");
      out.print(mar.getCodigo());
      out.write('"');
      out.write('>');
      out.print(mar.getNome());
      out.write("</a></li>\n");
      out.write("                                                    ");
 }
      out.write("                                           \n");
      out.write("                                            </ul>\n");
      out.write("                                        </li>\n");
      out.write("                                        <div class=\"header-end\">\n");
      out.write("                                            <div class=\"container\">\n");
      out.write("                                                <br/><br/><br/>\n");
      out.write("                                                <div class=\"pull-center styl-hdn\">\n");
      out.write("\n");
      out.write("                                                    <h3>");
if (session.getAttribute("usuario") != null) {
      out.write("\n");
      out.write("                                                        Olá, <span>");
      out.print(((Cliente) session.getAttribute("usuario")).getNome());
      out.write("</span>. \n");
      out.write("                                                        ");

                                                            }
                                                        
      out.write("<br/>\n");
      out.write("                                                        Bem vindo ao GAME STOP, a sua cabana dos jogos!</h3>\n");
      out.write("                                                </div>\n");
      out.write("                                                <br/><br/>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                    </ul>\n");
      out.write("                                </div>\n");
      out.write("                            </nav>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {

        Carrinho carrinho;
        ProdutoDAO pdao = new ProdutoDAO();

        if (session.getAttribute("carrinho") == null) {
            carrinho = new Carrinho();
        } else {
            
            carrinho = (Carrinho) session.getAttribute("carrinho");

            if (request.getParameter("codigo") != null) {

                //EXCLUIR PRODUTO DO CARRINHO
                for (Itemcarrinho teste : carrinho.getItens()) {
                    if (teste.getProduto().getCodigo() == Integer.parseInt(request.getParameter("codigo"))) {
                        carrinho.getItens().remove(teste);
                        Double total = (carrinho.getTotal() - ((teste.getProduto().getPreco().doubleValue()) * (teste.getQuantidade())));
                        carrinho.setTotal(total);
                        break;
                    }
                }
            }
        }

        if (request.getMethod().equals("POST")) {

            Integer qtd = Integer.parseInt(request.getParameter("txtQuantidade"));
            Itemcarrinho item = new Itemcarrinho();
            Produto produto = pdao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("txtCodigo")));

            item.setQuantidade(qtd);
            item.setProduto(produto);

            //VER SE A LISTA JA EXISTE
            if (carrinho.getItens() == null) {
                List<Itemcarrinho> itens = new ArrayList<Itemcarrinho>();
                itens.add(item);
                carrinho.setItens(itens);
                carrinho.setTotal(qtd * produto.getPreco().doubleValue());
            } else {
                carrinho.getItens().add(item);
                Double total = (carrinho.getTotal() + (qtd * produto.getPreco().doubleValue()));
                carrinho.setTotal(total);
            }
            session.setAttribute("carrinho", carrinho);
        }

        if (carrinho.getItens() != null) {
            for (Itemcarrinho item : carrinho.getItens()) {
                Double precototalunidade = (item.getProduto().getPreco().doubleValue() * item.getQuantidade());



      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<img src=\"../fotos/");
      out.print(item.getProduto().getImagem1());
      out.write("\"/>\n");
      out.write("<ul>\n");
      out.write("    <li><p>Nome : ");
      out.print(item.getProduto().getTitulo());
      out.write(" </p></li>\n");
      out.write("    <li><p>Qtd : ");
      out.print(item.getQuantidade());
      out.write("</p></li>\n");
      out.write("    <li><p>Preço : $");
      out.print(item.getProduto().getPreco());
      out.write("</p></li>\n");
      out.write("    <li><p>Preço total : $");
      out.print(precototalunidade);
      out.write("</p></li>\n");
      out.write("    <li><span>");
      out.print(item.getProduto().getDescricao());
      out.write("</span></li>\n");
      out.write("</ul>\n");
      out.write("<a href=\"CarrinhoLive.jsp?codigo=");
      out.print(item.getProduto().getCodigo());
      out.write("\">Excluir</a>\n");
      out.write("--------------\n");
      out.write("<h1>Price total : $");
      out.print(carrinho.getTotal());
      out.write("</h1>\n");
      out.write("<a class=\"order\" href=\"finalizar.jsp\">Finalizar Compra</a>\n");
      out.write("\n");

            }
        }
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
