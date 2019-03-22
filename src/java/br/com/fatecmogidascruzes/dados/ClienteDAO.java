package br.com.fatecmogidascruzes.dados;

import br.com.fatecmogidascruzes.dominio.Cliente;
import br.com.fatecmogidascruzes.dominio.Endereco;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import br.com.fatecmogidascruzes.excecao.ExcecaoAcessoDados;
import br.com.fatecmogidascruzes.excecao.ExcecaoLimiteTentativas;
import br.com.fatecmogidascruzes.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static java.sql.Statement.RETURN_GENERATED_KEYS;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO extends AbstractDAO {

   @Override
    public Resultado inserir(EntidadeDominio entidade){
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO cliente "
                    + "(nome,sobrenome, data_nascimento, ranking, senha, email, cpf,rg, sexo, logradouroCobranca, "
                    + "bairroCobranca, cepCobranca, numeroCobranca, cidadeCobranca, ufCobranca, paisCobranca, tipoLogradouroCobranca, "
                    + "complementoCobranca)"
                                    + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

                    declaracao.setString(1, cliente.getNome());
                    declaracao.setString(2, cliente.getSobrenome());
                    declaracao.setString(3, cliente.getData_nascimento());
                    declaracao.setDouble(4, 50);           // inicia com 50 pontos                    
                    declaracao.setString(5, cliente.getSenha());
                    declaracao.setString(6, cliente.getEmail());                    
                    declaracao.setString(7, cliente.getCpf());
                    declaracao.setString(8, cliente.getRg());
                    declaracao.setString(9, cliente.getSexo());
                    declaracao.setString(10, cliente.getEndereco().getLogradouro());
                    declaracao.setString(11, cliente.getEndereco().getBairro());
                    declaracao.setString(12, cliente.getEndereco().getCep());
                    declaracao.setString(13, cliente.getEndereco().getNumero());
                    declaracao.setString(14, cliente.getEndereco().getCidade());
                    declaracao.setString(15, cliente.getEndereco().getUf());
                    declaracao.setString(16, cliente.getEndereco().getPais());
                    declaracao.setString(17, cliente.getEndereco().getTipoLogradouro());
                    declaracao.setString(18, cliente.getEndereco().getComplemento());
               
            declaracao.execute();
            System.out.print("EXECUTEI A QUERY CLIENTE");
            ResultSet rs = declaracao.getGeneratedKeys();
            // Seta o ID cliente com o ID autoincrement que foi gerado no banco de dados
            cliente.setId((rs.next())?rs.getInt(1):0);                
            resultado.setStatus(true);
            resultado.setMensagem("O Cliente foi inserido com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao inserir o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    
    
    
    @Override
    public Resultado autenticar(EntidadeDominio entidade) {
       List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("select id, email, senha, from cliente where cliente=?");
            declaracao.setString(1, cliente.getEmail());
            ResultSet rs = declaracao.executeQuery();
            if (rs.next()) {
                if(cliente.getSenha().equals(rs.getString("senha"))) {
                    cliente = new Cliente();
                    cliente.setId(rs.getInt("id"));
                    cliente.setEmail(rs.getString("email"));
                    cliente.setSenha(rs.getString("senha"));
                }
            }
                   conexao.close();
                resultado.setStatus(true);
            } catch (ClassNotFoundException erro) {
                erro.printStackTrace();     
                resultado.setStatus(false);
                resultado.setMensagem("Houve algum erro ao autenticar o cliente");
            } catch (SQLException erro) {
                erro.printStackTrace();   
            }
          return resultado;
        
    }
}
    
