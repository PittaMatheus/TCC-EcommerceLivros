package br.com.fatecmogidascruzes.CRUDCLIENTE.dominio;

/**
 *
 * @author bocao
 */
public class GrupoLivro extends EntidadeDominio{
    
    private String nome;
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
    
    
}
