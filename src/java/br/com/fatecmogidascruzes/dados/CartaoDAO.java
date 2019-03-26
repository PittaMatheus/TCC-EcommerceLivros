/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.dados;

import br.com.fatecmogidascruzes.dominio.Cartao;
import br.com.fatecmogidascruzes.dominio.Cliente;
import br.com.fatecmogidascruzes.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.dominio.Resultado;
import br.com.fatecmogidascruzes.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author matheus
 */
public class CartaoDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
         try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cartao cartao = (Cartao) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO cartao "
                    + "(nome, dtVencimento, bandeira, numero, codSeguranca, id_cliente)"
                                    + " VALUES(?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);

                    declaracao.setString(1, cartao.getNome());
                    declaracao.setString(2, cartao.getDtVencimento());
                    declaracao.setString(3, cartao.getBandeira().getNome());
                    declaracao.setString(4, cartao.getNumeroCartao());
                    declaracao.setString(5, cartao.getCodSeguranca());
                    declaracao.setInt(6, cartao.getCliente().getId());

               
            declaracao.execute();
            System.out.print("EXECUTEI A QUERY");
            ResultSet rs = declaracao.getGeneratedKeys();
            // Seta o ID cliente com o ID autoincrement que foi gerado no banco de dados
            cartao.setId((rs.next())?rs.getInt(1):0);                
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
    public Resultado listar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
