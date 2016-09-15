<%@include file="cabecalho.jsp" %>


<div class="banner">
    <div class="container">
        <script src="js/responsiveslides.min.js"></script>
        <script>
    $(function () {
        $("#slider").responsiveSlides({
            auto: true,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            pager: true,
        });
    });
        </script>
        <div  id="top" class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>

                    <div class="banner-text">
                        <h3>Lorem Ipsum is   </h3>
                        <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</p>

                    </div>

                </li>
                <li>

                    <div class="banner-text">
                        <h3>There are many  </h3>
                        <p>Popular belief Contrary to , Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC.</p>


                    </div>

                </li>
                <li>
                    <div class="banner-text">
                        <h3>Sed ut perspiciatis</h3>
                        <p>Lorem Ipsum is not simply random text. Contrary to popular belief, It has roots in a piece of classical Latin literature from 45 BC.</p>


                    </div>

                </li>
            </ul>
        </div>

    </div>
</div>

<!--content-->
<div class="container">
    <div class="cont">
        <div class="content">
            <div class="content-top-bottom">
                <h2>Featured PRODUCTS</h2>
                <div class="clearfix"> </div>
            </div>
            <div class="content-top">
                <div class="grid-in">
                    <div class="col-md-3 grid-top simpleCart_shelfItem">
                        <a href="single.html" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi2.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left    b-delay03 ">
                                    <span>CLARISSA</span>	
                                </h3>
                            </div>
                        </a>
                        <p><a href="single.html">CLARISSA</a></p>
                        <a href="#" class="item_add"><p class="number item_price"><i> </i>$500.00</p></a>
                    </div>
                    <div class="col-md-3 grid-top">
                        <a href="single.html" class="b-link-stripe b-animate-go  thickbox"><img class="img-responsive" src="images/pi4.jpg" alt="">
                            <div class="b-wrapper">
                                <h3 class="b-animate b-from-left    b-delay03 ">
                                    <span>LITTLE HOME</span>	
                                </h3>
                            </div>
                        </a>
                        <p><a href="single.html">LITTLE HOME</a></p>
                        <a href="#" class="item_add"><p class="number item_price"><i> </i>$500.00</p></a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </div>
        <!----->
    </div>
    <!---->
</div>
<%@include file="rodape.jsp" %>
