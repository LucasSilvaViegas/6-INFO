package org.apache.jsp.Site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Produto;
import dao.ProdutoDAO;
import modelo.Carrinho;
import modelo.Itemcarrinho;
import dao.MarcaDAO;
import modelo.Marca;
import dao.CategoriaDAO;
import modelo.Categoria;
import java.util.List;

public final class carrinho_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Site/cabecalho.jsp");
    _jspx_dependants.add("/Site/rodape.jsp");
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
      out.write("    <body>\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"header-top\">\n");
      out.write("                    <div class=\"logo\">\n");
      out.write("                        <a href=\"index.jsp\"><img src=\"../fotos/a.jpg\"></a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"login-bars\">\n");
      out.write("                        <a class=\"btn btn-default log-bar\" href=\"../Admin\" role=\"button\">Sign up</a>\n");
      out.write("                        <a class=\"btn btn-default log-bar\" href=\"../Admin\" role=\"button\">Login</a>\n");
      out.write("                        <div class=\"cart box_1\">\n");
      out.write("                            <a href=\"checkout.html\">\n");
      out.write("                                <h3>\n");
      out.write("                                    <div class=\"total\">\n");
      out.write("                                        <span class=\"simpleCart_total\"></span>(<span id=\"simpleCart_quantity\" class=\"simpleCart_quantity\"></span>)</div></h3>\n");
      out.write("                            </a>\n");
      out.write("                            <p><a href=\"javascript:;\" class=\"simpleCart_empty\">Empty Cart</a></p>\n");
      out.write("                            <div class=\"clearfix\"> </div> <br/>\n");
      out.write("                            <form method=\"post\">\n");
      out.write("                                <!--  Monta o filtro  -->\n");
      out.write("                                <input type=\"text\" name=\"txtFiltro\" placeholder=\"PESQUISAR\" />\n");
      out.write("                            </form>\n");
      out.write("                        </div>\t\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"clearfix\"></div>\n");
      out.write("                </div>\n");
      out.write("                <!---menu-----bar--->\n");
      out.write("                <div class=\"header-botom\">\n");
      out.write("                    <div class=\"content white\">\n");
      out.write("                        <nav class=\"navbar navbar-default nav-menu\" role=\"navigation\">\n");
      out.write("                            <div class=\"navbar-header\">\n");
      out.write("                                <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\n");
      out.write("                                    <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                                    <span class=\"icon-bar\"></span>\n");
      out.write("                                    <span class=\"icon-bar\"></span>\n");
      out.write("                                    <span class=\"icon-bar\"></span>\n");
      out.write("                                </button>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"clearfix\"></div>\n");
      out.write("                            <!--/.navbar-header-->\n");
      out.write("                            <div class=\"collapse navbar-collapse collapse-pdng\" id=\"bs-example-navbar-collapse-1\">\n");
      out.write("                                <ul class=\"nav navbar-nav nav-font\">\n");
      out.write("                                    <li class=\"dropdown\">\n");
      out.write("                                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Shop<b class=\"caret\"></b></a>\n");
      out.write("                                        <ul class=\"dropdown-menu\">\n");
      out.write("                                            <li><a href=\"index.jsp\">Shoes</a></li>\n");
      out.write("                                            <li><a href=\"index.jsp\">Tees</a></li>\n");
      out.write("                                            <li><a href=\"index.jsp\">Tops</a></li>\n");
      out.write("                                            <li class=\"divider\"></li>\n");
      out.write("                                            <li><a href=\"index.jsp\">Tracks</a></li>\n");
      out.write("                                            <li class=\"divider\"></li>\n");
      out.write("                                            <li><a href=\"index.jsp\">Gear</a></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li class=\"dropdown\">\n");
      out.write("                                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Produtos<b class=\"caret\"></b></a>\n");
      out.write("                                        <ul class=\"dropdown-menu \">\n");
      out.write("\n");
      out.write("                                            <ul class=\"multi-column-dropdown\">\n");
      out.write("                                                <li><a href=\"index.jsp\">Em destaque</a></li>\n");
      out.write("                                                <li><a href=\"index.jsp?filtroD=");
      out.print(true);
      out.write("\">Todos os produtos</a>\n");
      out.write("                                            </ul>\n");
      out.write("\n");
      out.write("                                        </ul>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li class=\"dropdown\">\n");
      out.write("                                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Categoria<b class=\"caret\"></b></a>\n");
      out.write("                                        <ul class=\"dropdown-menu\">\n");
      out.write("                                            ");

                                                for (Categoria cat : cLista) {
                                            
      out.write("\n");
      out.write("                                            <li><a href=\"index.jsp?filtroC=");
      out.print(cat.getCodigo());
      out.write('"');
      out.write('>');
      out.print(cat.getNome());
      out.write("</a></li>\n");
      out.write("                                                ");
 }
      out.write("                                           \n");
      out.write("                                        </ul>\n");
      out.write("                                    </li>\n");
      out.write("                                    <li class=\"dropdown\">\n");
      out.write("                                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Marca<b class=\"caret\"></b></a>\n");
      out.write("                                        <ul class=\"dropdown-menu\">\n");
      out.write("                                            ");

                                                for (Marca mar : cMarca) {
                                            
      out.write("\n");
      out.write("                                            <li><a href=\"index.jsp?filtroM=");
      out.print(mar.getCodigo());
      out.write('"');
      out.write('>');
      out.print(mar.getNome());
      out.write("</a></li>\n");
      out.write("                                                ");
 }
      out.write("                                           \n");
      out.write("                                        </ul>\n");
      out.write("                                    </li>\n");
      out.write("                                    <div class=\"header-end\">\n");
      out.write("                                        <div class=\"container\">\n");
      out.write("                                            <br/><br/><br/>\n");
      out.write("                                            <div class=\"pull-center styl-hdn\">\n");
      out.write("                                                <h3>Bem vindo ao GAME STOP, a sua cabana dos jogos!</h3>\n");
      out.write("                                            </div>\n");
      out.write("                                            <br/><br/>\n");
      out.write("                                        </div>\n");
      out.write("                                    </div>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </nav>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write('\n');
      out.write('\n');

    


    if(request.getMethod().equals("POST")){
        
        Integer codigo = Integer.parseInt(request.getParameter("txtCodigo"));
        Integer qtd = Integer.parseInt(request.getParameter("txtQuantidade"));
        
        if(session.getAttribute("carrinho")!=null){
            Carrinho carrinho = (Carrinho)session.getAttribute("carrinho");
            Itemcarrinho  item = new Itemcarrinho();
            item.setQuantidade(qtd);
            ProdutoDAO pdao = new ProdutoDAO();
            Produto produto = pdao.buscarPorChavePrimaria(codigo);
            item.setProduto(produto);
            carrinho.getItens().add(item);
            Double total = (carrinho.getTotal() + (qtd*produto.getPreco().doubleValue()));
            carrinho.setTotal(total);
        }
    }



      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!-- check-out -->\n");
      out.write("            <div class=\"check\">\n");
      out.write("                <div class=\"container\">\t \n");
      out.write("                    <div class=\"col-md-3 cart-total\">\n");
      out.write("                        <a class=\"continue\" href=\"#\">Continue to basket</a>\n");
      out.write("                        <div class=\"price-details\">\n");
      out.write("                            <h3>Price Details</h3>\n");
      out.write("                            <span>Total</span>\n");
      out.write("                            <span class=\"total1\">6200.00</span>\n");
      out.write("                            <span>Discount</span>\n");
      out.write("                            <span class=\"total1\">10%(Festival Offer)</span>\n");
      out.write("                            <span>Delivery Charges</span>\n");
      out.write("                            <span class=\"total1\">150.00</span>\n");
      out.write("                            <div class=\"clearfix\"></div>\t\t\t\t \n");
      out.write("                        </div>\n");
      out.write("                        <hr class=\"featurette-divider\">\n");
      out.write("                        <ul class=\"total_price\">\n");
      out.write("                           <li class=\"last_price\"> <h4>TOTAL</h4></li>\t\n");
      out.write("                           <li class=\"last_price\"><span>6150.00</span></li>\n");
      out.write("                           <div class=\"clearfix\"> </div>\n");
      out.write("                        </ul> \n");
      out.write("                        <div class=\"clearfix\"></div>\n");
      out.write("                        <a class=\"order\" href=\"#\">Place Order</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-9 cart-items\">\n");
      out.write("                        <h1>My Shopping Bag (2)</h1>\n");
      out.write("                            <script>$(document).ready(function(c) {\n");
      out.write("                                $('.close1').on('click', function(c){\n");
      out.write("                                    $('.cart-header').fadeOut('slow', function(c){\n");
      out.write("                                        $('.cart-header').remove();\n");
      out.write("                                    });\n");
      out.write("                                    });\t  \n");
      out.write("                                });\n");
      out.write("                           </script>\n");
      out.write("                        <div class=\"cart-header\">\n");
      out.write("                <div class=\"close1\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></div>\n");
      out.write("                            <div class=\"cart-sec simpleCart_shelfItem\">\n");
      out.write("                                    <div class=\"cart-item cyc\">\n");
      out.write("                                        <img src=\"images/grid8.jpg\" class=\"img-responsive\" alt=\"\"/>\n");
      out.write("                                    </div>\n");
      out.write("                                   <div class=\"cart-item-info\">\n");
      out.write("                                        <ul class=\"qty\">\n");
      out.write("                                            <li><p>Size : 9 US</p></li>\n");
      out.write("                                            <li><p>Qty : 1</p></li>\n");
      out.write("                                            <li><p>Price each : $190</p></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                        <div class=\"delivery\">\n");
      out.write("                                             <p>Service Charges : Rs.190.00</p>\n");
      out.write("                                             <span>Delivered in 2-3 bussiness days</span>\n");
      out.write("                                             <div class=\"clearfix\"></div>\n");
      out.write("                                        </div>\t\n");
      out.write("                                   </div>\n");
      out.write("                                   <div class=\"clearfix\"></div>\n");
      out.write("\n");
      out.write("                              </div>\n");
      out.write("                         </div>\n");
      out.write("                         <script>$(document).ready(function(c) {\n");
      out.write("                                $('.close2').on('click', function(c){\n");
      out.write("                                        $('.cart-header2').fadeOut('slow', function(c){\n");
      out.write("                                    $('.cart-header2').remove();\n");
      out.write("                                });\n");
      out.write("                                });\t  \n");
      out.write("                                });\n");
      out.write("                         </script>\n");
      out.write("                        <div class=\"cart-header2\">\n");
      out.write("                <div class=\"close2\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></div>\n");
      out.write("                                <div class=\"cart-sec simpleCart_shelfItem\">\n");
      out.write("                                    <div class=\"cart-item cyc\">\n");
      out.write("                                         <img src=\"images/grid7.jpg\" class=\"img-responsive\" alt=\"\"/>\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"cart-item-info\">\n");
      out.write("                                        <ul class=\"qty\">\n");
      out.write("                                            <li><p>Size : 8 US</p></li>\n");
      out.write("                                            <li><p>Qty : 2</p></li>\n");
      out.write("                                            <li><p>Price each : $190</p></li>\n");
      out.write("                                        </ul>\n");
      out.write("                                        <div class=\"delivery\">\n");
      out.write("                                            <p>Service Charges : Rs.360.00</p>\n");
      out.write("                                            <span>Delivered in 2-3 bussiness days</span>\n");
      out.write("                                            <div class=\"clearfix\"></div>\n");
      out.write("                                        </div>\t\n");
      out.write("                                   </div>\n");
      out.write("                                   <div class=\"clearfix\"></div>\t\t\t\t\t\n");
      out.write("                                </div>\n");
      out.write("                        </div>\t\t\t\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"clearfix\"> </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<br/><br/>\n");
      out.write("\n");
      out.write("<div class=\"sub-news\">\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <form>\n");
      out.write("            <h3>Pesquise por produtos!</h3>\n");
      out.write("            <input type=\"text\" class=\"sub-email\" name=\"txtFiltro\" placeholder=\"Pesquisar\">\n");
      out.write("\n");
      out.write("            <a class=\"btn btn-default subs-btn\" href=\"#\" role=\"button\">PESQUISAR</a>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"header\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"header-botom\">\n");
      out.write("                <div class=\"content white\">\n");
      out.write("                    <nav class=\"navbar navbar-default nav-menu\" role=\"navigation\">\n");
      out.write("                        <div class=\"navbar-header\">\n");
      out.write("                            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\n");
      out.write("                                <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                            </button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"clearfix\"></div>\n");
      out.write("                        <!--/.navbar-header-->\n");
      out.write("                        <div class=\"collapse navbar-collapse collapse-pdng\" id=\"bs-example-navbar-collapse-1\">\n");
      out.write("                            <ul class=\"nav navbar-nav nav-font\">\n");
      out.write("                                <li class=\"dropdown\">\n");
      out.write("                                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Shop<b class=\"caret\"></b></a>\n");
      out.write("                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                        <li><a href=\"lista.jsp\">Shoes</a></li>\n");
      out.write("                                        <li><a href=\"lista.jsp\">Tees</a></li>\n");
      out.write("                                        <li><a href=\"lista.jsp\">Tops</a></li>\n");
      out.write("                                        <li class=\"divider\"></li>\n");
      out.write("                                        <li><a href=\"lista.jsp\">Tracks</a></li>\n");
      out.write("                                        <li class=\"divider\"></li>\n");
      out.write("                                        <li><a href=\"lista.jsp\">Gear</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"dropdown\">\n");
      out.write("                                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Produtos<b class=\"caret\"></b></a>\n");
      out.write("                                    <ul class=\"dropdown-menu \">\n");
      out.write("\n");
      out.write("                                        <ul class=\"multi-column-dropdown\">\n");
      out.write("                                            <li><a href=\"lista.jsp\">Clique aqui kkkj</a></li>\n");
      out.write("                                        </ul>\n");
      out.write("\n");
      out.write("                                    </ul>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"dropdown\">\n");
      out.write("                                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Categoria<b class=\"caret\"></b></a>\n");
      out.write("                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                        ");

                                            for (Categoria cat : cLista) {
                                        
      out.write("\n");
      out.write("                                        <li><a href=\"lista.jsp?filtroC=");
      out.print(cat.getCodigo());
      out.write('"');
      out.write('>');
      out.print(cat.getNome());
      out.write("</a></li>\n");
      out.write("                                            ");
 }
      out.write("                                           \n");
      out.write("                                    </ul>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"dropdown\">\n");
      out.write("                                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Marca<b class=\"caret\"></b></a>\n");
      out.write("                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                        ");

                                            for (Marca mar : cMarca) {
                                        
      out.write("\n");
      out.write("                                        <li><a href=\"lista.jsp?filtroM=");
      out.print(mar.getCodigo());
      out.write('"');
      out.write('>');
      out.print(mar.getNome());
      out.write("</a></li>\n");
      out.write("                                            ");
 }
      out.write("                                           \n");
      out.write("                                    </ul>\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                            <br/><br/>\n");
      out.write("                            Copyright @LucasEnterprisesKKKJ 2016\n");
      out.write("                        </div>\n");
      out.write("                    </nav>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
      out.write('\n');
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
