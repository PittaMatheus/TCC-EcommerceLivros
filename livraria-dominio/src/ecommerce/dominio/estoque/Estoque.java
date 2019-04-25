package ecommerce.dominio.estoque;

import ecommerce.dominio.EntidadeDominio;


public class Estoque extends EntidadeDominio{
    private Fornecedor fornecedor;
    private Item item;
    
    public Estoque(){
        item = new Item();
    }

    public Fornecedor getFornecedor() {
        return fornecedor;
    }

    public void setFornecedor(Fornecedor fornecedor) {
        this.fornecedor = fornecedor;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
    
}
