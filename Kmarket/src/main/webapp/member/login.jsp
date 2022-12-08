<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>ì¼ì´ë§ì¼::ëíë¯¼êµ­ 1ë± ì¨ë¼ì¸ ì¼íëª°</title>
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="./css/member.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="top">
                <div>
                    <a href="./member/login.html">ë¡ê·¸ì¸</a>
                    <a href="#">íìê°ì</a>
                    <a href="#">ë§ì´íì´ì§</a>
                    <a href="#"><i class="fa fa-shopping-cart" aria-hidden="true"></i>&nbsp;ì¥ë°êµ¬ë</a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="#"><img src="../img/header_logo.png" alt="ë¡ê³ "></a>
                </div>
            </div>
        </header>
        <main id="member">
            <div class="login">
                <nav>
                    <h1>ë¡ê·¸ì¸</h1>
                    <p>
                        HOME > <strong>ë¡ê·¸ì¸</strong>
                    </p>
                </nav>

                <form action="#">
                    
                    <table border="0">
                        <tr>
                            <td>ìì´ë</td>
                            <td><input type="text" name="uid" placeholder="ìì´ë ìë ¥"></td>
                        </tr>
                        <tr>
                            <td>ë¹ë°ë²í¸</td>
                            <td><input type="password" name="pass" placeholder="ë¹ë°ë²í¸ ìë ¥"></td>
                        </tr>
                    </table>
                    <input type="submit" value="ë¡ê·¸ì¸" />
                    <span>
                        <label><input type="checkbox" name="auto"/>ìë ë¡ê·¸ì¸</label>
                        <a href="#">ìì´ëì°¾ê¸°</a>
                        <a href="#">ë¹ë°ë²í¸ì°¾ê¸°</a>
                        <a href="#">íìê°ìì°¾ê¸°</a>
                    </span>

                    <a href="#" class="banner"><img src="../img/member_login_banner.jpg" alt="1ë§ì í ì¸ ì¿ í° ë°ê¸°"></a>

                </form>
				<img src="./img/member_certifi_logo.gif" alt="banner">
            </div>
        </main>        
        <footer>
            <ul>
                <li><a href="#">íì¬ìê°</a></li>
                <li><a href="#">ìë¹ì¤ì´ì©ì½ê´</a></li>
                <li><a href="#">ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨</a></li>
                <li><a href="#">ì ìê¸ìµê±°ëì½ê´</a></li>
            </ul>
            <div>
                <p><img src="../img/footer_logo.png" alt="ë¡ê³ "></p>
                <p>
                  <strong>(ì£¼)KMARKET</strong><br />
                  ë¶ì°ì ê°ë¨êµ¬ íí¤ëë¡ 152 (ì­ì¼ë ê°ë¨íì´ë¸ì¤ì¼í°)<br />
                  ëíì´ì¬ : íê¸¸ë<br />
                  ì¬ììë±ë¡ë²í¸ : 220-81-83676 ì¬ììì ë³´íì¸<br />
                  íµì íë§¤ìì ê³  : ê°ë¨ 10630í¸ Fax : 02-589-8842
                </p>
                <p>
                  <strong>ê³ ê°ì¼í°</strong><br />
                  Tel : 1234-5678 (íì¼ 09:00~18:00)<br />
                  ì¤ë§ì¼í´ë½/SVIP ì ì© : 1522-5700 (365ì¼ 09:00~18:00)<br />
                  ê²½ê¸°ë ë¶ì²ì ìë¯¸êµ¬ ë¶ì¼ë¡ 223(ìë) í¬ëë¹ë© 6ì¸µ<br />
                  Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr<br />
                </p>
            </div>              
        </footer>
    </div>    
</body>
</html>