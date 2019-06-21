package livraria.web.controle;

import livraria.web.commands.ICommand;
import livraria.web.commands.CommandListar;
import livraria.web.commands.CommandInserir;
import livraria.web.commands.CommandAlterar;
import livraria.web.commands.CommandDesativar;
import livraria.web.commands.CommandAtivar;
import livraria.web.commands.CommandAutenticar;
import livraria.web.commands.CommandConsultar;
import livraria.web.commands.CommandLogout;
import livraria.core.dao.cliente.ClienteDAO;
import ecommerce.dominio.livro.Categoria;
import livraria.web.view.IViewHelper;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.GrupoLivro;
import livraria.core.aplicacao.Resultado;
import ecommerce.dominio.cliente.Telefone;
import ecommerce.dominio.Usuario;
import ecommerce.dominio.analise.AnaliseCustoReceitaLucroMes;
import ecommerce.dominio.cliente.Bandeira;
import ecommerce.dominio.estoque.Estoque;
import ecommerce.dominio.estoque.Fornecedor;
import ecommerce.dominio.livro.Livro;
import livraria.core.util.ExcecaoAcessoDados;
import livraria.core.util.ExcecaoLimiteTentativas;
import livraria.web.view.cliente.ViewCartao;
import livraria.web.view.livro.ViewCategoria;
import livraria.web.view.cliente.ViewCliente;
import livraria.web.view.cliente.ViewEndereco;
import livraria.web.view.livro.ViewGrupoLivro;
import livraria.web.view.livro.ViewLivro;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import livraria.web.commands.CommandAplicarDesconto;
import livraria.web.view.analise.AnalisarCategoriaMaisVendidaViewHelper;
import livraria.web.view.analise.ViewAnaliseVendas;
import livraria.web.view.cliente.ViewClienteSenha;
import livraria.web.view.estoque.ViewEstoque;
import livraria.web.view.pedido.ViewCarrinho;
import livraria.web.view.pedido.ViewCarrinhoSessao;
import livraria.web.view.pedido.ViewClienteCompra;
import livraria.web.view.pedido.ViewCupomDesconto;
import livraria.web.view.pedido.ViewCupomTroca;
import livraria.web.view.pedido.ViewItensPedido;
import livraria.web.view.pedido.ViewPagamentoPedido;
import livraria.web.view.pedido.ViewPedido;
import livraria.web.view.pedido.ViewTroca;


public class Control extends HttpServlet {
    
    private static Map<String, IViewHelper> viewHelper;
    private static Map<String, ICommand> commands;
    
    // Construtor que inicializará os caminhos de URL
    public Control(){
        
        
        //Mapa dos commands
        commands = new HashMap<String, ICommand>();
        commands.put("inserir", new CommandInserir());
        commands.put("listar", new CommandListar());
        commands.put("consultarPorID", new CommandConsultar());
        commands.put("alterar", new CommandAlterar());
        commands.put("desativar", new CommandDesativar());
        commands.put("ativar", new CommandAtivar());
        commands.put("login", new CommandAutenticar());
        commands.put("logout", new CommandLogout());
        commands.put("aplicarDesconto", new CommandAplicarDesconto());
        

        
        
        // MAPA DAS VIEWS DO SISTEMA
        // Views Cliente
         viewHelper = new HashMap<String,IViewHelper>();
         viewHelper.put("/Ecommerce/Clientes/InserirCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/ListarClientes", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/PreAlterarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/AlterarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/DesativarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/AtivarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/AutenticarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/AutenticarClienteCompra", new ViewClienteCompra());
         viewHelper.put("/Ecommerce/Clientes/PreAlterarSenhaCliente", new ViewClienteSenha());
         viewHelper.put("/Ecommerce/Clientes/AlterarSenhaCliente", new ViewClienteSenha());
         
         viewHelper.put("/Ecommerce/LogoutCliente", new ViewCliente());
         // Views Endereco
         viewHelper.put("/Ecommerce/Clientes/InserirEndereco", new ViewEndereco());
         viewHelper.put("/Ecommerce/Clientes/ListarEndereco", new ViewEndereco());
         viewHelper.put("/Ecommerce/Clientes/AlterarEndereco", new ViewEndereco());   
         // Views Cartao
         viewHelper.put("/Ecommerce/Clientes/InserirCartao", new ViewCartao());
         viewHelper.put("/Ecommerce/Clientes/ListarCartao", new ViewCartao());
         viewHelper.put("/Ecommerce/Clientes/ExcluirCartao", new ViewCartao());
         // livro
        viewHelper.put("/Ecommerce/Livros/InserirLivro", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/ListarLivros", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/PreAlterarLivro", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/AlterarLivro", new ViewLivro());            
        viewHelper.put("/Ecommerce/Livros/DesativarLivro", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/AtivarLivro", new ViewLivro());
        // Categoria
        viewHelper.put("/Ecommerce/Livros/InserirCategoria", new ViewCategoria());
        viewHelper.put("/Ecommerce/Livros/AlterarCategoria", new ViewCategoria());
        viewHelper.put("/Ecommerce/Livros/ListarCategorias", new ViewCategoria());
        viewHelper.put("/Ecommerce/Livros/PreAlterarCategoria", new ViewCategoria());
        // ViewGrupo
        viewHelper.put("/Ecommerce/Livros/InserirGrupoLivro", new ViewGrupoLivro());
        viewHelper.put("/Ecommerce/Livros/ListarGrupoLivros", new ViewGrupoLivro());
        viewHelper.put("/Ecommerce/Livros/AlterarGrupoLivro", new ViewGrupoLivro());
        viewHelper.put("/Ecommerce/Livros/PreAlterarGrupoLivro", new ViewGrupoLivro());
        
        // ViewCarrinho
        viewHelper.put("/Ecommerce/Pedidos/AdicionarCarrinhoSessao", new ViewCarrinhoSessao());
        viewHelper.put("/Ecommerce/Pedidos/AumentaUmItem", new ViewCarrinhoSessao());
        viewHelper.put("/Ecommerce/Pedidos/RetiraUmItem", new ViewCarrinhoSessao());
        viewHelper.put("/Ecommerce/Pedidos/RemoverLivroCarrinho", new ViewCarrinhoSessao());
        viewHelper.put("/Ecommerce/Pedidos/AddItem", new ViewCarrinho());
        viewHelper.put("/Ecommerce/Pedidos/RemItem", new ViewCarrinho());
        

        viewHelper.put("/Ecommerce/Pedidos/AdicionarCarrinho", new ViewCarrinho());
        viewHelper.put("/Ecommerce/Pedidos/VerCarrinho", new ViewCarrinho());
        viewHelper.put("/Ecommerce/Pedidos/RemoverCarrinho", new ViewCarrinho());
        viewHelper.put("/Ecommerce/Clientes/AdicionarPedido", new ViewPedido());
        
        
        
        viewHelper.put("/Ecommerce/adm/ListarPagamentoPedido", new ViewPagamentoPedido());                
        viewHelper.put("/Ecommerce/adm/ListarItemPedido", new ViewItensPedido());
        viewHelper.put("/Ecommerce/Clientes/AuxilioPedido", new ViewPedido());
        viewHelper.put("/Ecommerce/Pedidos/AdicionarPedido", new ViewPedido());
        viewHelper.put("/Ecommerce/adm/ListarPedidos", new ViewPedido());
        viewHelper.put("/Ecommerce/adm/GerenciarPedido", new ViewPedido());
        viewHelper.put("/Ecommerce/Clientes/ListarMeusPedidos", new ViewPedido());
        viewHelper.put("/Ecommerce/Clientes/SolicitarTroca", new ViewTroca());
        viewHelper.put("/Ecommerce/adm/ListarSolicitacaoTrocas", new ViewTroca());
        viewHelper.put("/Ecommerce/adm/AutorizarTroca", new ViewCupomTroca());
        viewHelper.put("/Ecommerce/Clientes/ConsultarCupomTroca", new ViewCupomTroca());
        viewHelper.put("/Ecommerce/Clientes/AplicarDesconto", new ViewCupomDesconto());
        viewHelper.put("/Ecommerce/Clientes/RetirarDesconto", new ViewCupomDesconto());
        viewHelper.put("/Ecommerce/adm/ListarTrocas", new ViewTroca());

        
        
        
        
        // Estoque
        viewHelper.put("/Ecommerce/Estoque/InserirEstoque", new ViewEstoque());
        viewHelper.put("/Ecommerce/Estoque/ListarEstoqueLivros", new ViewEstoque());
        viewHelper.put("/Ecommerce/Estoque/PreAlterarEstoque", new ViewEstoque());
        viewHelper.put("/Ecommerce/Estoque/AlterarEstoque", new ViewEstoque());
        
        // Analises
        viewHelper.put("/Ecommerce/adm/AnaliseVendas", new ViewAnaliseVendas());
        viewHelper.put("/Ecommerce/adm/Analisar", new AnalisarCategoriaMaisVendidaViewHelper());
        
        

    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtem a uri que invocou esta servlet(O que foi definido no action do form
        // html)
        String uri = request.getRequestURI();
        // Obtem a operação que será executada
        String acao = request.getParameter("acao");
        // Obtem um viewhelper indexado pela uri que invocou esta servlet
        IViewHelper vh = viewHelper.get(uri); 
       // O View Helper retorna a entidade especifica para a tela que chamou esta
        // servlet
        EntidadeDominio entidade = null;
        if(vh != null)
            entidade = vh.getEntidade(request);
        // Obtem o command para executar a respectiva operação
        
        
        ICommand command = commands.get(acao);
       
        /*
         * Executa o commando que chamará a fachada para executar a operação requisitada
         * o retorno é uma instância da classe resultado que pode conter mensagens de
         * erro ou entidades de retorno
         */
        
        Resultado resultado = null;
        if(entidade != null && command != null) // evita erro quando as operações não irão para a fachada
            resultado = command.executar(entidade);        

       
        
        /*
         * Executa o método setView do view helper específico para definir como deverá
         * ser apresentado o resultado para o usuário
         * 
         */
        viewHelper.get(uri).setEntidade(resultado, request, response);
        init();
    }
    
   @Override
    public void init() throws ServletException {
        super.init();
        
        //consultar estados e cidades e botar no contexto da aplicação (similar à session) salvar o map de Estados e cidades
		 
        ICommand commandListar = new CommandListar();

        Resultado resultado = commandListar.executar(new Categoria());
        List<EntidadeDominio> categorias = resultado.getEntidades();
        getServletContext().setAttribute("categorias", categorias);
        
        resultado = commandListar.executar(new GrupoLivro());
        List<EntidadeDominio> grupoLivros = resultado.getEntidades();
        getServletContext().setAttribute("grupoLivros", grupoLivros);
        
        resultado = commandListar.executar(new Livro());
        List<EntidadeDominio> livros = resultado.getEntidades();
        getServletContext().setAttribute("livros", livros);
        
        resultado = commandListar.executar(new Estoque());
        List<EntidadeDominio> estoque = resultado.getEntidades();
        getServletContext().setAttribute("estoque", estoque);
        
        resultado = commandListar.executar(new Fornecedor());
        List<EntidadeDominio> fornecedor = resultado.getEntidades();
        getServletContext().setAttribute("fornecedor", fornecedor);
        
        resultado = commandListar.executar(new AnaliseCustoReceitaLucroMes());
        List<EntidadeDominio> analise = resultado.getEntidades();
        getServletContext().setAttribute("analise", analise);
        
        resultado = commandListar.executar(new Bandeira());
        List<EntidadeDominio> bandeira = resultado.getEntidades();
        getServletContext().setAttribute("bandeira", bandeira);
        
        
    }

}