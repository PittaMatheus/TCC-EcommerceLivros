/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function DividePorCartao(){
    //var checkCartao = document.formCartao.checkCartao;
    //console.log(checkCartao)
    var qtCartao = 0;
    var html = "";
    var cartoes = document.getElementsByName('id_cartao')

    for (var i = 0; i < cartoes.length; i++){
        if ( cartoes[i].checked ) {
                var nomeCartao = $(".tdNomeCartao"+cartoes[i].value+"").text(); 
                var numeroCartao = $(".tdNumeroCartao"+cartoes[i].value+"").text();                
                qtCartao++;
                html += "<label for='nomeCartao'>"+ nomeCartao + " - " + numeroCartao + "</label><br>"                
                html += "<input type='text' name='valorCartao'  class='valor"+cartoes[i].value+"'><br>"
            }
        }  
    document.getElementById('DivideValor').innerHTML = html;
    }

function CalculaValor(){
    var html2 = "";
    var html3 = "";
    var valorTotal = document.getElementById('valorTotal').value
    var cartoes = document.getElementsByName('id_cartao')
    var valoresCartoes = new Array();
    var somaCartoes = 0;
    var qtCartao = 0;


    // Lista todos os cartoes
    for (var i = 0; i < cartoes.length; i++){
                      
        if ( cartoes[i].checked ) {
                var nomeCartao = $(".tdNomeCartao"+cartoes[i].value+"").text(); 
                var numeroCartao = $(".tdNumeroCartao"+cartoes[i].value+"").text();
                var valorCartao = $(".valor"+cartoes[i].value+"").val();                
                qtCartao = parseInt(0) + parseInt(1);
                valoresCartoes[i] = valorCartao;
                
                for(i = 0; i < valoresCartoes.length; i++){
                    somaCartoes = parseInt(somaCartoes) + parseInt(valoresCartoes[i]);
                }              
            }
            
    }
}
    
  

