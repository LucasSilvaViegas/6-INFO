package org.apache.jsp.Site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Heroi;
import modelo.Equipe;
import dao.EquipeDAO;
import java.util.List;

public final class equipa_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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

    //Instanciar DAO
    EquipeDAO dao = new EquipeDAO();
    //verificar se veio algo no filtro
    //se vier passamos o filtro para DAO
    //se não tiver filtro traz todos registros
    List<Equipe> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        //Chama o método que retorna 
        //todos os registros do Banco de Dados
        lista = dao.listar();
    }

      out.write("  \n");
      out.write("<html>\n");
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
      out.write("\n");
      out.write("    <div class=\"wrapper style1\">\n");
      out.write("\n");
      out.write("        <!-- Header -->\n");
      out.write("        <div id=\"header\" class=\"skel-panels-fixed\">\n");
      out.write("            <div id=\"logo\">\n");
      out.write("                <h1><a href=\"index.jsp\">Super Herois</a></h1>\n");
      out.write("                <span class=\"tag\">by LUCAS VIEGAS</span>\n");
      out.write("            </div>\n");
      out.write("            <nav id=\"nav\">\n");
      out.write("                <ul>\n");
      out.write("                    <li class=\"active\"><a href=\"index.jsp\">Homepage</a></li>\n");
      out.write("                    <li><a href=\"../Admin/login.jsp\">Cadastro</a></li>\n");
      out.write("                    <li><a href=\"equipa.jsp\">Equipes</a></li>\n");
      out.write("                        ");
if (session.getAttribute("usuario") != null) {
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                        <a class=\"login\" href=\"verbaralho.jsp\">JOGAR!</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li><a href=\"jogador.jsp\">Jogadores</a></li>\n");
      out.write("                        ");
  } else {  
      out.write("\n");
      out.write("                    <li>\n");
      out.write("                        <a class=\"login\" href=\"login.jsp\">Login</a>\n");
      out.write("                    </li>\n");
      out.write("                    ");
  }  
      out.write("                \n");
      out.write("\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Banner -->\n");
      out.write("        <div id=\"banner\" class=\"container\"><section><p><strong> Aqui está as equipes </strong></p></section></div>\n");
      out.write("\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <input type=\"text\" name=\"txtFiltro\" placeholder=\"digite o texto da pesquisa\" />\n");
      out.write("            <input type=\"submit\" value=\"Pesquisar\"/><br />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            for (Equipe item : lista) {
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <br/><br/><br/><br/><br/>\n");
      out.write("        <div class=\"box\">\n");
      out.write("            <h2>");
      out.print(item.getNome());
      out.write("</h2>   \n");
      out.write("            <p>");
      out.print(item.getDescricao());
      out.write("</p>\n");
      out.write("        </div>\n");
      out.write("        <br/><br/><br/><br/><br/>\n");
      out.write("\n");
      out.write("        <div id=\"extra\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row no-collapse-1\">\n");
      out.write("\n");
      out.write("                    ");

                        for (Heroi hero : item.getHeroiList()) {
                    
      out.write("\n");
      out.write("\n");
      out.write("                    <section class=\"4u\"> <a href=\"#\" class=\"image featured\"><img src=\"../fotos/");
      out.print(hero.getFoto());
      out.write("\" alt=\"\" width=\"50\" height=\"250\"></a>\n");
      out.write("                        <div class=\"box\">\n");
      out.write("                            <h2> ");
      out.print(hero.getCodinome());
      out.write("</h2><br/>\n");
      out.write("                            <p> Nome: <strong> ");
      out.print(hero.getNome());
      out.write(" </strong><br/>\n");
      out.write("                                Descrição: <strong> ");
      out.print(hero.getDescricao());
      out.write(" </strong><br/>\n");
      out.write("                                Inteligência: <strong> ");
      out.print(hero.getInteligencia());
      out.write(" </strong><br/>\n");
      out.write("                                Velocidade: <strong> ");
      out.print(hero.getVelocidade());
      out.write(" </strong><br/>\n");
      out.write("                                Resistência: <strong> ");
      out.print(hero.getResistencia());
      out.write(" </strong><br/>\n");
      out.write("                                Força: <strong> ");
      out.print(hero.getForca());
      out.write(" </strong><br/>\n");
      out.write("                                Projeção de Energia: <strong> ");
      out.print(hero.getProjecaoenergia());
      out.write(" </strong><br/>\n");
      out.write("                                Habilidade em Combate: <strong> ");
      out.print(hero.getHabilidadecombate());
      out.write(" </strong><br/>\n");
      out.write("                                Categoria: <strong> ");
      out.print(hero.getCategoria().getNome());
      out.write(" </strong><br/>\n");
      out.write("                                Editora:<strong> ");
      out.print(hero.getEditora().getNome());
      out.write("</strong><br/>\n");
      out.write("                                Região: <strong> ");
      out.print(hero.getRegiao().getNome());
      out.write(" </strong><br/>\n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                        <br/>\n");
      out.write("                        <br/>\n");
      out.write("                    </section>\n");
      out.write("                    ");
}
      out.write("\n");
      out.write("                </div></div></div> ");
}
      out.write("</div></body></html>");
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
