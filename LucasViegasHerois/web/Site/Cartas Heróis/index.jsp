<%@page import="java.util.List"%>
<%@page import="modelo.Heroi"%>
<%@page import="dao.HeroiDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <script src="jquery-2.2.4.min.js"></script>
    </head>
    <body align="center" onload="inicia();">

        <section>
            <div id="divCartasVermelhas" onclick="if (cartaVirada == false) {
                        apareceVermelho();
                    }">

                <div id="nomeVermelho"></div>
                <div id="caracteristicasVermelho">
                    <div id="caracteristicasVermelhoInteligencia" onclick="inteligencia();cartaVirada = true;">	</div>

                    <div id="caracteristicasVermelhoForca" onclick="forca();cartaVirada = true;"></div>

                    <div id="caracteristicasVermelhoVelocidade" onclick="velocidade();cartaVirada = true;">	</div>

                    <div id="caracteristicasVermelhoResistencia" onclick="resistencia();cartaVirada = true;">	</div>
                </div>
            </div>

            <div id="divCartasAzuis">

                <div id="nomeAzul"></div>
                <div id="caracteristicasAzuis">
                    <div id="caracteristicasAzulInteligencia"></div>

                    <div id="caracteristicasAzulForca"></div>

                    <div id="caracteristicasAzulVelocidade"></div>

                    <div id="caracteristicasAzulResistencia"></div>
                </div>
            </div>

        </section>

        <button id="btnJogarDnv" style="display:none;margin-top:400px;" onclick="jogadnv()" align="center">Jogar Novamente</button>

        <script>
            var divCartasVermelhas = document.getElementById("divCartasVermelhas");
            var nomeVermelho = document.getElementById("nomeVermelho");
            var caracteristicasVermelho = document.getElementById("caracteristicasVermelho");
            var caracteristicasVermelhoInteligencia = document.getElementById("caracteristicasVermelhoInteligencia");
            var caracteristicasVermelhoForca = document.getElementById("caracteristicasVermelhoForca");
            var caracteristicasVermelhoVelocidade = document.getElementById("caracteristicasVermelhoVelocidade");
            var caracteristicasVermelhoResistencia = document.getElementById("caracteristicasVermelhoResistencia");

            var divCartasAzuis = document.getElementById("divCartasAzuis");
            var nomeAzul = document.getElementById("nomeAzul");
            var caracteristicasAzuis = document.getElementById("caracteristicasAzuis");
            var caracteristicasAzulInteligencia = document.getElementById("caracteristicasAzulInteligencia");
            var caracteristicasAzulForca = document.getElementById("caracteristicasAzulForca");
            var caracteristicasAzulVelocidade = document.getElementById("caracteristicasAzulVelocidade");
            var caracteristicasAzulResistencia = document.getElementById("caracteristicasAzulResistencia")

            var baralhoVermelho = Array();
            var baralhoAzul = Array();
            var temp, tempVelha;

            var cartaVirada = false;
            var intervalo;

            var cemiterioVermelho = Array();
            var cemiterioAzul = Array();

            var maiorQualidadeAzul;

            var btnJogarDnv = document.getElementById("btnJogarDnv");

            //Baralho principal com todas as cartas que logo vai ser cortado separando
            var cartasArray;

            function inicia() {
                cartasArray = Array(       
        <%
            HeroiDAO dao = new HeroiDAO();
            List<Heroi> lista;
            lista = dao.listarRandom();

           for(int i=0;i<lista.size();i++)  {
               Heroi hero = lista.get(i);
        %>
       
                {
                    nome: "<%=hero.getNome()%>",
                    inteligencia: <%=hero.getInteligencia()%>,
                    forca: <%=hero.getForca()%>,
                    velocidade: <%=hero.getVelocidade()%>,
                    resistencia: <%=hero.getResistencia()%>,
                    imagem: '../../fotos/<%=hero.getFoto()%>'
                }
                        
            <%
                if(i != lista.size() - 1)
                {
                out.print(",");
                }
       }

            %>

                );
                //Variável temporaria que armazena um numero aleatório de 0-tamanho do array
                temp = Math.floor((Math.random() * cartasArray.length));
                tempVelha = temp;
                //Separação de cartas loop vermelho
                for (var i = 0; i < cartasArray.length * 2; i++) {
                    while (temp == tempVelha) {
                        temp = Math.floor((Math.random() * cartasArray.length));
                    }
                    tempVelha = temp;
                    baralhoVermelho.push(cartasArray[temp]);
                    cartasArray.splice(temp, 1);
                    while (temp == tempVelha) {
                        temp = Math.floor((Math.random() * cartasArray.length));
                    }
                    tempVelha = temp;
                    baralhoAzul.push(cartasArray[temp]);
                    cartasArray.splice(temp, 1);
                }

                for (var i = 0; i < cartasArray.length; i++) {
                    baralhoVermelho.push(cartasArray[i]);
                    if (i + 1 < cartasArray.length) {
                        baralhoAzul.push(cartasArray[i + 1]);
                    }
                    cartasArray.splice(0, 2);


                }


                vermelhoClicar();
                azulEstatico();
            }

            function verificaMaiorQualidadeAzul() {
                if (baralhoAzul[0].inteligencia > baralhoAzul[0].forca && baralhoAzul[0].inteligencia > baralhoAzul[0].velocidade && baralhoAzul[0].inteligencia > baralhoAzul[0].resistencia) {
                    maiorQualidadeAzul = "inteligencia";
                } else if (baralhoAzul[0].forca > baralhoAzul[0].inteligencia && baralhoAzul[0].forca > baralhoAzul[0].velocidade && baralhoAzul[0].forca > baralhoAzul[0].resistencia) {
                    maiorQualidadeAzul = "forca";
                } else if (baralhoAzul[0].velocidade > baralhoAzul[0].inteligencia && baralhoAzul[0].velocidade > baralhoAzul[0].forca && baralhoAzul[0].velocidade > baralhoAzul[0].resistencia) {
                    maiorQualidadeAzul = "velocidade";
                } else if (baralhoAzul[0].resistencia > baralhoAzul[0].inteligencia && baralhoAzul[0].resistencia > baralhoAzul[0].forca && baralhoAzul[0].resistencia > baralhoAzul[0].velocidade) {
                    maiorQualidadeAzul = "resistencia";
                }
            }

            function apareceVermelho() {
                divCartasVermelhas.style.backgroundImage = "url(" + baralhoVermelho[0].imagem + ")";
                divCartasVermelhas.style.backgroundSize = "contain";
                nomeVermelho.innerHTML = baralhoVermelho[0].nome;
                caracteristicasVermelhoInteligencia.innerHTML = "Inteligência: " + baralhoVermelho[0].inteligencia;
                caracteristicasVermelhoForca.innerHTML = "<br>Força: " + baralhoVermelho[0].forca;
                caracteristicasVermelhoVelocidade.innerHTML = "<br>Velocidade: " + baralhoVermelho[0].velocidade;
                caracteristicasVermelhoResistencia.innerHTML = "<br>Resistência: " + baralhoVermelho[0].resistencia;
                divCartasVermelhas.style.pointerEvents = "auto";
                nomeVermelho.style.display = "block";
                caracteristicasVermelho.style.display = "block";
            }

            function vermelhoClicar() {
                divCartasVermelhas.style.backgroundColor = "red";
                divCartasVermelhas.style.backgroundImage = "none";
                divCartasVermelhas.style.pointerEvents = "auto";
                nomeVermelho.style.display = "none";
                caracteristicasVermelho.style.display = "none";
                verificaMaiorQualidadeAzul();
            }

            function vermelhoEstatico() {
                divCartasVermelhas.style.backgroundColor = "red";
                divCartasVermelhas.style.backgroundImage = "none";
                divCartasVermelhas.style.pointerEvents = "none";
                nomeVermelho.style.display = "none";
                caracteristicasVermelho.style.display = "none";
            }

            function azulEstatico() {
                divCartasAzuis.style.backgroundColor = "blue";
                divCartasAzuis.style.backgroundImage = "none";
                divCartasAzuis.style.pointerEvents = "none";
                nomeAzul.style.display = "none";
                caracteristicasAzuis.style.display = "none";

                verificaMaiorQualidadeAzul();
            }

            function apareceAzul() {
                divCartasAzuis.style.backgroundImage = "url(" + baralhoAzul[0].imagem + ")";
                divCartasAzuis.style.backgroundSize = "contain";
                nomeAzul.innerHTML = baralhoAzul[0].nome;
                caracteristicasAzulInteligencia.innerHTML = "Inteligência: " + baralhoAzul[0].inteligencia;
                caracteristicasAzulForca.innerHTML = "<br>Força: " + baralhoAzul[0].forca;
                caracteristicasAzulVelocidade.innerHTML = "<br>Velocidade: " + baralhoAzul[0].velocidade;
                caracteristicasAzulResistencia.innerHTML = "<br>Resistência: " + baralhoAzul[0].resistencia;
                nomeAzul.style.display = "block";
                caracteristicasAzuis.style.display = "block";
            }

            function desapareceAzul() {
                divCartasAzuis.style.backgroundImage = "blue";
                divCartasAzuis.style.backgroundImage = "none";
                nomeAzul.innerHTML = "";
                caracteristicasAzulInteligencia.innerHTML = "";
                caracteristicasAzulForca.innerHTML = "";
                caracteristicasAzulVelocidade.innerHTML = "";
                caracteristicasAzulResistencia.innerHTML = "";
                divCartasAzuis.style.pointerEvents = "none";
            }

            function cartas_pro_cemiterio_vermelho() {
                cemiterioVermelho.push(baralhoVermelho[0]);
                cemiterioVermelho.push(baralhoAzul[0]);
                baralhoVermelho.splice(0, 1);
                baralhoAzul.splice(0, 1);
            }

            function cartas_pro_cemiterio_azul() {
                cemiterioAzul.push(baralhoVermelho[0]);
                cemiterioAzul.push(baralhoAzul[0]);
                baralhoAzul.splice(0, 1);
                baralhoVermelho.splice(0, 1);
            }

            function reset() {
                vermelhoEstatico();
                azulEstatico();
                verificaMaiorQualidadeAzul();

                cartaVirada = false;
                caracteristicasVermelhoInteligencia.style.pointerEvents = 'auto';
                caracteristicasVermelhoForca.style.pointerEvents = 'auto';
                caracteristicasVermelhoVelocidade.style.pointerEvents = 'auto';
                caracteristicasVermelhoResistencia.style.pointerEvents = 'auto';

                caracteristicasVermelhoInteligencia.style.backgroundColor = "";
                caracteristicasVermelhoForca.style.backgroundColor = "";
                caracteristicasVermelhoVelocidade.style.backgroundColor = "";
                caracteristicasVermelhoResistencia.style.backgroundColor = "";
                caracteristicasAzulInteligencia.style.backgroundColor = "";
                caracteristicasAzulForca.style.backgroundColor = "";
                caracteristicasAzulVelocidade.style.backgroundColor = "";
                caracteristicasAzulResistencia.style.backgroundColor = "";


            }

            function azulEscolhe() {
                apareceVermelho();
                divCartasVermelhas.style.pointerEvents = "none";
                apareceAzul();

                if (maiorQualidadeAzul == "inteligencia") {
                    inteligencia();
                }
                if (maiorQualidadeAzul == "forca") {
                    forca();
                }
                if (maiorQualidadeAzul == "velocidade") {
                    velocidade();
                }
                if (maiorQualidadeAzul == "resistencia") {
                    resistencia();
                }

            }

            function tempoResetar() {
                intervalo = setTimeout(reset, 3000);
                intervalo = setTimeout(caracteristicasVermelhoInteligencia.style.pointerEvents = 'none', 3000);
                intervalo = setTimeout(caracteristicasVermelhoForca.style.pointerEvents = 'none', 3000);
                intervalo = setTimeout(caracteristicasVermelhoVelocidade.style.pointerEvents = 'none', 3000);
                intervalo = setTimeout(caracteristicasVermelhoResistencia.style.pointerEvents = 'none', 3000);
                intervlao = setTimeout(apareceVermelho, 3000);
            }

            function verificarVencedor() {
                if (cemiterioAzul.length > cemiterioVermelho.length && baralhoVermelho.length == 0 && baralhoAzul.length == 0) {
                    intervalo = setTimeout(function () {
                        alert("PC WINS");
                    }, 300);
                    btnJogarDnv.style.display = "block";
                }
                if (cemiterioAzul.length < cemiterioVermelho.length && baralhoVermelho.length == 0 && baralhoAzul.length == 0) {
                    intervalo = setTimeout(function () {
                        alert("VC WINS");
                    }, 300);
                    btnJogarDnv.style.display = "block";
                }
                if (cemiterioAzul.length == cemiterioVermelho.length && baralhoVermelho.length == 0 && baralhoAzul.length == 0) {
                    intervalo = setTimeout(function () {
                        alert("EMPATE");
                    }, 300);
                    btnJogarDnv.style.display = "block";
                }
            }

            function inteligencia() {
                if (baralhoVermelho[0].inteligencia > baralhoAzul[0].inteligencia) {
                    apareceAzul();
                    cartas_pro_cemiterio_vermelho();
                    intervalo = setTimeout(caracteristicasVermelhoInteligencia.style.backgroundColor = "green", 3000);
                    intervalo = setTimeout(caracteristicasAzulInteligencia.style.backgroundColor = "red", 3000);
                    tempoResetar();
                    verificarVencedor();
                } else {
                    apareceAzul();
                    cartas_pro_cemiterio_azul();
                    intervalo = setTimeout(caracteristicasVermelhoInteligencia.style.backgroundColor = "red", 3000);
                    intervalo = setTimeout(caracteristicasAzulInteligencia.style.backgroundColor = "green", 3000);
                    tempoResetar();
                    intervalo = setTimeout(vermelhoEstatico, 3000);
                    intervalo = setTimeout(azulEscolhe, 6000);
                    verificarVencedor();
                }
            }

            function forca() {
                if (baralhoVermelho[0].forca > baralhoAzul[0].forca) {
                    apareceAzul();
                    cartas_pro_cemiterio_vermelho();
                    intervalo = setTimeout(caracteristicasVermelhoForca.style.backgroundColor = "green", 3000);
                    intervalo = setTimeout(caracteristicasAzulForca.style.backgroundColor = "red", 3000);
                    tempoResetar();
                    verificarVencedor();
                } else {
                    apareceAzul();
                    cartas_pro_cemiterio_azul();
                    intervalo = setTimeout(caracteristicasVermelhoForca.style.backgroundColor = "red", 3000);
                    intervalo = setTimeout(caracteristicasAzulForca.style.backgroundColor = "green", 3000);
                    tempoResetar();
                    intervalo = setTimeout(vermelhoEstatico, 3000);
                    intervalo = setTimeout(azulEscolhe, 6000);
                    verificarVencedor();
                }
            }

            function velocidade() {
                if (baralhoVermelho[0].velocidade > baralhoAzul[0].velocidade) {
                    apareceAzul();
                    cartas_pro_cemiterio_vermelho();
                    intervalo = setTimeout(caracteristicasVermelhoVelocidade.style.backgroundColor = "green", 3000);
                    intervalo = setTimeout(caracteristicasAzulVelocidade.style.backgroundColor = "red", 3000);
                    tempoResetar();
                    verificarVencedor();

                } else {
                    apareceAzul();
                    cartas_pro_cemiterio_azul();
                    intervalo = setTimeout(caracteristicasVermelhoVelocidade.style.backgroundColor = "red", 3000);
                    intervalo = setTimeout(caracteristicasAzulVelocidade.style.backgroundColor = "green", 3000);
                    tempoResetar();
                    intervalo = setTimeout(vermelhoEstatico, 3000);
                    intervalo = setTimeout(azulEscolhe, 6000);
                    verificarVencedor();
                }
            }

            function resistencia() {
                if (baralhoVermelho[0].resistencia > baralhoAzul[0].resistencia) {
                    apareceAzul();
                    cartas_pro_cemiterio_vermelho();
                    intervalo = setTimeout(caracteristicasVermelhoResistencia.style.backgroundColor = "green", 3000);
                    intervalo = setTimeout(caracteristicasAzulResistencia.style.backgroundColor = "red", 3000);
                    tempoResetar();
                    verificarVencedor();
                } else {
                    apareceAzul();
                    cartas_pro_cemiterio_vermelho();
                    intervalo = setTimeout(caracteristicasVermelhoResistencia.style.backgroundColor = "red", 3000);
                    intervalo = setTimeout(caracteristicasAzulResistencia.style.backgroundColor = "green", 3000);
                    tempoResetar();
                    intervalo = setTimeout(vermelhoEstatico, 3000);
                    intervalo = setTimeout(azulEscolhe, 6000);
                    verificarVencedor();
                }
            }

            function jogadnv() {
                baralhoVermelho.splice(0, baralhoVermelho.length);
                baralhoAzul.splice(0, baralhoAzul.length);
                cemiterioVermelho.splice(0, cemiterioVermelho.length);
                cemiterioAzul.splice(0, cemiterioAzul.length);
                tempoResetar();
                inicia();

            }

        </script>

    </body>
</html>