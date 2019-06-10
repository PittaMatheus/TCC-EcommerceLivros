/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.cliente.Endereco;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author matheus
 */
public class Pedido extends EntidadeDominio{
    private Integer id;
    private String tipo;
    private Cliente cliente;
    private List<ItemPedido> items;
    private Endereco endereco;
    private Pagamento pagamento;
    private Date dtPedido;
    private StatusPedido statusPedido;
    private Cupom cupom;
    private Item item;

	
	public Pedido() {
                cliente = new Cliente();
                endereco = new Endereco();
                cupom = new Cupom();
                statusPedido = new StatusPedido();
                item = new Item();
		Pagamento pagamento = new Pagamento();
		List<PagamentoCartaoCredito> pagamentos = new ArrayList<PagamentoCartaoCredito>();
		pagamento.setPagamentosCartao(pagamentos);
		this.setPagamento(pagamento);

	}

        
        
    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

        
        
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

        
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Cupom getCupom() {
        return cupom;
    }

    public void setCupom(Cupom cupom) {
        this.cupom = cupom;
    }


    
    public List<ItemPedido> getItems() {
        return items;
    }

    public void setItems(List<ItemPedido> items) {
        this.items = items;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

   public Pagamento getPagamento() {
      return pagamento;
   }

    public void setPagamento(Pagamento pagamento) {
        this.pagamento = pagamento;
   }

    public Date getDtPedido() {
        return dtPedido;
    }

    public void setDtPedido(Date dtPedido) {
        this.dtPedido = dtPedido;
    }

    public StatusPedido getStatusPedido() {
        return statusPedido;
    }

    public void setStatusPedido(StatusPedido statusPedido) {
        this.statusPedido = statusPedido;
    }
    
}
