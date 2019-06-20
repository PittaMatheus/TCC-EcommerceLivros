/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.livro;

import livraria.core.dao.AbstractDAO;
import ecommerce.dominio.livro.Categoria;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import livraria.core.aplicacao.Resultado;
import livraria.core.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import livraria.core.controle.Fachada;
import livraria.core.util.LogTransacoes;

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
            //LOG
//            StringBuilder log = new StringBuilder();
//            log.append("\nOPERAÇÃO: SALVAR | AUTOR: " + Fachada.usuario.getEmail() + "| ENTIDADE: LIVRO | \n");
//            log.append("DADOS_INSERIDOS: (\n LIVRO_ID: " + livro.getId() + ",\n TÍTULO: " + livro.getTitulo() + ",\n");
//            log.append(" AUTOR: " + livro.getAutor() + ",\n EDIÇÃO: " + livro.getEdicao() + ",\n");
//            log.append(" EDITORA: " + livro.getEditora().getNome() + ",\n ANO: " + livro.getAno() + ",\n");
//            log.append(" NUMERO_PAGINAS: " + livro.getNumeroPaginas() + ",\n ALTURA: " + livro.getDimensoes().getAltura() + ",\n");
//            log.append(" LARGURA: " + livro.getDimensoes().getLargura() + ",\n PROFUNDIDADE: " + livro.getDimensoes().getProfundidade() + ",\n");
//            log.append(" PESO: " + livro.getDimensoes().getPeso() + ",\n SINOPSE: " + livro.getSinopse() + ",\n");
//            log.append(" PRECIFICAÇÃO: " + livro.getPreco() + ",\n ISBN: " + livro.getIsbn().getCodBarras() + ",\n");
//            log.append(" CODIGO_BARRAS: " + livro.getCodigoBarras() + ")");
//            LogTransacoes.executaLog(log.toString());
                      // Fecha a conexao.
            conexao.close();
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
                PreparedStatement declaracao = conexao.prepareStatement("SELECT " +
        "livro.id as id_livro, livro.codigo_barras as cod_barras, livro.autor as autor, livro.imagem as imagem, livro.ano as ano, " +
        "livro.edicao as edicao, livro.titulo as titulo,livro.numero_paginas as numero_paginas, livro.sinopse as sinopse, livro.ativo as status, " +
        "livro.preco as preco, editora.id as id_editora, editora.nome_editora as nome_editora,  " +
        "dimensoes.id as id_dimensoes, dimensoes.altura as altura, " +
        "dimensoes.profundidade as profundidade, dimensoes.largura as largura, dimensoes.peso as peso,  " +
        "isbn.id as id_isbn, isbn.cod_barras as ISBN, grupolivro.id as id_grupolivro,  " +
        "grupolivro.nome_grupolivro as nome_grupolivro, grupolivro.margem_lucro as margem_lucro " +
        "FROM livro " +
        "INNER JOIN editora ON editora.id = livro.id_editora " +
        "INNER JOIN dimensoes ON dimensoes.id = livro.id_dimensao " +
        "INNER JOIN isbn ON isbn.id = livro.id_isbn " +
        "INNER JOIN grupolivro on grupolivro.id = livro.id_grupolivro where livro.ativo =?;");
            if(livro.getAtivo() == null){
                livro.setAtivo(true);
            }
            declaracao.setBoolean(1, livro.getAtivo());     
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
                liv.setImagem((rs.getString("imagem")));
                
                 // PESQUISAR TODAS AS CATEGORIAS DO LIVRO
                declaracao = conexao.prepareStatement("SELECT id_categoria FROM livro_categoria WHERE id_livro = ?");
                
                declaracao.setInt(1, liv.getId());
                ResultSet rsCategoria = declaracao.executeQuery();
                List<Categoria> categorias = new ArrayList<Categoria>();
                
                while (rsCategoria.next()){

                    Integer idCategoria = rsCategoria.getInt("id_categoria");

                    CategoriaDAO categoriaDao = new CategoriaDAO();
                    Categoria categoria = new Categoria();
                    

                    categoria.setId(idCategoria);

                    Resultado categoriaConsulta = categoriaDao.consultar(categoria);
                    

                    if( ! categoriaConsulta.getEntidades().isEmpty()){
                        categoria = (Categoria)categoriaConsulta.getEntidades().get(0);
                        categorias.add(categoria);
                    }
                }
                
                liv.setCategorias(categorias);
                if(livro.getAcao() == null){
                    if(livro.getAtivo()){
                        liv.setAtivo(true); 
                        resultado.setAcao("listarLivros");
                    }else{
                        liv.setAtivo(false);
                        resultado.setAcao("listarLivrosInativos");
                    }
                }
                else if(livro.getAcao().equals("menu")){
                    resultado.setAcao("listarIndex");
                }else if(livro.getAcao().equals("home")){
                    resultado.setAcao("listarHome");
                }
                    entidades.add(liv);
            }
            resultado.setStatus(true);
            conexao.close();
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
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            // Instancia das entidades relacionadas
            DimensoesDAO dimensoesDAO = new DimensoesDAO();
            IsbnDAO isbnDAO = new IsbnDAO();
            EditoraDAO editoraDao = new EditoraDAO();;
            dimensoesDAO.alterar(livro);
            isbnDAO.alterar(livro);
            editoraDao.alterar(livro);
   
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE livro SET autor=?, codigo_barras=?, titulo=?, ano=?, edicao=?, "
                    + "numero_paginas=?, sinopse=?, id_grupolivro=?, preco=? "
            + " WHERE id=?");
            
            declaracao.setString(1, livro.getAutor());
            declaracao.setString(2, livro.getCodigoBarras());
            declaracao.setString(3, livro.getTitulo());
            declaracao.setString(4, livro.getAno());
            declaracao.setString(5, livro.getEdicao());
            declaracao.setString(6, livro.getNumeroPaginas());
            declaracao.setString(7, livro.getSinopse());
            declaracao.setInt(8, livro.getGrupoLivro().getId());
            declaracao.setDouble(9, livro.getPreco());
            declaracao.setInt(10, livro.getId());
            declaracao.execute();
            
            
            resultado.setStatus(true);
            resultado.setMensagem("O livro foi alterarado com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao alterar o livro");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado desativar(EntidadeDominio entidade) {
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(""
                                                + "UPDATE livro SET ativo = ?"
						+ " WHERE id=?");
            
				declaracao.setString(1, "0");
				declaracao.setInt(2, livro.getId());
				declaracao.execute();

            resultado.setStatus(true);
            resultado.setMensagem("O livro foi desativado com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao desativar o livro");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado ativar(EntidadeDominio entidade) {
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(""
                                                + "UPDATE livro SET ativo = ?"
						+ " WHERE id=?");
            
				declaracao.setString(1, "1");
				declaracao.setInt(2, livro.getId());
				declaracao.execute();

            resultado.setStatus(true);
            resultado.setMensagem("O livro foi ativado com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao ativar o livro");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado consultar(EntidadeDominio entidade) {
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
//            "INNER JOIN categoria ON categoria.id = categoria.id" +
//            "categoria.id as id_categoria, categoria.nome as nome_categoria " +
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            if(livro.getAtivo()){
                PreparedStatement declaracao = conexao.prepareStatement("SELECT " +
        "livro.id as id_livro, livro.codigo_barras as cod_barras, livro.autor as autor, livro.ano as ano, " +
        "livro.edicao as edicao, livro.titulo as titulo,livro.numero_paginas as numero_paginas, livro.sinopse as sinopse, livro.ativo as status, " +
        "livro.preco as preco, livro.imagem as imagem, editora.id as id_editora, editora.nome_editora as nome_editora,  " +
        "dimensoes.id as id_dimensoes, dimensoes.altura as altura, " +
        "dimensoes.profundidade as profundidade, dimensoes.largura as largura, dimensoes.peso as peso,  " +
        "isbn.id as id_isbn, isbn.cod_barras as ISBN, grupolivro.id as id_grupolivro,  " +
        "grupolivro.nome_grupolivro as nome_grupolivro, grupolivro.margem_lucro as margem_lucro " +
        
        "FROM livro " +
        "INNER JOIN editora ON editora.id = livro.id_editora " +
        "INNER JOIN dimensoes ON dimensoes.id = livro.id_dimensao " +
        "INNER JOIN isbn ON isbn.id = livro.id_isbn " +
        "INNER JOIN livro_categoria ON livro_categoria.id_livro = livro.id  " +
        "INNER JOIN grupolivro on grupolivro.id = livro.id_grupolivro " +
        
        "where livro.ativo =1 AND livro.id = ?");
            declaracao.setInt(1, livro.getId());
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
                liv.setImagem(rs.getString("imagem"));
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
                
                // PESQUISAR TODAS AS CATEGORIAS DO LIVRO
                declaracao = conexao.prepareStatement("SELECT id_categoria FROM livro_categoria WHERE id_livro = ?");
                
                declaracao.setInt(1, liv.getId());
                ResultSet rsCategoria = declaracao.executeQuery();
                List<Categoria> categorias = new ArrayList<Categoria>();
                
                while (rsCategoria.next()){

                    Integer idCategoria = rsCategoria.getInt("id_categoria");

                    CategoriaDAO categoriaDao = new CategoriaDAO();
                    Categoria categoria = new Categoria();
                    

                    categoria.setId(idCategoria);

                    Resultado categoriaConsulta = categoriaDao.consultar(categoria);
                    

                    if( ! categoriaConsulta.getEntidades().isEmpty()){
                        categoria = (Categoria)categoriaConsulta.getEntidades().get(0);
                        categorias.add(categoria);
                    }
                }
                
                liv.setCategorias(categorias);
                entidades.add(liv);
            }
            
            resultado.setStatus(true);
            resultado.setAcao("consultar");
            resultado.setMensagem("livro listado com sucesso");
           }
            conexao.close();
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
}
