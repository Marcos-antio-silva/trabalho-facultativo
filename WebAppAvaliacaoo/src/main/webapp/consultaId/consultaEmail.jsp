<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consulta de Pesquisa - Pesquisa de Satisfação</title>
    <!-- Vinculando o arquivo CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Consulta de Pesquisa de Satisfação</h1>

        <form name="frmPesq" method="post" action="consultaReg.jsp">
            <label for="email">Digite o E-mail:</label>
            <input type="email" name="email" id="email" required>
            <input type="submit" value="Consultar" class="btn btn-primary">
        </form>

        <%
            // Entrada/Receber
            String email = request.getParameter("email");

            // Instância e atribuição de valor
            Pesquisa pesq = new Pesquisa();
            pesq.setEmail(email);

            // Select
            PesquisaDAO pesqDAO = new PesquisaDAO();
            if (pesqDAO.consPesqRegId(pesq) != null) {
                out.println("<br><b class='alerta sucesso'>Pesquisa de Satisfação Encontrada:</b><br>");
                out.println("<br> Data: " + pesq.getDt_pesq());
                out.println("<br> Nome: " + pesq.getNome());
                out.println("<br> E-mail: " + pesq.getEmail());
                out.println("<br> Questão 1: " + pesq.getQ1());
                out.println("<br> Questão 2: " + pesq.getQ2());
                out.println("<br> Questão 3: " + pesq.getQ3());
                out.println("<br> Questão 4: " + pesq.getQ4());
                out.println("<br><br><b>Legenda:</b><br> <img src='../imagens/escala.jpg' alt='Escala de satisfação'/>");
            } else {
                out.println("<br><b class='alerta erro'>Registro não encontrado!!!</b>");
            }
        %>
    </div>
</body>
</html>
