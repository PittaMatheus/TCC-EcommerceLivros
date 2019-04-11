/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.dados;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria;
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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
            
            // Inserindo a editora e recuperando ID para colocar na inserção do LIVRO
             PreparedStatement declaracao = conexao.prepareStatement(
                    "INSERT INTO editora "
                    + "(nome_editora) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
             declaracao.setString(1, livro.getEditora().getNome());
             declaracao.execute();
             ResultSet rs = declaracao.getGeneratedKeys(); 
             livro.getEditora().setId((rs.next())?rs.getInt(1):0);
             
             // Inserir categoria
             PreparedStatement declaracao2 = conexao.prepareStatement(
                    "INSERT INTO dimensoes "
                    + "(altura, largura, peso, profundidade) VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
             declaracao2.setDouble(1, livro.getDimensoes().getAltura());
             declaracao2.setDouble(2, livro.getDimensoes().getLargura());
             declaracao2.setDouble(3, livro.getDimensoes().getPeso());
             declaracao2.setDouble(4, livro.getDimensoes().getProfundidade());
             declaracao2.execute();
             rs = declaracao2.getGeneratedKeys(); 
             livro.getDimensoes().setId((rs.next())?rs.getInt(1):0);
             
             
            // Inserir categoria
             PreparedStatement declaracao3 = conexao.prepareStatement(
                    "INSERT INTO isbn "
                    + "(cod_barras) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
             declaracao3.setString(1, livro.getIsbn().getCodBarras());
             declaracao3.execute();
             rs = declaracao3.getGeneratedKeys(); 
             livro.getIsbn().setId((rs.next())?rs.getInt(1):0); 
             
            // INSERIR LIVRO
            PreparedStatement declaracao4 = conexao.prepareStatement(
                    "INSERT INTO livro "
                    + "(codigo_barras, autor, titulo, ano, edicao, numero_paginas, sinopse, preco, id_editora,id_dimensao, id_isbn, id_grupolivro)"
                   + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            declaracao4.setString(1, livro.getCodigoBarras());
            declaracao4.setString(2, livro.getAutor());
            declaracao4.setString(3, livro.getTitulo());
            declaracao4.setString(4, livro.getAno());
            declaracao4.setString(5, livro.getEdicao());
            declaracao4.setString(6, livro.getNumeroPaginas());
            declaracao4.setString(7, livro.getSinopse());;
            declaracao4.setDouble(8, livro.getPreco());
            declaracao4.setInt(9, livro.getEditora().getId());
            declaracao4.setInt(10, livro.getDimensoes().getId());
            declaracao4.setInt(11, livro.getIsbn().getId());
            declaracao4.setInt(12, livro.getGrupoLivro().getId());
            declaracao4.execute();

            rs = declaracao4.getGeneratedKeys(); 
            livro.setId((rs.next())?rs.getInt(1):0);

                // INSERIR CATEGORIA N P N
            for(Categoria categoria: livro.getCategorias()){
                 PreparedStatement declaracao5 = conexao.prepareStatement(
                    "INSERT INTO livro_categoria "
                    + "(id_livro, id_categoria) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
               declaracao5.setInt(1, livro.getId());
               declaracao5.setInt(2, categoria.getId());
                declaracao5.execute();
            }
          
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao inserir o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setMensagem("O Livro foi inserido com sucesso!");
        resultado.setStatus(true);
        resultado.setAcao("inserir");
        
        return resultado;
    
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            if(livro.getAtivo()){
                PreparedStatement declaracao = conexao.prepareStatement("SELECT\n" +
        "livro.id as id_livro, livro.codigo_barras as cod_barras, livro.autor as autor, livro.ano as ano,\n" +
        "livro.edicao as edicao, livro.titulo as titulo,livro.numero_paginas as numero_paginas, livro.sinopse as sinopse, livro.ativo as status,\n" +
        "livro.preco as preco, editora.id as id_editora, editora.nome_editora as nome_editora, \n" +
        "dimensoes.id as id_dimensoes, dimensoes.altura as altura,\n" +
        "dimensoes.profundidade as profundidade, dimensoes.largura as largura, dimensoes.peso as peso, \n" +
        "isbn.id as id_isbn, isbn.cod_barras as ISBN, grupolivro.id as id_grupolivro, \n" +
        "grupolivro.nome_grupolivro as nome_grupolivro, grupolivro.margem_lucro as margem_lucro\n" +
        "FROM livro\n" +
        "INNER JOIN editora ON editora.id = livro.id_editora\n" +
        "INNER JOIN dimensoes ON dimensoes.id = livro.id_dimensao\n" +
        "INNER JOIN isbn ON isbn.id = livro.id_isbn\n" +
        "INNER JOIN livro_categoria ON livro_categoria.id_livro = livro.id \n" +
        "INNER JOIN grupolivro on grupolivro.id = livro.id_grupolivro where livro.ativo =1;");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Livro liv = new Livro();
                liv.setId(rs.getInt("id_livro"));
                liv.setCodigoBarras(rs.getString("cod_barras"));
                liv.setAutor(rs.getString("autor"));
                liv.setTitulo(rs.getString("titulo"));
                liv.setAno(rs.getString("ano"));
                liv.setEdicao(rs.getString("edicao"));
                liv.setNumeroPaginas(rs.getString("numero_paginas"));
                liv.setSinopse(rs.getString("sinopse"));
                liv.setPreco(rs.getDouble("preco"));
                liv.getEditora().setId(rs.getInt("id_editora"));
                liv.getEditora().setNome(rs.getString("nome_editora"));
                liv.getDimensoes().setId(rs.getInt("id_dimensoes"));
                liv.getDimensoes().setAltura(rs.getDouble("altura"));
                liv.getDimensoes().setProfundidade(rs.getDouble("profundidade"));
                liv.getDimensoes().setLargura(rs.getDouble("largura"));
                liv.getDimensoes().setPeso(rs.getDouble("peso"));
                liv.getIsbn().setCodBarras(rs.getString("ISBN"));
                liv.getIsbn().setId(rs.getInt("id_isbn"));
                liv.getGrupoLivro().setId(rs.getInt("id_grupolivro"));
                liv.getGrupoLivro().setNome(rs.getString("nome_grupolivro"));
                liv.getGrupoLivro().setMargemLucro(rs.getDouble("margem_lucro"));
                liv.setAtivo(true);   
                entidades.add(liv);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarLivros");
           }
            else if(!livro.getAtivo()){
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.nome,c.sobrenome, c.data_nascimento, "
                    + "c.ranking, c.email, c.cpf, c.rg, c.sexo, c.tipo_usuario "
                    + "FROM cliente c WHERE c.status = 0");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Cliente cli = new Cliente();
                cli.setId(rs.getInt("id"));
                cli.setNome(rs.getString("nome"));
                cli.setSobrenome(rs.getString("sobrenome"));
                cli.setData_nascimento(rs.getDate("data_nascimento"));
                cli.setRanking(rs.getDouble("ranking"));
                cli.setEmail(rs.getString("email"));
                cli.setCpf(rs.getString("cpf"));
                cli.setRg(rs.getString("rg"));
                cli.setSexo(rs.getString("sexo"));
                cli.getPapel().setId(rs.getInt("tipo_usuario"));;
               
                entidades.add(cli);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarDesativados");
            }
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setEntidades(entidades);
       return resultado;
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
