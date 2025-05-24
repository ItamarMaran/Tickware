
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tickware</title>
            <!--My config-->
    <link rel="shortcut icon" href="../img/tkwr_favicon.png" />
    <link href="../css/index_css.css" rel="stylesheet" type="text/css"/>
    <script src='main.js'></script>
    <!--My config-->

    <!--BootStrap-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!--BootStrap-->
    </head>
    <body>
        <header>
        <nav class="navbar navbar-dark bg-dark">
            <ul class="nav">
                <li>
                    <a href="http://www.tickware.com.br"><img class="tkwr-img" src="../img/tkwr_white.png"></a>
                </li>
                <li class="nav-item">
                    <a href="tecno.jsp" class="nav-link active">Technologies</a>
                </li>
                <li class="nav-item">
                    <a href="about.jsp" class="nav-link active">About</a>
                </li>
                <li class="nav-item light">
                    <a href="../index.jsp" class="nav-link" href="#">Sign in</a>
                </li>
                <li class="nav-item">
                    <a href="login.jsp">
                        <button type="button" class="btn btn-outline-light">Sign up</button>
                    </a>
                </li>
            </ul>
        </nav>
    </header>
        <br>
        <h1 class="tabTitulo">Excluir Programador</h1>

        <%
            String strIdProgramador;
            int idProgramador;

            // Obtem os dados
            strIdProgramador = request.getParameter("IDProgramador");
            idProgramador = Integer.parseInt(strIdProgramador);
            
            String Email, Nome, Sobrenome, Endereco, Telefone, Cidade, Estado, Cep, Linguagem;
            Email = "";
            Nome = "";
            Sobrenome = "";
            Endereco = "";
            Telefone = "";
            Cidade = "";
            Estado = "";
            Cep = "";
            Linguagem = "";

            //=======================================================
            //              PESQUISA DADOS DO Programador
            //=======================================================
            Connection o_ConexaoBD;
            PreparedStatement cmdSQL;
            ResultSet rsProgramador;

            String Banco = "jdbc:postgresql://localhost:5432/tickware";
            String Usuario = "postgres";
            String Senha = "postgre";

            try {

                //Registra o driver JDBC do postgreSQL
                Class.forName("org.postgresql.Driver");
                // out.println("Driver carregado com sucesso!<br>");

                o_ConexaoBD = DriverManager.getConnection(Banco, Usuario, Senha);
                //out.println("Conecção efetuada com sucesso!<br>");

                cmdSQL = o_ConexaoBD.prepareStatement("Select * From Programador Where idprogramador = " + idProgramador);

                rsProgramador = cmdSQL.executeQuery();

                if (rsProgramador.next() == false) {

                    out.println("<br> Sem dados cadastrasdos para Programador.<br>");

                } else {

                    do {
                        idProgramador = rsProgramador.getInt("idprogramador");
                        Email = rsProgramador.getString("email");
                        Nome = rsProgramador.getString("nome");
                        Sobrenome = rsProgramador.getString("sobrenome");
                        Endereco = rsProgramador.getString("endereco");
                        Telefone = rsProgramador.getString("telefone");
                        Cidade = rsProgramador.getString("cidade");
                        Estado = rsProgramador.getString("estado");
                        Cep = rsProgramador.getString("cep");
                        Linguagem = rsProgramador.getString("linguagem");


                    } while (rsProgramador.next());
                }

            } catch (SQLException ex) {
                out.println("Erro de banco: " + ex);

            } catch (Exception ex) {
                out.println("Erro genérico " + ex);
            }
        %>  


        <form action="cadProgramadorControl.jsp" method="GET">
            <input class="posCampos" type="number" min="0" max="10000" step="1" name="txtIdProgramador" value="<%= idProgramador%>" readonly="" hidden="true"/><br><br>
            <div class="card-center mx-auto">
                <div class="card" style="width: 24rem;">
                    <img class="card-img-top" src="../img/login.svg" style="width: 8rem; margin: auto; margin-top: 20px;" alt="Imagem de capa do card">
                    <div class="card-body">
                      <h5 class="card-title">cod:<%= idProgramador%></h5>
                      <h5 class="card-title"><%= Nome + " " + Sobrenome%></h5>
                      <p class="card-text">E-mail:<%= " " + Email%></p>
                      <p class="card-text">Endereço:<%= " "+Endereco+ " "+ Cidade + " "+ Estado+" "+ Cep%></p>
                      <p class="card-text">Contato:<%= " "+Telefone%></p>
                      <p class="card-text">Linguagens:<%= " <h5>"+Linguagem +"</h5>"%></p>
                      <center>
                        <input class="btn btn-danger" type="submit" value="Excluir" name="btnOperacao" />
                        <input class="btn btn-secondary" type="submit" value="Cancelar" name="btnOperacao" />
                       </center>
                    </div>
                </div>
            </div>
        </form> 
    </body>
</html>
