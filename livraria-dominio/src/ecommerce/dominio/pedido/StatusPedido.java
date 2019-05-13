/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.pedido;

import ecommerce.dominio.EntidadeDominio;

/**
 *
 * @author matheus
 */
public class StatusPedido extends EntidadeDominio{
        private Integer id;
        private String status;
	private StatusPedido proximoStatus;
	public static final Integer EM_PROGRESSO = 1;
	public static final Integer EM_TRANSPORTE = 2;
	public static final Integer ENTREGUE = 3;
	public static final Integer EM_TROCA= 4;
	public static final Integer APROVADO = 5;
	public static final Integer REPROVADO = 6;
	public static final Integer TROCADO = 7;

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

    public StatusPedido getProximoStatus() {
        return proximoStatus;
    }

    public void setProximoStatus(StatusPedido proximoStatus) {
        this.proximoStatus = proximoStatus;
    }
        
        
    
    
}
