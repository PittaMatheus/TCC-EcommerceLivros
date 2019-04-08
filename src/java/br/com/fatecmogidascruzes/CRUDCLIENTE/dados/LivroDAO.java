/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.dados;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import br.com.fatecmogidascruzes.CRUDCLIENTE.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author matheus
 */
public class LivroDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
         List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(
                    "INSERT INTO livro "
                    + "(codigo_barras, autor, titulo, ano, edicao, numero_paginas, sinopse, ativo, preco, id_editora,id_dimensao, id_isbn, id_grupolivro("
                   + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            declaracao.setString(1, livro.getCodigoBarras());
            declaracao.setString(2, livro.getAutor());
            declaracao.setString(3, livro.getTitulo());
            declaracao.setString(4, livro.getAno());
            declaracao.setString(5, livro.getEdicao());
            declaracao.setString(6, livro.getNumeroPaginas());
            declaracao.setString(7, livro.getSinopse());
            declaracao.setBoolean(8, livro.getAtivo());
            declaracao.setDouble(9, livro.getPreco());
            declaracao.setInt(10, livro.getEditora().getId());
            declaracao.setInt(11, livro.getDimensoes().getId());
            declaracao.setInt(12, livro.getIsbn().getId());
            declaracao.setInt(13, livro.getGrupoLivro().getId());
            declaracao.executeUpdate();

            ResultSet rs = declaracao.getGeneratedKeys(); 
            livro.setId((rs.next())?rs.getInt(1):0);
    
                 
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

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado desativar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado ativar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado consultar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
