package br.com.fatecmogidascruzes.controle;

import br.com.fatecmogidascruzes.dados.ClienteDAO;
import br.com.fatecmogidascruzes.servico.IViewHelper;
import br.com.fatecmogidascruzes.dominio.Cliente;
import br.com.fatecmogidascruzes.dominio.Endereco;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import br.com.fatecmogidascruzes.dominio.Telefone;
import br.com.fatecmogidascruzes.excecao.ExcecaoAcessoDados;
import br.com.fatecmogidascruzes.excecao.ExcecaoLimiteTentativas;
import br.com.fatecmogidascruzes.servico.ViewCartao;
import br.com.fatecmogidascruzes.servico.ViewCliente;
import br.com.fatecmogidascruzes.servico.ViewEndereco;
import br.com.fatecmogidascruzes.servico.ViewLogin;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Control extends HttpServlet {
    
    private static Map<String, IViewHelper> viewHelper;
    private static Map<String, ICommand> commands;
    
    // Construtor que inicializará os caminhos de URL
    public Control(){
        super();
        //Mapa dos commands
        commands = new HashMap<String, ICommand>();
        commands.put("inserir", new CommandInserir());
        commands.put("listar", new CommandListar());

        
        // Mapa das views
         viewHelper = new HashMap<String,IViewHelper>();
         viewHelper.put("/Ecommerce/InserirCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/ListarClientes", new ViewCliente());
         
         viewHelper.put("/Ecommerce/InserirEndereco", new ViewEndereco());
         viewHelper.put("/Ecommerce/InserirCartao", new ViewCartao());
         


    }
    
    
    
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String acao = request.getParameter("acao");

        EntidadeDominio entidade = viewHelper.get(uri).getEntidade(request);
        Resultado resultado = commands.get(acao).executar(entidade);
        System.out.println("URL: " + uri + "  ACAO: " + acao);
        viewHelper.get(uri).setEntidade(resultado, request, response);
        
    	}
    
    
    

}