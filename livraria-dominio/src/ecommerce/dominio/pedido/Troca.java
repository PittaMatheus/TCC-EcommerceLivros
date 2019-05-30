/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import java.util.Date;

/**
 *
 * @author matheus
 */
public class Troca extends EntidadeDominio {
    private Integer id;
    private Cliente cliente;
    private Pedido pedido;
    private Date dataTroca;
    private String status;
    
    
    
    public Troca()
    {
        pedido = new Pedido();
        cliente = new Cliente();
    }

    public Date getDataTroca() {
        return dataTroca;
    }

    public void setDataTroca(Date dataTroca) {
        this.dataTroca = dataTroca;
    }
    

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Pedido getPedido() {
        return pedido;
    }

    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }
    
    
    
    
}
