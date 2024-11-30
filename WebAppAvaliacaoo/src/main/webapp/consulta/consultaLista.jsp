<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Pesquisa - Lista de Registros</title>
    <!-- Vinculando o arquivo CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Pesquisa de Satisfação - Lista de Registros</h1>

        <%
            // Select "Lista"
            PesquisaDAO pesqDAO = new PesquisaDAO();
            List<Pesquisa> lista = pesqDAO.consPesqLista();
            int n_reg = 0;

            out.println("<br><img src='../imagens/logo.jpg' alt='Logo da Empresa' class='logo'/>");
            
            // Exibe os registros
            for (int i = 0; i < lista.size(); i++) {
                out.println("<div class='registro'>");
                out.println("<p><strong>#:</strong> " + i + "</p>");
                out.println("<p><strong>Data:</strong> " + lista.get(i).getDt_pesq() + "</p>");
                out.println("<p><strong>Nome:</strong> " + lista.get(i).getNome() + "</p>");
                out.println("<p><strong>E-mail:</strong> " + lista.get(i).getEmail() + "</p>");
                out.println("<p><strong>Questão 1:</strong> " + lista.get(i).getQ1() + "</p>");
                out.println("<p><strong>Questão 2:</strong> " + lista.get(i).getQ2() + "</p>");
                out.println("<p><strong>Questão 3:</strong> " + lista.get(i).getQ3() + "</p>");
                out.println("<p><strong>Questão 4:</strong> " + lista.get(i).getQ4() + "</p>");
                out.println("</div>");
                n_reg++;
            }

            out.println("<p><strong>Total de Registros:</strong> " + n_reg + "</p>");
            out.println("<div class='legenda'><b>Legenda:</b><br><img src='../imagens/escala.jpg' alt='Escala de satisfação'/></div>");
        %>
    </div>
</body>
</html>
