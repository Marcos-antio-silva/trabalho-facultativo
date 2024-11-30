<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exclusão - Pesquisa de Satisfação</title>
    <!-- Vinculando o arquivo CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Pesquisa de Satisfação - Exclusão (Id)</h1>

        <form name="frmPesq" method="post" action="exclPesqId.jsp">
            <label for="id">Digite a Identificação:</label>
            <input type="text" name="id" id="id" required>
            <input type="submit" value="Apagar" class="btn btn-danger">
        </form>

        <%
            // Entrada/Receber
            int id = Integer.parseInt(request.getParameter("id"));

            // Instância e atribuição de valor
            Pesquisa pesq = new Pesquisa();
            pesq.setId(id);

            // Select
            PesquisaDAO pesqDAO = new PesquisaDAO();
            if (pesqDAO.exPesqId(pesq)) {
                out.println("<br><b class='alerta sucesso'>Registro excluído com sucesso!</b><br>");
            } else {
                out.println("<b class='alerta erro'>Registro não excluído!!!</b>");
            }
        %>
    </div>
</body>
</html>
