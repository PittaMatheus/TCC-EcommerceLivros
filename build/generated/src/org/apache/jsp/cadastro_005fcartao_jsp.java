package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cadastro_005fcartao_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Adicionar cartão</h1>\n");
      out.write("        \n");
      out.write("        <form action=\"InserirCartao\" name=\"acao\" value=\"inserir\" method=\"POST\">\n");
      out.write("            <label for=\"bandeira\" data-error=\"Informe a Bandeira\"  >Bandeira do cartão: </label>\n");
      out.write("            <select id=\"bandeira\" name=\"bandeira\"class=\"validate\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['bandeira']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                <option value=\"\" disabled>Bandeira</option>\n");
      out.write("                <option value=\"vila\" selected >MasterCard</option>\n");
      out.write("                <option value=\"estrada\">Visa</option>\n");
      out.write("                <option value=\"fazenda\">Elo</option>\n");
      out.write("                \n");
      out.write("            </select>\n");
      out.write("                <br>\n");
      out.write("            <label for=\"id\" >ID do cliente</label>                            \n");
      out.write("            <input type=\"text\" value=\"3\" name=\"id\" id=\"id\" required>    \n");
      out.write("                \n");
      out.write("            <label for=\"numeroCartao\" >Numero do cartão</label>                            \n");
      out.write("            <input type=\"text\" value=\"2321321\" name=\"numeroCartao\" id=\"numeroCartao\" required>\n");
      out.write("\n");
      out.write("            <label for=\"nomeCartao\" data-error=\"Informe o nome do cartão!\" >Nome do cartão:</label>\n");
      out.write("            <input type=\"text\" value=\"JOAO DA SILVA\" name=\"nomeCartao\" id=\"nomeCartao\"required>\n");
      out.write("            \n");
      out.write("            <label for=\"dtValidade\" data-error=\"Informe a data de validade!\" >Data de validade:</label>\n");
      out.write("            <input type=\"text\" value=\"2019-09-09\" name=\"dtValidade\" id=\"dtValidade\"required>\n");
      out.write("            \n");
      out.write("             <label for=\"codSeguranca\" data-error=\"Informe o código de segurança!\" >Codigo de segurança</label>\n");
      out.write("            <input type=\"text\" value=\"033\" name=\"codSeguranca\" id=\"dtValidade\"required>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            <input type=\"submit\" name=\"acao\" value=\"inserir\" class=\"btn btn-success\">                       \n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("        <div><a href=\"index.html\">Voltar</a></div>  \n");
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
