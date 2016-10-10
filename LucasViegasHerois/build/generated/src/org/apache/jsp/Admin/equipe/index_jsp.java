package org.apache.jsp.Admin.equipe;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import modelo.Heroi;
import modelo.Equipe;
import dao.EquipeDAO;
import java.util.List;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<link rel=\"stylesheet\" href=\"../style.css\" />\n");
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
      out.write("\n");
      out.write("\n");
      out.write("<div>\n");
      out.write("\n");
      out.write("    <h1>Equipe</h1>\n");
      out.write("    <a href=\"add.jsp\">Novo</a><br/>\n");
      out.write("    <form method=\"post\">\n");
      out.write("        <input type=\"text\" name=\"txtFiltro\" placeholder=\"digite o texto da pesquisa\" />\n");
      out.write("        <input type=\"submit\" value=\"Pesquisar\"/><br />\n");
      out.write("    </form>\n");
      out.write("    <table>\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <th>Código</th>\n");
      out.write("            <th>Nome</th>\n");
      out.write("            <th>Heróis</th>\n");
      out.write("            <th>Ações</th>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        ");
for (Equipe item : lista) {
        
      out.write("\n");
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print(item.getCodigo());
      out.write("</td>\n");
      out.write("            <td>");
      out.print(item.getNome());
      out.write("</td>\n");
      out.write("            <td>");


                String strHerois = "";
                for (Heroi hitem : item.getHeroiList()) {
                    hitem.getNome();
                    
                    
                 //   strHerois += item.getNome() + ",";
                }
                       
               // out.print(strHerois.substring(0, (strHerois.length() - 1)));  
                
            
            
      out.write("</td>\n");
      out.write("\n");
      out.write("            <td><a href=\"upd.jsp?codigo=");
      out.print(item.getCodigo());
      out.write("\">Editar</a>\n");
      out.write("                <a href=\"del-ok.jsp?codigo=");
      out.print(item.getCodigo());
      out.write("\">Excluir</a>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("\n");
      out.write("        ");
}
      out.write("\n");
      out.write("\n");
      out.write("    </table>\n");
      out.write("    <br/><br/>    <br/><br/>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
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
