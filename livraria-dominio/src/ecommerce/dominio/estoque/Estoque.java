package ecommerce.dominio.estoque;

import ecommerce.dominio.EntidadeDominio;


public class Estoque extends EntidadeDominio{
    
    
    private Item item;
    
    
    public Estoque(){
        item = new Item();
    }
    
    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
    
}