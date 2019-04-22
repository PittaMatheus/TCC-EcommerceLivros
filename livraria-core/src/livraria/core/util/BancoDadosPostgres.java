package livraria.core.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BancoDadosPostgres {

    public static Connection getConexao() throws ClassNotFoundException, SQLException {
        // Define um driver de conexao com o banco.
        Class.forName("org.postgresql.Driver");
        // Abre uma conexao com o banco.
        Connection conexao;
        return DriverManager.getConnection("jdbc:postgresql://localhost:5432/Ecommerce","root","root");
    }

}
