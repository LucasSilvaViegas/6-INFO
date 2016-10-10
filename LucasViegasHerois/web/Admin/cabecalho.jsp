<%
  if(session.getAttribute("usuario") == null){
      response.sendRedirect("../login.jsp");
      return;
  }  
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="../style.css" />
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Sistema Heróis</title>
        <link rel="stylesheet" href="../estilo.css" />
    </head>
    <body>
        
        <h1> <font color = "green"> SUPER HERÓIS!</h1>
        <div style="text-align: center"> Bem vindo <span> <%=session.getAttribute("usuario")%> </span>
            <br/><a href ="../logoff.jsp">SAIR</a>
        </div>
        <p>
            <a href="../categoria"> Categoria</a> - 
            <a href="../equipe"> Equipe</a> - 
            <a href="../regiao"> Região</a> -  
            <a href="../jogador"> Jogador</a> -  
            <a href="../editora"> Editora</a> -  
            <a href="../heroi"> Herói</a>
            <a href="../../Site/index.jsp"> HOME</a>
        </p>