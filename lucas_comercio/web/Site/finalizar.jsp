<%@page import="util.EnviarEmail"%>
<%@page import="java.io.OutputStream"%>
<%@page import="org.jrimum.bopepo.Boleto"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.Titulo.EnumAceite"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.TipoDeTitulo"%>
<%@page import="java.sql.Date"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.Titulo"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.Agencia"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.Carteira"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.NumeroDaConta"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.ContaBancaria"%>
<%@page import="org.jrimum.bopepo.BancosSuportados"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.SacadorAvalista"%>
<%@page import="org.jrimum.domkee.comum.pessoa.endereco.CEP"%>
<%@page import="org.jrimum.domkee.comum.pessoa.endereco.UnidadeFederativa"%>
<%@page import="org.jrimum.domkee.comum.pessoa.endereco.Endereco"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.Sacado"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.Cedente"%>
<%@page import="java.io.File"%>
<%@page import="org.jrimum.bopepo.view.BoletoViewer"%>
<%@page import="dao.VendaDAO"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.ItemvendaDAO"%>
<%@page import="modelo.ItemvendaPK"%>
<%@page import="modelo.Status"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Carrinho"%>
<%@page import="modelo.Cliente"%>
<%@page import="modelo.Itemcarrinho"%>
<%@include file="cabecalho.jsp"%>

<%    Cliente c;
    String mensagemUsuario = null;

    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    } else {

        c = ((Cliente) session.getAttribute("usuario"));
        Carrinho carrinho = null;

        if (session.getAttribute("carrinho") == null) {
            response.sendRedirect("index.jsp");
        } else {
            carrinho = (Carrinho) session.getAttribute("carrinho");

        }

        if (request.getParameter("final") != null && request.getParameter("final").equals("true")) {

            Venda venda = new Venda();
            VendaDAO vendadao = new VendaDAO();

            //Set venda total
            venda.setCodcliente(c.getCodigo());
            venda.setDatavenda(Date.valueOf(LocalDate.now()));
            venda.setTotal(carrinho.getTotal());
            venda.setCodstatus(1);
            vendadao.incluir(venda);

            //Set venda de cada produto
            ItemvendaDAO itemvendadao = new ItemvendaDAO();

            for (Itemcarrinho item : carrinho.getItens()) {

                Itemvenda L = new Itemvenda();

                L.setItemvendaPK(new ItemvendaPK(venda.getCodigo(), item.getProduto().getCodigo()));

                L.setProduto(item.getProduto());
                L.setQuant(item.getQuantidade());
                L.setPreco(item.getProduto().getPreco().doubleValue());
                L.setVenda(venda);

                itemvendadao.incluir(L);
            }
            /*
                 * INFORMANDO DADOS SOBRE O CEDENTE.
             */
            Cedente cedente = new Cedente("GameStop", "00.000.208/0001-00");

            /*
                 * INFORMANDO DADOS SOBRE O SACADO.
             */
            Sacado sacado = new Sacado("JavaDeveloper Pronto Para F�rias", "222.222.222-22");

            // Informando o endere�o do sacado.
            Endereco enderecoSac = new Endereco();
            enderecoSac.setUF(UnidadeFederativa.RN);
            enderecoSac.setLocalidade("Bag�");
            enderecoSac.setCep(new CEP("59064-120"));
            enderecoSac.setBairro("Grande Centro");
            enderecoSac.setLogradouro("Rua poeta dos programas");
            enderecoSac.setNumero("1");
            sacado.addEndereco(enderecoSac);

            /*
                 * INFORMANDO DADOS SOBRE O SACADOR AVALISTA.
             */
            SacadorAvalista sacadorAvalista = new SacadorAvalista("JRimum Enterprise", "00.000.000/0001-91");

            // Informando o endere�o do sacador avalista.
            Endereco enderecoSacAval = new Endereco();
            enderecoSacAval.setUF(UnidadeFederativa.DF);
            enderecoSacAval.setLocalidade("Bras�lia");
            enderecoSacAval.setCep(new CEP("59000-000"));
            enderecoSacAval.setBairro("Grande Centro");
            enderecoSacAval.setLogradouro("Rua Eternamente Principal");
            enderecoSacAval.setNumero("001");
            sacadorAvalista.addEndereco(enderecoSacAval);

            /*
                 * INFORMANDO OS DADOS SOBRE O T�TULO.
             */
            // Informando dados sobre a conta banc�ria do t�tulo.
            ContaBancaria contaBancaria = new ContaBancaria(BancosSuportados.BANCO_BRADESCO.create());
            contaBancaria.setNumeroDaConta(new NumeroDaConta(123456, "0"));
            contaBancaria.setCarteira(new Carteira(30));
            contaBancaria.setAgencia(new Agencia(1234, "1"));

            Titulo titulo = new Titulo(contaBancaria, sacado, cedente, sacadorAvalista);
            titulo.setNumeroDoDocumento("123456");
            titulo.setNossoNumero("99345678912");
            titulo.setDigitoDoNossoNumero("5");
            titulo.setValor(BigDecimal.valueOf(0.23));
            titulo.setDataDoDocumento(Date.valueOf(LocalDate.now()));
            titulo.setDataDoVencimento(Date.valueOf(LocalDate.now()));
            titulo.setTipoDeDocumento(TipoDeTitulo.DM_DUPLICATA_MERCANTIL);
            titulo.setAceite(EnumAceite.A);
            titulo.setDesconto(new BigDecimal(0.05));
            titulo.setDeducao(BigDecimal.ZERO);
            titulo.setMora(BigDecimal.ZERO);
            titulo.setAcrecimo(BigDecimal.ZERO);
            titulo.setValorCobrado(BigDecimal.ZERO);

            /*
                 * INFORMANDO OS DADOS SOBRE O BOLETO.
             */
            Boleto boleto = new Boleto(titulo);

            boleto.setLocalPagamento("Pag�vel preferencialmente na Rede X ou em "
                    + "qualquer Banco at� o Vencimento.");
            boleto.setInstrucaoAoSacado("Senhor sacado, sabemos sim que o valor "
                    + "cobrado n�o � o esperado, aproveite o DESCONT�O!");
            boleto.setInstrucao1("PARA PAGAMENTO 1 at� Hoje n�o cobrar nada!");
            boleto.setInstrucao2("PARA PAGAMENTO 2 at� Amanh� N�o cobre!");
            boleto.setInstrucao3("PARA PAGAMENTO 3 at� Depois de amanh�, OK, n�o cobre.");
            boleto.setInstrucao4("PARA PAGAMENTO 4 at� 04/xx/xxxx de 4 dias atr�s COBRAR O VALOR DE: R$ 01,00");
            boleto.setInstrucao5("PARA PAGAMENTO 5 at� 05/xx/xxxx COBRAR O VALOR DE: R$ 02,00");
            boleto.setInstrucao6("PARA PAGAMENTO 6 at� 06/xx/xxxx COBRAR O VALOR DE: R$ 03,00");
            boleto.setInstrucao7("PARA PAGAMENTO 7 at� xx/xx/xxxx COBRAR O VALOR QUE VOC� QUISER!");
            boleto.setInstrucao8("AP�S o Vencimento, Pag�vel Somente na Rede X.");

            /*
                 * GERANDO O BOLETO BANC�RIO.
             */
            // Instanciando um objeto "BoletoViewer", classe respons�vel pela
            // gera��o do boleto banc�rio.
            BoletoViewer boletoViewer = new BoletoViewer(boleto);

            session.setAttribute("boleto", boletoViewer);

            EnviarEmail enviar = new EnviarEmail();
            enviar.setEmailDestinatario(c.getEmail().toString());
            enviar.setAssunto("Voc� comprou na GameStop");
            //uso StringBuffer para otimizar a concatena��o 
            //de string
            StringBuffer texto = new StringBuffer();
            texto.append("<h2 align='center'>GAMESTOP</h2>");
            texto.append("Informa��es Enviadas:<br/>");
            texto.append("Software: ");
            texto.append("TROLLEI");
            enviar.setMsg(texto.toString());
            
            boolean enviou = enviar.enviarGmail();
            if (enviou) {

                mensagemUsuario = "Dados enviados com sucesso";

            } else {
                mensagemUsuario = "N�o foi enviar as informa��es";

            }
            
            session.setAttribute("carrinho", null);


%>
<div class="header-end">
    <div class="container">
        <div class="pull-center styl-hdn">
            <h2 class="order">Um email foi enviado para a confirma��o da compra. <br/>
                Obrigado por Comprar na GAMESTOP!
                Pegue aqui o seu <a href="boleto.jsp">Boleto</a>.</h2>
        </div>
    </div>
</div>
<%            } else {
%>


<!-- check-out -->
<div class="check">
    <div class="container">	 
        <div class="col-md-9 cart-items">
            <h1>FINALIZAR COMPRA</h1>
            <span>A ser enviado para <%=c.getNome()%>. <br/>
                ENDERE�O: <%=c.getEndereco()%>, <%=c.getBairro()%>, <%=c.getCidade()%>, <%=c.getEstado()%>. <br/>
                CEP <%=c.getCep()%>.<br/>
            </span>
            <%
                if (carrinho.getItens() != null) {
                    for (Itemcarrinho item : carrinho.getItens()) {
                        Double kk = (item.getProduto().getPreco().doubleValue() * item.getQuantidade());
            %>
            <br/>
            <br/>
            <div class="cart-header">
                <div class="cart-sec simpleCart_shelfItem">
                    <div class="cart-item cyc">
                        <img src="../fotos/<%=item.getProduto().getImagem1()%>" class="img-responsive" alt=""/>
                    </div>
                    <div class="cart-item-info">
                        <ul class="qty">
                            <li><p>Nome : <%=item.getProduto().getTitulo()%> </p></li>
                            <li><p>Qty : <%=item.getQuantidade()%></p></li>
                            <li><p>Price each : $<%=item.getProduto().getPreco()%></p></li>
                            <li><p>Price total : $<%=kk%></p></li>
                        </ul>
                        <div class="delivery">
                            <span><%=item.getProduto().getDescricao()%></span>
                            <div class="clearfix"></div>
                        </div>	
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div><%}
                }%>
        </div>
        <div class="delivery">
        </div>
        <div class="col-md-3 cart-total">
            <h1 class="continue">Price total : $<%=carrinho.getTotal()%></h1>
            <a class="order" href="finalizar.jsp?final=true">Finalizar a compra</a>
        </div>
        <div class="clearfix"> </div>
    </div>
</div><%}
    }%>
<%@include file="rodape.jsp"%>
