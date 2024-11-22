package utilizarConexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectBase {

    // Método para conectar ao banco de dados
    public static Connection conectar() throws ClassNotFoundException {
        Connection conexao = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/smart", "root", "");
            return conexao;
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return conexao;
    }

    // Método para fechar a conexão
    public static void fecharConexao(Connection conexao) {
        if (conexao != null) {
            try {
                conexao.close();
                System.out.println("Conexão fechada com sucesso!");
            } catch (SQLException ex) {
                System.out.println("Erro ao fechar a conexão: " + ex.getMessage());
            }
        }
    }
}
