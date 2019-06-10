/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

 $(document).ready(function(){
      $('.carousel').carousel();
      $('select').material_select();
      $(".menu").sideNav({
      menuWidth: 350, // Default is 300
      edge: 'left', // Choose the horizontal origin
      closeOnClick: false, // Closes side-nav on <a> clicks, useful for Angular/Meteor
      draggable: true // Choose whether you can drag to open on touch screens
    }
  );
    });
        
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
                var dataValidade = $(".tdValidade"+cartoes[i].value+"").text();                
                console.log(dataValidade);
                qtCartao++;
                html += "<label for='nomeCartao'>"+ nomeCartao + " - " + numeroCartao + " - " + dataValidade + " </label><br>" 
                html += "<input type='hidden'name='dataValidade' value='"+dataValidade+"'>" 
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
    
  

