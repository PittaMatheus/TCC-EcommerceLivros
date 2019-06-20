package livraria.core.util;

import ecommerce.dominio.livro.Livro;
import java.math.BigDecimal;
import java.text.DecimalFormat;


public class LivroUtils {
    private static DecimalFormat df = new DecimalFormat("#,###.00");
	
    public static String formatarPrecoLivro(Livro livro){
        StringBuilder sb = new StringBuilder();
        Double precoCalculado = calcularPrecoLivro(livro);
        sb.append("R$").append(df.format(precoCalculado));
        return sb.toString();
    }
    
    public static String formatarPrecoLivroLucro(Livro livro){
        StringBuilder sb = new StringBuilder();
        Double precoCalculado = calcularPrecoLivroLucro(livro);
        sb.append("R$").append(df.format(precoCalculado));
        return sb.toString();
    }

    public static Double calcularPrecoLivro(Livro livro){		
        return calcularPrecoLivro(livro, 1);
    }

    public static Double calcularPrecoLivroLucro(Livro livro){		
        return calcularPrecoLivroLucro(livro, 1);
    }
    
    public static Double calcularPrecoLivro(Livro livro, int qtde){		
        return (livro.getPreco() + (livro.getPreco() * (livro.getGrupoLivro().getMargemLucro() / 100))) * qtde;
    }
    
    public static Double calcularPrecoLivroLucro(Livro livro, int qtde){		
        return ((livro.getPreco() + (livro.getPreco() * (livro.getGrupoLivro().getMargemLucro() / 100))) * qtde) - (livro.getPreco());
    }

    public static Double arredondarPreco(Double preco){
        if(preco == null)
            return null;

        BigDecimal bd = new BigDecimal(preco);
        return bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();

    }

    public static String formatarPreco(Double preco){		
        return String.format("R$%s", df.format(arredondarPreco(preco)));
    }
    
    public static String formatarPreco(String preco){
        Double precos = Double.parseDouble(preco);
        return String.format("R$%s", df.format(arredondarPreco(precos)));
    }
    
    public static Float arredondarPreco(Float preco){
        if(preco == null)
            return null;

        BigDecimal bd = new BigDecimal(preco);
        return bd.setScale(2, BigDecimal.ROUND_HALF_UP).floatValue();

    }

    public static String formatarPreco(Float preco){		
        return String.format("R$%s", df.format(arredondarPreco(preco)));
    }
    
    public static String formatarPrecoFloat(String preco){
        Float precos = Float.parseFloat(preco);
        return String.format("R$%s", df.format(arredondarPreco(precos)));
    }

//    public static String gerarNumeroCupom(Pedido pedido) {
//        StringBuilder sb = new StringBuilder();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//        DecimalFormat idf = new DecimalFormat("00000");
//        sb.append("CT").append(sdf.format(pedido.getDtPedido())).append(idf.format(pedido.getId())).append(idf.format(pedido.getCliente().getId().doubleValue()));		
//        return sb.toString();
//
//    }
}
