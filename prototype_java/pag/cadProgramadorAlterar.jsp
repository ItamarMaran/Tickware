<%-- 
    Document   : cadProgramadorAlterar
    Created on : 01/12/2019, 11:59:05
    Author     : maran
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

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
    
    <title>Tickware</title>
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
        
        <%
            String strIdProgramador;
            int idProgramador = 0;
            
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

            // Obtem os dados
            strIdProgramador = request.getParameter("IDProgramador");
            idProgramador = Integer.parseInt(strIdProgramador);

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
                        idProgramador = rsProgramador.getInt("idProgramador");
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
        
        <br>
        <h1 class="tabTitulo">Alterar Programador</h1>
        <div class="formulario px-4 mt-8">
        <div class="mb-8 container-md">
            <div class="mb-8 container-md">
                <form class="form-horizontal" name="frmCadastro" action="cadProgramadorControl.jsp" method="GET">
                    <fieldset>
                        <input type="hidden" name="txtIdProgramador" value=""/><br><br>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <input name='txtEmail' type='email' class='form-control' id='inputEmail' value="<%= Email%>">
                            </div>
                            <div class="form-group col-md-4">
                                <input name='txtNome' type='text' class='form-control' id='inputNome' value="<%= Nome%>">
                            </div>
                            <div class="form-group col-md-4">
                                <input name='TxtSobrenome' type='text' class='form-control' id='inputSobrenome' value="<%= Sobrenome%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <input name="txtEndereco" type="text" class="form-control" id="inputEndereco" value="<%= Endereco%>">
                            </div>
                            <div class="form-group col-md-4">
                                <input name="txtTelefone" type="text" class="form-control" id="inputTelefone" value="<%= Telefone%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <input name="TxtCidade" type="text" class="form-control" id="inputCidade" value="<%= Cidade%>">
                            </div>
                            <div class="form-group col-md-4">
                                <select name="OptEstado" id="inputEstado" class="form-control">
                                    <option selected><%= Estado%></option>
                                    <option value="AC">Acre</option>
                                    <option value="AL">Alagoas</option>
                                    <option value="AP">Amapá</option>
                                    <option value="AM">Amazonas</option>
                                    <option value="BA">Bahia</option>
                                    <option value="CE">Ceará</option>
                                    <option value="DF">Distrito Federal</option>
                                    <option value="ES">Espírito Santo</option>
                                    <option value="GO">Goiás</option>
                                    <option value="MA">Maranhão</option>
                                    <option value="MT">Mato Grosso</option>
                                    <option value="MS">Mato Grosso do Sul</option>
                                    <option value="MG">Minas Gerais</option>
                                    <option value="PA">Pará</option>
                                    <option value="PB">Paraíba</option>
                                    <option value="PR">Paraná</option>
                                    <option value="PE">Pernambuco</option>
                                    <option value="PI">Piauí</option>
                                    <option value="RJ">Rio de Janeiro</option>
                                    <option value="RN">Rio Grande do Norte</option>
                                    <option value="RS">Rio Grande do Sul</option>
                                    <option value="RO">Rondônia</option>
                                    <option value="RR">Roraima</option>
                                    <option value="SC">Santa Catarina</option>
                                    <option value="SP">São Paulo</option>
                                    <option value="SE">Sergipe</option>
                                    <option value="TO">Tocantins</option>
                                </select>
                            </div>
                            <div class="form-group col-md-2">
                                <input name="TxtCep" type="text" class="form-control" id="inputCEP" value="<%= Cep%>">
                            </div>
                        </div>
                        <br>
                        <h5>Conhecimentos Tecnicos</h5>
                            <table style="width:50%">
                                <tr>
                                  <td><label><input name="CkboJava" type="checkbox" value="Java">Java</label></td>
                                  <td><label><input name="CkboPHP" type="checkbox" value="PHP">PHP</label></td>
                                  <td><label><input name="CkboPerl" type="checkbox" value="Perl">Perl</label></td>
                                  <td><label><input name="CkboC" type="checkbox" value="C">C</label></td>
                                  <td><label><input name="CkboObjective-C" type="checkbox" value="Objective-C">Objective-C</label></td>
                                </tr>
                                <tr>
                                  <td><label><input name="CkboJavaScript" type="checkbox" value="JavaScript">JavaScript</label></td>
                                  <td><label><input name="CkboVisualBasic" type="checkbox" value="VisualBasic">Visual Basic</label></td>
                                  <td><label><input name="CkboRuby" type="checkbox" value="Ruby">Ruby</label></td>
                                  <td><label><input name="CkboPython" type="checkbox" value="Python">Python</label></td>
                                  <td><label><input name="CkboCSS" type="checkbox" value="CSS">CSS</label></td>
                                </tr>
                                <tr>
                                  <td><label><input name="CkboHTML" type="checkbox" value="HTML">HTML</label></td>
                                  <td><label><input name="CkboC++" type="checkbox" value="C++">C++</label></td>
                                  <td><label><input name="CkboC#" type="checkbox" value="C#">C#</label></td>
                                  <td><label><input name="CkboMATLAB" type="checkbox" value="MATLAB">MATLAB</label></td>
                                  <td><label><input name="CkboLUA" type="checkbox" value="LUA">LUA</label></td>
                                </tr>
                              </table>
                        <br>
                        <br>
                        <br>
                        <div class="form-group">
                            <label class="col-md-2 control-label" for="Register"></label>
                            <div class="col-md-8">
                                <button id="Register" value="Inserir" name="btnOperacao" class="btn btn-primary" type="Submit">Alterar</button>
                                <button type="submit" value="Pesquisar" name="btnOperacao" class="btn btn-secondary" type="Submit">Cancelar</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
    </body>
</html>
