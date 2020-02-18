<%-- 
    Document   : CadAlunoControl
    Created on : 09/11/2019, 12:50:33
    Author     : alunoandroid
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/CadAluno.css" rel="stylesheet" type="text/css"/>
        <title>Tickware</title>
    </head>
    <body>
        <h1>Cadastro do Programador - Control</h1>

        <%
            String strIdProgramador;
            strIdProgramador = request.getParameter("txtIdProgramador");
            int idProgramador;
            
            if (strIdProgramador != null && strIdProgramador.trim().isEmpty() == false) {
                idProgramador = Integer.parseInt(strIdProgramador);
            } else {
                idProgramador = 0;
            }
            
            String Email, Nome, Sobrenome, Endereco, Telefone ,Cidade, Estado, Cep;

            String linguagemJava, linguagemPHP, linguagemPerl, linguagemC, linguagemObjective, linguagemJavaScript, linguagemVisualBasic, linguagemRuby, linguagemPython, linguagemCSS, linguagemHTML ,linguagemCplusPlus, linguagemCSharp, linguagemMATLAB, linguagemLUA;
            
            String operacao;
            String todasLinguagens;
            
            Email = request.getParameter("txtEmail");
            Nome = request.getParameter("txtNome");
            Sobrenome = request.getParameter("TxtSobrenome");
            Endereco = request.getParameter("txtEndereco");
            Telefone = request.getParameter("txtTelefone");
            Cidade = request.getParameter("TxtCidade");
            Estado = request.getParameter("OptEstado");
            Cep = request.getParameter("TxtCep");
 
 
            linguagemJava = request.getParameter("CkboJava");
            linguagemPHP = request.getParameter("CkboPHP");
            linguagemPerl = request.getParameter("CkboPerl");
            linguagemC = request.getParameter("CkboC");
            linguagemObjective = request.getParameter("CkboObjective-C");
            linguagemJavaScript = request.getParameter("CkboJavaScript");
            linguagemVisualBasic = request.getParameter("CkboVisualBasic");
            linguagemRuby = request.getParameter("CkboRuby");
            linguagemPython = request.getParameter("CkboPython");
            linguagemCSS = request.getParameter("CkboCSS");
            linguagemHTML = request.getParameter("CkboHTML");
            linguagemCplusPlus = request.getParameter("CkboC++");
            linguagemCSharp = request.getParameter("CkboC#");
            linguagemMATLAB = request.getParameter("CkboMATLAB");
            linguagemLUA = request.getParameter("CkboLUA");
            
            if(linguagemJava == null)
                linguagemJava = "";
            if(linguagemPHP == null)
                linguagemPHP = "";
            if(linguagemPerl == null)
                linguagemPerl = "";
            if(linguagemC == null)
                linguagemC = "";
            if(linguagemObjective == null)
                linguagemObjective = "";
            if(linguagemJavaScript == null)
                linguagemJavaScript = "";
            if(linguagemVisualBasic == null)
                linguagemVisualBasic = "";
            if(linguagemVisualBasic == null)
                linguagemVisualBasic = "";
            if(linguagemPython == null)
                linguagemPython = "";
            if(linguagemRuby == null)
                linguagemRuby = "";
            if(linguagemCSS == null)
                linguagemCSS = "";
            if(linguagemHTML == null)
                linguagemHTML = "";
            if(linguagemCplusPlus == null)
                linguagemCplusPlus = "";
            if(linguagemCSharp == null)
                linguagemCSharp = "";
            if(linguagemMATLAB == null)
                linguagemMATLAB = "";
            if(linguagemLUA == null)
                linguagemLUA = "";
            
            todasLinguagens = linguagemJava + " " + linguagemPHP + " " + linguagemPerl +"<br>" + linguagemC + " " + linguagemObjective + " " + linguagemJavaScript + "<br>" + linguagemVisualBasic + " " + linguagemRuby + " " + linguagemPython + "<br>" + linguagemCSS + " " + linguagemHTML + " " + linguagemCplusPlus + "<br>" + linguagemCSharp + " " + linguagemMATLAB + " " + linguagemLUA + "<br>";
            
            operacao = request.getParameter("btnOperacao");
            
            //out.print("View :: todasLinguagens " + todasLinguagens + "<br>");
            //out.print("View :: Nome " + Nome + "<br>");
            //out.print("View :: Sobrenome " + Sobrenome + "<br>");
            //out.print("View :: Endereco " + Endereco + "<br>");
            //out.print("View :: Telefone " + Telefone + "<br>");
            //out.print("View :: Cidade " + Cidade + "<br>");
            //out.print("View :: Estado " + Estado + "<br>");
            //out.print("View :: Cep " + Cep + "<br>");
            //out.print("View :: linguagemJava " + linguagemJava + "<br>");
            //out.print("View :: linguagemPHP " + linguagemPHP + "<br>");
            //out.print("View :: linguagemPerl " + linguagemPerl + "<br>");
            //out.print("View :: linguagemC " + linguagemC + "<br>");
            //out.print("View :: linguagemObjective " + linguagemObjective + "<br>");
            //out.print("View :: linguagemJavaScript " + linguagemJavaScript + "<br>");
            //out.print("View :: linguagemVisualBasic " + linguagemVisualBasic + "<br>");
            //out.print("View :: linguagemRuby " + linguagemRuby + "<br>");
            //out.print("View :: linguagemPython " + linguagemPython + "<br>");
            //out.print("View :: linguagemCSS " + linguagemCSS + "<br>");
            //out.print("View :: linguagemHTML " + linguagemHTML + "<br>");
            //out.print("View :: linguagemCplusPlus " + linguagemCplusPlus + "<br>");
            //out.print("View :: linguagemCSharp " + linguagemCSharp + "<br>");
            //out.print("View :: linguagemMATLAB " + linguagemMATLAB + "<br>");
            //out.print("View :: linguagemLUA " + linguagemLUA + "<br>");
            
            //=======================================================
            //          PERSISTÊNCIA DOS DADOS DO PROGRAMADOR
            //=======================================================
            Connection o_ConexaoBD;
            PreparedStatement cmdSQL;
            ResultSet rsProgramador;

            String Banco = "jdbc:postgresql://localhost:5432/tickware";
            String Usuario = "postgres";
            String Senha = "postgre";

            out.println("<br><br>");

            try {
                //Registra o driver JDBC do postgreSQL
                Class.forName("org.postgresql.Driver");
                //out.println("Driver carregado com sucesso!<br>");

                o_ConexaoBD = DriverManager.getConnection(Banco, Usuario, Senha);
                //out.println("Conexão efetuada com sucesso!<br>");
                
                //=============================================
                //                  INSERIR
                //=============================================
                if (operacao.equals("Inserir")) {

                    // cmdSQL = o_ConexaoBD.prepareStatement("Insert into Aluno(Nome, Media) 
                    //                                        values('José', 8.5)");
                    cmdSQL = o_ConexaoBD.prepareStatement("Insert into programador (email, nome, sobrenome, endereco, telefone, cidade, estado, cep, linguagem)"
                    + "values('"+Email+"', '"+Nome+"', '"+Sobrenome+"', '"+Endereco+"', '"+Telefone+"', '"+Cidade+"', '"+Estado+"', '"+Cep+"', '"+todasLinguagens+"')");
                    cmdSQL.executeUpdate();
                    

                    out.println("<br>================================<br>");
                    out.println("Dados inseridos com sucesso!");
                    out.println("<br>================================<br>");

                    RequestDispatcher o_ReqDispInserir = request.getRequestDispatcher("cadProgramadorInserir.jsp");
                    o_ReqDispInserir.forward(request, response);

                }
                
                //=============================================
                //                 ALTERAR
                //=============================================
                if (operacao.equals("Alterar")) {

                    //cmdSQL = o_ConexaoBD.prepareStatement("Update Programador Set nome = 'xxx', 
                    //                                       media = 0 Where IDProgramador = 0");
                    cmdSQL = o_ConexaoBD.prepareStatement("Update programador Set nome = '"
                            + Nome + "', sobrenome = " + Sobrenome
                            + " Where idprogramador = " + idProgramador);

                    cmdSQL.executeUpdate();

                    out.println("<br>================================<br>");
                    out.println("Dados alterados com sucesso!");
                    out.println("<br>================================<br>");

                }
                
                //=============================================
                //                 EXCLUIR
                //=============================================
                if (operacao.equals("Excluir")) {

                    //cmdSQL = o_ConexaoBD.prepareStatement("Delete From Aluno 
                    //                                       Where IDAluno = 0");
                    cmdSQL = o_ConexaoBD.prepareStatement("Delete From programador "
                            + "Where idprogramador = " + idProgramador);

                    cmdSQL.executeUpdate();

                    out.println("<br>================================<br>");
                    out.println("Dados excluídos com sucesso!");
                    out.println("<br>================================<br>");

                }

                o_ConexaoBD.close();
                out.println("Fim da conexão<br>");

                        
                //=============================================
                //  REENVIA PARA A PÁGINA PRINCIPAL (INSERIR)
                //=============================================
                response.sendRedirect("cadProgramadorInserir.jsp");
                
                
            } catch (SQLException ex) {
                out.println("Erro de banco: " + ex);

            } catch (Exception ex) {
                out.println("Erro genérico " + ex);
            }
        %>
    </body>
</html>
