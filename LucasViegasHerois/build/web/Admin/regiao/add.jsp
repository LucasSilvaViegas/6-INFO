<%@include file="../cabecalho.jsp"%>
        <div>
            <h1 class="centro">Cadastro de Regi�o</h1>
            
            <div>
                
                <form action="add-ok.jsp" method="post">
                    <label>Nome:</label><input type="text" name="txtNome" placeholder="Insira o nome" required/><br />
                    <label>Descri��o:</label><input type="text" name="Desc" placeholder="Insira a descri��o" required/><br />
                    <input type="reset" value="Limpar" />
                    <input type="submit" value="Salvar" />
                    <br/><br/>
                </form>
            </div>
        </div>


        

    </body>
</html>
