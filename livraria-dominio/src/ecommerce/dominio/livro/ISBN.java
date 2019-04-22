package ecommerce.dominio.livro;

import ecommerce.dominio.EntidadeDominio;


public class ISBN extends EntidadeDominio{
    
    private Integer id;
    private String codBarras;

    public String getCodBarras() {
        return codBarras;
    }

    public void setCodBarras(String codBarras) {
        this.codBarras = codBarras;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
       
}
