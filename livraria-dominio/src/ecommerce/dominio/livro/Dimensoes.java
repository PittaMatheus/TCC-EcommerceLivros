package ecommerce.dominio.livro;

import ecommerce.dominio.EntidadeDominio;

public class Dimensoes extends EntidadeDominio{
    
    private Integer id;
    private Double altura;
    private Double largura;
    private Double peso;
    private Double profundidade;

    public Dimensoes(Integer id, Double altura, Double largura, Double peso, Double profundidade) {
		super();
		this.id = id;
		this.altura = altura;
                this.largura = largura;
                this.peso = peso;
                this.profundidade = profundidade;
	}
    
    public Dimensoes(){
    }
    
    public Integer getId(){
        return id;
    }
    
    public void setId(Integer id){
        this.id = id;
    }
    
    public Double getAltura() {
        return altura;
    }

    public void setAltura(Double altura) {
        this.altura = altura;
    }

    public Double getLargura() {
        return largura;
    }

    public void setLargura(Double largura) {
        this.largura = largura;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public Double getProfundidade() {
        return profundidade;
    }

    public void setProfundidade(Double profundidade) {
        this.profundidade = profundidade;
    }

    
}
