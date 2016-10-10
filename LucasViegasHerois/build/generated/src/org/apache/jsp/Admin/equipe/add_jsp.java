package org.apache.jsp.Admin.equipe;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Heroi;
import java.util.List;
import dao.HeroiDAO;

public final class add_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Admin/equipe/../cabecalho.jsp");
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

  if(session.getAttribute("usuario") == null){
      response.sendRedirect("../login.jsp");
      return;
  }  

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<link rel=\"stylesheet\" href=\"../style.css\" />\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title> Sistema Heróis</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"../estilo.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <h1> <font color = \"green\"> SUPER HERÓIS!</h1>\n");
      out.write("        <div style=\"text-align: center\"> Bem vindo <span> ");
      out.print(session.getAttribute("usuario"));
      out.write(" </span>\n");
      out.write("            <br/><a href =\"../../Site\">SAIR</a>\n");
      out.write("        </div>\n");
      out.write("        <p>\n");
      out.write("            <a href=\"../categoria\"> Categoria</a> - \n");
      out.write("            <a href=\"../equipe\"> Equipe</a> - \n");
      out.write("            <a href=\"../regiao\"> Região</a> -  \n");
      out.write("            <a href=\"../jogador\"> Jogador</a> -  \n");
      out.write("            <a href=\"../editora\"> Editora</a> -  \n");
      out.write("            <a href=\"../heroi\"> Herói</a>\n");
      out.write("            <a href=\"../../Site/index.jsp\"> HOME</a>\n");
      out.write("        </p>");
      out.write("\n");
      out.write("<div>\n");
      out.write("    <h1 class=\"centro\">Cadastro de Equipe</h1>\n");
      out.write("\n");
      out.write("    <div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <label>Nome:</label><input type=\"text\" name=\"txtNome\" placeholder=\"Insira o Nome de Login\" required/><br />\n");
      out.write("        <!--<label>Descricao:</label><input type=\"text\" name=\"Desc\" placeholder=\"Insira a Descrição\" required/><br />-->\n");
      out.write("        <label>Heróis</label><br/>\n");
      out.write("        ");
                
            HeroiDAO dao = new HeroiDAO();
            List<Heroi> lista = dao.listar();
            for (Heroi hero : lista) {
        
      out.write("\n");
      out.write("\n");
      out.write("        <input type=\"checkbox\" name=\"heroi\" value=\"");
      out.print(hero.getCodigo());
      out.write("\"/> ");
      out.print(hero.getCodinome());
      out.write(" <br/>\n");
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <input type=\"reset\" value=\"Limpar\" />\n");
      out.write("        <input type=\"submit\" value=\"Salvar\" />\n");
      out.write("        <br/><br/>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
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
