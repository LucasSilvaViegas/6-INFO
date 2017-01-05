<%@page import="util.Criptografia"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@include file="cabecalho.jsp" %>
<%    
    String msg =  "Olá!";
    ClienteDAO dao = new ClienteDAO();
    Cliente obj = new Cliente();
    if(request.getMethod().equals("POST")){
        obj.setNome(request.getParameter("txtNome"));
        obj.setEmail(request.getParameter("txtEmail"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        obj.setBairro(request.getParameter("txtBairro"));
        obj.setCidade(request.getParameter("txtCidade"));
        obj.setEstado(request.getParameter("txtUF"));
        obj.setCep(request.getParameter("txtCEP"));
        obj.setEndereco(request.getParameter("txtEndereco"));
        dao.incluir(obj);
        msg = "Gravado com sucesso!";
        
    }
%>
<div class="content">
    
     <div class="alert alert-success">
                <%=msg%>
            </div>
    <!-- registration -->
    <div class="main-1">
        <div class="container">
            <div class="register">
                <p class="register-top-grid"> * = Informações obrigatórias</p><br>
                <form method="POST"> 
                    <div class="register-top-grid">
                        <h3>Informações de Usuário</h3>
                        <div class="wow fadeInLeft" data-wow-delay="0.4s">
                            <span>Nome<label>*</label></span>
                            <input type="text" name="txtNome"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>E-mail<label>*</label></span>
                            <input type="text" name="txtEmail"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Senha<label>*</label></span>
                            <input type="password" name="txtSenha"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Endereço<label>*</label></span>
                            <input type="text" name="txtEndereco"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Bairro<label>*</label></span>
                            <input type="text" name="txtBairro"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Cidade<label>*</label></span>
                            <input type="text" name="txtCidade"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>UF<label>*</label></span>
                            <input type="text" maxlength="2" name="txtUF"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>CEP<label>*</label></span>
                            <input type="text"  maxlength="9" name="txtCEP"> 
                        </div>
                    </div>
                  
               
                <div class="clearfix"> </div>
                <div class="register-but">
                
                        <input type="submit" value="submit">
                        <div class="clearfix"> </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="rodape.jsp" %>