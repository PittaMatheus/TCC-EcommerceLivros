package org.apache.jsp.Livros;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria;
import java.util.List;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;

public final class listar_005fcategorias_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Categorias</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Categorias dos livros</h1>\n");
      out.write("          ");
 List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias"); 
      out.write("\n");
      out.write("          \n");
      out.write("          ");
for(EntidadeDominio edCat:categorias){
                     Categoria categoria = (Categoria)edCat; 
      out.write("\n");
      out.write("                     <input type=\"checkbox\" name=\"categoria\" id =\"categoria");
      out.print(categoria.getNome());
      out.write("\"value=\"");
      out.print(categoria.getId());
      out.write('"');
      out.write('>');
      out.print(categoria.getNome());
      out.write("<br>\n");
      out.write("                 ");
}
      out.write("\n");
      out.write("\n");
      out.write("          \n");
      out.write("          \n");
      out.write("          \n");
      out.write("    </body>\n");
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
