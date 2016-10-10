<%@include file="../cabecalho.jsp"%>
        <div>
            <h1>Cadastro de Jogador</h1>
            
            <div>
                
                <form action="add-ok.jsp" id="formCadastro" name="formulario" onsubmit="return validarSenha(this);" method="post">
                    
                    <label>Nome:</label><input type="text" name="txtNome" placeholder="Insira o Nome de Login" required/><br />
                    <label>Email:</label><input type="email" name="Email" placeholder="Insira o Email" required/><br />


                    <label for="txtSenha">Senha</label>
                    <input id="txtSenha" type="password" required placeholder="Digite uma Senha" title="Senha" />
                    <br/><label for="repetir_senha">Confirmar Senha</label>
                    <input id="repetir_senha" name="repetir_senha" type="password" title="Repetir Senha" />
                    
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