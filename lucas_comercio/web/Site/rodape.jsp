<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br/><br/>
<div class="sub-news">
    <div class="container">
        <form>
            <h3>NewsLetter</h3>
            <input type="text" class="sub-email" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {
                            this.value = 'Email';
                        }">
            <a class="btn btn-default subs-btn" href="#" role="button">SUBSCRIBE</a>
        </form>
    </div>
</div>
        
<div class="footer-grid">
    
    <div class="container">
        <h3>Seção Encheção de Linguiça</h3>  <br/><br/><br/>
        <div class="col-md-2 re-ft-grd">
            <h3>Categories</h3>
            <ul class="categories">
                <li><a href="#">Men</a></li>
                <li><a href="#">Women</a></li>
                <li><a href="#">Kids</a></li>
                <li><a href="#">Formal</a></li>
                <li><a href="#">Casuals</a></li>
                <li><a href="#">Sports</a></li>
            </ul>
        </div>
        <div class="col-md-2 re-ft-grd">
            <h3>Short links</h3>
            <ul class="shot-links">
                <li><a href="#">Contact us</a></li>
                <li><a href="#">Support</a></li>
                <li><a href="#">Delivery</a></li>
                <li><a href="#">Return Policy</a></li>
                <li><a href="#">Terms & conditions</a></li>
                <li><a href="contact.html">Sitemap</a></li>
            </ul>
        </div>
        <div class="col-md-6 re-ft-grd">
            <h3>Social</h3>
            <ul class="social">
                <li><a href="#" class="fb">facebook</a></li>
                <li><a href="#" class="twt">twitter</a></li>
                <li><a href="#" class="gpls">g+ plus</a></li>
                <div class="clearfix"></div>
            </ul>
        </div>
        <div class="col-md-2 re-ft-grd">
            <div class="bt-logo">
                <div class="logo">
                    <a href="index.html" class="ft-log">N-AIR</a>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    <div class="copy-rt">
        <div class="container">
            <p>&copy;   2015 N-AIR All Rights Reserved. Design by <a href="http://www.w3layouts.com">w3layouts</a></p>
        </div>
    </div>
</div>
</body>
</html>