package livraria.core.util;

public class ExcecaoAcessoDados extends Exception {

    public ExcecaoAcessoDados(String message) {
        super(message);
    }

    public ExcecaoAcessoDados(String message, Throwable cause) {
        super(message, cause);
    }

}
