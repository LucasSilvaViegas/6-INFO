<%@page import="java.math.BigDecimal"%>
<%@page import="util.EnviarEmail"%>
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
<%@page import="java.io.OutputStream"%>
<%@page import="org.jrimum.bopepo.Boleto"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.Titulo.EnumAceite"%>
<%@page import="org.jrimum.domkee.financeiro.banco.febraban.TipoDeTitulo"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.VendaDAO"%>
<%@page import="modelo.Venda"%>
<%@page import="modelo.ItemvendaPK"%>
<%@page import="modelo.Itemvenda"%>
<%@page import="dao.ItemvendaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Produto"%>
<%@page import="modelo.Itemcarrinho"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Carrinho"%>
<%@include file="cabecalho.jsp"%>


<%    Cliente c;

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
            Cedente cedente = new Cedente("PROJETO JRimum", "00.000.208/0001-00");

            /*
                 * INFORMANDO DADOS SOBRE O SACADO.
             */
            Sacado sacado = new Sacado("JavaDeveloper Pronto Para Férias", "222.222.222-22");

            // Informando o endereço do sacado.
            Endereco enderecoSac = new Endereco();
            enderecoSac.setUF(UnidadeFederativa.RN);
            enderecoSac.setLocalidade("Natal");
            enderecoSac.setCep(new CEP("59064-120"));
            enderecoSac.setBairro("Grande Centro");
            enderecoSac.setLogradouro("Rua poeta dos programas");
            enderecoSac.setNumero("1");
            sacado.addEndereco(enderecoSac);

            /*
                 * INFORMANDO DADOS SOBRE O SACADOR AVALISTA.
             */
            SacadorAvalista sacadorAvalista = new SacadorAvalista("JRimum Enterprise", "00.000.000/0001-91");

            // Informando o endereço do sacador avalista.
            Endereco enderecoSacAval = new Endereco();
            enderecoSacAval.setUF(UnidadeFederativa.DF);
            enderecoSacAval.setLocalidade("Brasília");
            enderecoSacAval.setCep(new CEP("59000-000"));
            enderecoSacAval.setBairro("Grande Centro");
            enderecoSacAval.setLogradouro("Rua Eternamente Principal");
            enderecoSacAval.setNumero("001");
            sacadorAvalista.addEndereco(enderecoSacAval);

            /*
                 * INFORMANDO OS DADOS SOBRE O TÍTULO.
             */
            // Informando dados sobre a conta bancária do título.
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

            boleto.setLocalPagamento("Pagável preferencialmente na Rede X ou em "
                    + "qualquer Banco até o Vencimento.");
            boleto.setInstrucaoAoSacado("Senhor sacado, sabemos sim que o valor "
                    + "cobrado não é o esperado, aproveite o DESCONTÃO!");
            boleto.setInstrucao1("PARA PAGAMENTO 1 até Hoje não cobrar nada!");
            boleto.setInstrucao2("PARA PAGAMENTO 2 até Amanhã Não cobre!");
            boleto.setInstrucao3("PARA PAGAMENTO 3 até Depois de amanhã, OK, não cobre.");
            boleto.setInstrucao4("PARA PAGAMENTO 4 até 04/xx/xxxx de 4 dias atrás COBRAR O VALOR DE: R$ 01,00");
            boleto.setInstrucao5("PARA PAGAMENTO 5 até 05/xx/xxxx COBRAR O VALOR DE: R$ 02,00");
            boleto.setInstrucao6("PARA PAGAMENTO 6 até 06/xx/xxxx COBRAR O VALOR DE: R$ 03,00");
            boleto.setInstrucao7("PARA PAGAMENTO 7 até xx/xx/xxxx COBRAR O VALOR QUE VOCÊ QUISER!");
            boleto.setInstrucao8("APÓS o Vencimento, Pagável Somente na Rede X.");

            /*
                 * GERANDO O BOLETO BANCÁRIO.
             */
            // Instanciando um objeto "BoletoViewer", classe responsável pela
            // geração do boleto bancário.
            BoletoViewer boletoViewer = new BoletoViewer(boleto);

            session.setAttribute("boleto", boletoViewer);

            if (request.getMethod().equals("POST")) {
                EnviarEmail enviar = new EnviarEmail();
                enviar.setEmailDestinatario("SEU EMAIL");
                enviar.setAssunto("Contato - AgroSoftware");
                //uso StringBuffer para otimizar a concatenação 
                //de string
                StringBuffer texto = new StringBuffer();
                texto.append("<h2 align='center'>AgroSoftware</h2>");
                texto.append("Informações Enviadas:<br/>");
                texto.append("Software: AAAAA");

                enviar.setMsg(texto.toString());

                boolean enviou = enviar.enviarHotmail();

            }

            out.print("DEU CERTO!");
            
            session.setAttribute("carrinho", null);

            %>
            
            <a href="boleto.jsp">Boleto</a>
            
            <%
            
        }

%>


<h1>FINALIZAR COMPRA</h1>

<!--DADOS DO CLIENTE-->
<%=c.getNome()%>, <%=c.getEndereco()%>, <%=c.getBairro()%>, <%=c.getCidade()%>, <%=c.getEstado()%>, <%=c.getCep()%>.<br/>


<!--LISTAR PRODUTOS-->
<%
    if (carrinho.getItens() != null) {
        for (Itemcarrinho item : carrinho.getItens()) {
            Double kk = (item.getProduto().getPreco().doubleValue() * item.getQuantidade());
%>


<img src="../fotos/<%=item.getProduto().getImagem1()%>" class="img-responsive" alt=""/>

<p>Nome : <%=item.getProduto().getTitulo()%> </p>
<p>Qty : <%=item.getQuantidade()%></p>
<p>Price each : $<%=item.getProduto().getPreco()%></p>
<p>Price total : $<%=kk%></p>
<p>Descrição : <%=item.getProduto().getDescricao()%></p>

<h1 class="continue">Price total da compra: $<%=carrinho.getTotal()%></h1>
<%
        }
    }
%>



<a class="order" href="finalizarLIVE.jsp?final=true">Finalizar a compra</a>


<%
    }
%>


<%@include file="rodape.jsp"%>
