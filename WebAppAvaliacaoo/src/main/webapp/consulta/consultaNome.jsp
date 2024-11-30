<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pesquisa de Satisfação - Detalhes</title>
    <!-- Vinculando o arquivo CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Pesquisa de Satisfação - Detalhes do Registro</h1>

        <%
            // Entrada/Receber
            String nome = request.getParameter("nome");

            // Instância e atribuição de valor
            Pesquisa pesq = new Pesquisa();
            pesq.setNome(nome);

            // Select
            PesquisaDAO pesqDAO = new PesquisaDAO();
            if (pesqDAO.consPesqReg(pesq) != null) {
                out.println("<div class='registro'>");
                out.println("<p><strong>Data:</strong> " + pesq.getDt_pesq() + "</p>");
                out.println("<p><strong>Nome:</strong> " + pesq.getNome() + "</p>");
                out.println("<p><strong>E-mail:</strong> " + pesq.getEmail() + "</p>");
                out.println("<p><strong>Questão 1:</strong> " + pesq.getQ1() + "</p>");
                out.println("<p><strong>Questão 2:</strong> " + pesq.getQ2() + "</p>");
                out.println("<p><strong>Questão 3:</strong> " + pesq.getQ3() + "</p>");
                out.println("<p><strong>Questão 4:</strong> " + pesq.getQ4() + "</p>");
                out.println("</div>");
                out.println("<div class='legenda'><b>Legenda:</b><br><img src='../imagens/escala.jpg' alt='Escala de satisfação' /></div>");
            } else {
                out.println("<p><b>Registro não encontrado!</b></p>");
            }
        %>
    </div>
</body>
</html>
