<%@include file="../cabecalho.jsp"%>
        <div>
            <h1 class="centro">Cadastro de Editora</h1>
            
            <div>
                
                <form action="add-ok.jsp" method="post">
                    <label>Nome:</label><input type="text" name="txtNome" placeholder="Insira o nome" required/><br />
                    <label>Data de Fundação:</label><input type="date" name="DataF" placeholder="Insira a data" required/><br />
                    <input type="reset" value="Limpar" />
                    <input type="submit" value="Salvar" />
                    <br/><br/>
                </form>
            </div>
        </div>


        

    </body>
</html>
