/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.dados;

import br.com.fatecmogidascruzes.dominio.Endereco;
import br.com.fatecmogidascruzes.dominio.Endereco;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import br.com.fatecmogidascruzes.excecao.ExcecaoAcessoDados;
import br.com.fatecmogidascruzes.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static java.sql.Statement.RETURN_GENERATED_KEYS;
import java.util.List;

/**
 *
 * @author matheus
 */
public class EnderecoDAO extends AbstractDAO {
    
    
    @Override
    public Resultado inserir(EntidadeDominio entidade){
    
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Endereco endereco = (Endereco) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO endereco (logradouro, numero, bairro, cep, cidade, uf, tipoLogradouro, nomeEndereco,"
                    + "complemento, referencia, id_cliente) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
                    declaracao.setString(1, endereco.getLogradouro());
                    declaracao.setString(2, endereco.getNumero());
                    declaracao.setString(3, endereco.getBairro());
                    declaracao.setString(4, endereco.getCep());           // inicia com 50 pontos                    
                    declaracao.setString(5, endereco.getCidade());
                    declaracao.setString(6, endereco.getUf());                    
                    declaracao.setString(7, endereco.getTipoLogradouro());
                    declaracao.setString(8, endereco.getNomeEndereco());
                    declaracao.setString(9, endereco.getComplemento());
                    declaracao.setString(10, endereco.getReferencia());
                    declaracao.setInt(11, endereco.getClienteId());
                   

            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("O Endereco foi inserido com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o Endereco");
        } catch (SQLException erro) {
            erro.printStackTrace();
            
        }
        
        return resultado;
    }

}
