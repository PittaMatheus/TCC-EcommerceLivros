package br.com.fatecmogidascruzes.filtro;


import br.com.fatecmogidascruzes.dominio.Cliente;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author matheus
 */
public class FiltroAutorizacao implements Filter {
@Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        
        if(httpRequest.getRequestURL().toString().endsWith("/AutenticarUsuario")) {
            chain.doFilter(request, response);
        }
        
        Cliente cliente = (Cliente) httpRequest.getSession().getAttribute("usuarioLogado");
        if (null != cliente && cliente.getPapel().equals("ADMIN")) {
            chain.doFilter(request, response);
        } else {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public void init(FilterConfig filterConfig) {
    }
    
}
