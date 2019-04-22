package ecommerce.dominio.livro;

import ecommerce.dominio.EntidadeDominio;

/**
 *
 * @author bocao
 */
public class GrupoLivro extends EntidadeDominio{
    
    private String nome;
    private Integer id;


    private double margemLucro;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getMargemLucro() {
        return margemLucro;
    }

    public void setMargemLucro(double margemLucro) {
        this.margemLucro = margemLucro;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
}
