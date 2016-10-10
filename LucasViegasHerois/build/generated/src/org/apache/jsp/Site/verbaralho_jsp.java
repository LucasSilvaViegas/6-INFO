package org.apache.jsp.Site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import dao.EditoraDAO;
import modelo.Editora;
import java.util.List;
import dao.HeroiDAO;
import modelo.Heroi;

public final class verbaralho_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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
      out.write("<!DOCTYPE HTML>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <title>Heróis da Galáxia!</title>\n");
      out.write("        <meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"description\" content=\"\" />\n");
      out.write("        <meta name=\"keywords\" content=\"\" />\n");
      out.write("        <!--[if lte IE 8]><script src=\"css/ie/html5shiv.js\"></script><![endif]-->\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.dropotron.min.js\"></script>\n");
      out.write("        <script src=\"js/skel.min.js\"></script>\n");
      out.write("        <script src=\"js/skel-layers.min.js\"></script>\n");
      out.write("        <script src=\"js/init.js\"></script>\n");
      out.write("        <noscript>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/skel.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style-wide.css\" />\n");
      out.write("        </noscript>\n");
      out.write("        <!--[if lte IE 8]><link rel=\"stylesheet\" href=\"css/ie/v8.css\" /><![endif]-->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- Wrapper -->\n");
      out.write("        <div class=\"wrapper style1\">\n");
      out.write("\n");
      out.write("            <!-- Header -->\n");
      out.write("            <div id=\"header\" class=\"skel-panels-fixed\">\n");
      out.write("                <div id=\"logo\">\n");
      out.write("                    <h1><a href=\"index.jsp\">Super Herois</a></h1>\n");
      out.write("                    <span class=\"tag\">by LUCAS VIEGAS</span>\n");
      out.write("                </div>\n");
      out.write("                <nav id=\"nav\">\n");
      out.write("                    <ul>\n");
      out.write("\n");
      out.write("                        <li class=\"active\"><a href=\"index.jsp\">Homepage</a></li>\n");
      out.write("                        <li><a href=\"../Admin/login.jsp\">Cadastro</a></li>\n");
      out.write("                        <li><a href=\"verbaralho.jsp\">Jogar</a></li>\n");
      out.write("                        <li><a href=\"jogador.jsp\">Jogadores</a></li>  \n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Banner -->\n");
      out.write("            <div id=\"banner\" class=\"container\">\n");
      out.write("                <section>\n");
      out.write("                    <p>Bem-vindo ao <strong>Super Heroes</strong>, veja seus heróis favoritos aqui. \n");
      out.write("                </section>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"container2\">\n");
      out.write("\n");
      out.write("                ");

                    HeroiDAO dao = new HeroiDAO();
                    List<Heroi> lista;
                    lista = dao.kk();
                   
                    for (Heroi hero : lista) {
                
      out.write("\n");
      out.write("\n");
      out.write("                <a href=\"#\" class=\"image featured\"><img src=\"../fotos/");
      out.print(hero.getFoto());
      out.write("\" alt=\"\" width=\"50\" height=\"250\"></a>\n");
      out.write("                    <div class=\"box\">\n");
      out.write("                        <h2> ");
      out.print(hero.getCodinome());
      out.write("</h2><br/>\n");
      out.write("                        <p> Nome: <strong> ");
      out.print(hero.getNome());
      out.write(" </strong><br/>\n");
      out.write("                            Descrição: <strong> ");
      out.print(hero.getDescricao());
      out.write(" </strong><br/>\n");
      out.write("                            Inteligência: <strong> ");
      out.print(hero.getInteligencia());
      out.write(" </strong><br/>\n");
      out.write("                            Velocidade: <strong> ");
      out.print(hero.getVelocidade());
      out.write(" </strong><br/>\n");
      out.write("                            Resistência: <strong> ");
      out.print(hero.getResistencia());
      out.write(" </strong><br/>\n");
      out.write("                            Força: <strong> ");
      out.print(hero.getForca());
      out.write(" </strong><br/>\n");
      out.write("                            Projeção de Energia: <strong> ");
      out.print(hero.getProjecaoenergia());
      out.write(" </strong><br/>\n");
      out.write("                            Habilidade em Combate: <strong> ");
      out.print(hero.getHabilidadecombate());
      out.write(" </strong><br/>\n");
      out.write("                            Categoria: <strong> ");
      out.print(hero.getCategoria().getNome());
      out.write(" </strong><br/>\n");
      out.write("                            Editora:<strong> ");
      out.print(hero.getEditora().getNome());
      out.write("</strong><br/>\n");
      out.write("                            Região: <strong> ");
      out.print(hero.getRegiao().getNome());
      out.write(" </strong><br/>\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                    <br/> <br/>\n");
      out.write("               \n");
      out.write("\n");
      out.write("                ");
}
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div></div></body></html>\n");
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
