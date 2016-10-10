<%@page import="modelo.Jogador"%>
<%@page import="dao.JogadorDAO"%>
<%
    if(request.getParameter("txtNome")==null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    //BUSCAR O OBJETO A PARTIR DA CHAVE PRIMÁRIA E EXIBIR AS INFORMAÇOES DO OBJETO NO FORMULARIO
    
    JogadorDAO dao = new JogadorDAO();
    Jogador obj = new Jogador();

    obj = dao.buscarPorChavePrimaria(request.getParameter("txtNome"));
    
    %>

<%@include file="../cabecalho.jsp"%>

        <div>
            <h1>Alteração de Jogador</h1>
            
            <div>
                
                <form action="upd-ok.jsp" id="formCadastro" name="formulario" onsubmit="return validarSenha(this);" action="" method="post">
                    
                    <label>Código</label><input type="text" 
                                               value="<%=obj.getLogin()%>" name="txtNome" readonly/><br/>
                    <label>Nome:</label><input type="text" 
                                               value="<%=obj.getEmail()%>" name="Email" /><br />
                  

                    <label for="txtSenha">Senha</label>
                    <input id="txtSenha" value="<%=obj.getSenha()%>" type="password" required placeholder="Digite uma Senha" title="Senha" />
                  
                    <br/><label for="repetir_senha">Confirmar Senha</label>
                    <input id="repetir_senha" name="repetir_senha" type="password" required  placeholder="Repetir Senha" title="Repetir Senha" />
                    
                    <br/><input type="reset" value="Limpar" />
                    <input type="submit" value="Salvar" />
	            <a href="index.jsp">Voltar<a> 
                <br/><br/> </form> 
            </div>
        </div>
    </body>
</html>

<script>
function validarSenha(form){ 
	senha = document.formulario.senha.value;
	senhaRepetida = document.formulario.repetir_senha.value;
	if (senha != senhaRepetida){
		alert("Repita a senha corretamente");
		document.formulario.repetir_senha.focus();	
		return false;
	}
}
</script>