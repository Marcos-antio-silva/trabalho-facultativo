package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.Inscritos;
import utilizarConexao.ConectBase;

public class InscritoDAO {

    // Método para inserir um novo inscrito no banco de dados
    public boolean inserir(Inscritos inscrito) throws ClassNotFoundException {
        Connection conexao = null;
        PreparedStatement pstmt = null;
        try {
            // Conecta ao banco de dados
            conexao = ConectBase.conectar();
            
            // SQL para inserir um novo inscrito
            String sql = "INSERT INTO inscricao (cpf, nome, email, sexo, cel, niver) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conexao.prepareStatement(sql);
            
            // Define os valores dos parâmetros SQL
            pstmt.setString(1, inscrito.getCpf());
            pstmt.setString(2, inscrito.getNome());
            pstmt.setString(3, inscrito.getEmail());
            pstmt.setString(4, inscrito.getSexo());
            pstmt.setString(5, inscrito.getCel());
            pstmt.setDate(6, new java.sql.Date(inscrito.getNiver().getTime()));
            
            // Executa SQL e verifica se deu certo
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException ex) {
            // Imprime a mensagem de erro 
            System.out.println("Erro ao inserir dados: " + ex.getMessage());
            return false;
        } finally {
            // Fecha o PreparedStatement
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                    System.out.println("Erro ao fechar pstmt: " + ex.getMessage());
                }
            }
            
            // Fecha a conexão
            if (conexao != null) {
                try {
                    conexao.close();
                } catch (SQLException ex) {
                    System.out.println("Erro ao fechar conexão: " + ex.getMessage());
                }
            }
        }
    }
}
