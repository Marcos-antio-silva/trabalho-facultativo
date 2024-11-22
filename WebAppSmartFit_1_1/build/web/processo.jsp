<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Inscritos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="modelo.dao.InscritoDAO"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Inscrição</title>
</head>
<body>   
    <h1>Registrar</h1>
    <%
        try {
            // Captura os dados enviados pelo formulário
            String cpf = request.getParameter("cpf");
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");            
            String sexo = request.getParameter("sexo");
            
            // Captura o numero de celular e remove caracteres não numéricos
            String cel = request.getParameter("celular").replaceAll("[^\\d]", "");
            
            // Captura a data de nascimento e converte para o formato Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date niver = sdf.parse(request.getParameter("nascimento"));

            // Verifica os valores capturados
            System.out.println("cpf: " + cpf);
            System.out.println("nome: " + nome);
            System.out.println("email: " + email);
            System.out.println("sexo: " + sexo);
            System.out.println("cel: " + cel);
            System.out.println("niver: " + niver);

            // Instancia o objeto Inscritos e atribui os valores capturados
            Inscritos inscrito = new Inscritos();
            inscrito.setCpf(cpf);
            inscrito.setNome(nome);
            inscrito.setEmail(email);
            inscrito.setSexo(sexo);
            inscrito.setCel(cel);
            inscrito.setNiver(niver);

            // Instancia o DAO 
            InscritoDAO inscritoDAO = new InscritoDAO();

            // Verifica se a inserção foi bem-sucedida
            if (inscritoDAO.inserir(inscrito)) {  
                out.println("Registro inserido com sucesso!");
            } else {
                out.println("Erro ao tentar registrar o inscrito.");
            }
        } catch (Exception e) {
            out.println("Erro: " + e.getMessage());
        }
    %>
</body>
</html>
