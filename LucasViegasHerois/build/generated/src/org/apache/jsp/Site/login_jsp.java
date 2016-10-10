package org.apache.jsp.Site;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import modelo.Heroi;
import dao.HeroiDAO;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    HeroiDAO dao = new HeroiDAO();
    List<Heroi> lista;
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }

      out.write("\r\n");
      out.write("\r\n");

    if (request.getParameter("txtLogin") != null && request.getParameter("txtSenha") != null) {
        String loginCerto = "Admin";
        String senhaCerta = "123";

        if (request.getParameter("txtLogin").equals(loginCerto) && request.getParameter("txtSenha").equals(senhaCerta)) {
            session.setAttribute("usuario", request.getParameter("txtLogin"));
            response.sendRedirect("index.jsp");
        }
    }

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <title>Login</title>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div id=\"loginbar\">\r\n");
      out.write("            ");
if (session.getAttribute("usuario") != null) {
      out.write("\r\n");
      out.write("            Bem vindo, <span>");
      out.print(session.getAttribute("usuario"));
      out.write("</span> - <a href=\"logoff.jsp\">Logoff</a>\r\n");
      out.write("            ");
  } else {  
      out.write("\r\n");
      out.write("            Bem vindo, faça login para ter acesso ao seu baralho.\r\n");
      out.write("            ");
  }  
      out.write("                                                         \r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div id=\"body\">\r\n");
      out.write("            <div id=\"background\" class=\"background6\">\r\n");
      out.write("                <div>\r\n");
      out.write("                    <div>\r\n");
      out.write("                        <form method=\"post\">\r\n");
      out.write("                            <div    id=\"login22\">\r\n");
      out.write("                                <label><h2>Login:</h2></label>\r\n");
      out.write("                                <input type=\"text\" name=\"txtLogin\" size=\"32\" placeholder=\"Digite o login\" required id=\"login21\"/><br />     \r\n");
      out.write("                                <label><h2>Senha:<h2/></label>   \r\n");
      out.write("                                <input type=\"text\" name=\"txtSenha\" size=\"32\" placeholder=\"Digite a senha\" required/><br /> \r\n");
      out.write("                                <input type=\"submit\" value=\"Entrar\"/><br />\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </form>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("            \r\n");
      out.write("        </div>\r\n");
      out.write("        <a href=\"index.jsp\"><div class=\"box\">HOME PAGE</div></a>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>");
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
