<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>케이마켓::대한민국 1등 온라인 쇼핑몰</title>
    <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico">
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="./css/common.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.bxslider').bxSlider({
                auto: false,
                autoControls: true,
                stopAutoOnClick: true,
                pager: true,
                slideWidth: 985
            });
        });
        $(function(){
            var best = $('aside > .best');

            $(window).scroll(function(){
                var t = $(this).scrollTop();

                if(t > 620){
                    best.css({
                        position: "fixed",
                        top: "0"
                    });
                }else{
                    best.css({position: "static"});
                }
            });
        });
    </script>
</head>
<body>
    <div id="wrappre">
        <header>
            <div class="top">
                <div>
                    <a href="#">로그인</a>
                    <a href="#">회원가입</a>
                    <a href="#">마이페이지</a>
                    <a href="#">
                        <i class="fa fa-shopping-cart"></i>
                        장바구니
                    </a>
                </div>
            </div>
            <div class="logo">
                <div>
                    <a href="/Kmarket/"><img src="./img/header_logo.png" alt="로고"></a>
                    <form action="#">
                        <input type="text" name="search">
                        <button>
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
            <div class="menu">
                <div>
                    <ul>
                        <li><a href="#">히트상품</a></li>
                        <li><a href="#">추천상품</a></li>
                        <li><a href="#">최신상품</a></li>
                        <li><a href="#">인기상품</a></li>
                        <li><a href="#">할인상품</a></li>
                    </ul>
                    <ul>
                        <li><a href="/Kmarket/cs/board/list.do?group=notice&cate=all&type=list">공지사항</a></li>
                        <li><a href="/Kmarket/cs/board/list.do?group=faq&cate=user&type=list">자주묻는질문</a></li>
                        <li><a href="/Kmarket/cs/board/list.do?group=qna&cate=user&type=list">문의하기</a></li>
                        <li><a href="/Kmarket/cs/index.do?">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <main>
            <aside>
                <ul class="category">
                    <li><i class="fa fa-bars"></i>카테고리</li>
                    <li>
                        <a href="#">
                            <i class="fas fa-tshirt"></i>패션·의류·뷰티
                            <i class="fas fa-angle-right"></i>
                        </a>
                        <ol>
                            <li><a href="#">남성의류</a></li>
                            <li><a href="#">여성의류</a></li>
                            <li><a href="#">잡화</a></li>
                            <li><a href="#">뷰티</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-laptop"></i>가전·디지털
                            <i class="fas fa-angle-right"></i>
                        </a>
                        <ol>
                            <li><a href="#">노트북/PC</a></li>
                            <li><a href="#">가전</a></li>
                            <li><a href="#">휴대폰</a></li>
                            <li><a href="#">기타</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-utensils"></i>식품·생필품
                            <i class="fas fa-angle-right"></i>
                        </a>
                        <ol>
                            <li><a href="#">신선식품</a></li>
                            <li><a href="#">가공식품</a></li>
                            <li><a href="#">건강식품</a></li>
                            <li><a href="#">생필품</a></li>
                        </ol>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fas fa-home"></i>홈·문구·취미
                            <i class="fas fa-angle-right"></i>
                        </a>
                        <ol>
                            <li><a href="#">가구/DIY</a></li>
                            <li><a href="#">침구·커튼</a></li>
                            <li><a href="#">생활용품</a></li>
                            <li><a href="#">사무용품</a></li>
                        </ol>
                    </li>
                </ul>
                <article class="best" style="position: static;">
                    <h1><i class="fas fa-crown"></i>베스트상품</h1>
                    <ol>
                        <li>
                            <a href="#">
                                <div class="thumb">
                                    <i>1</i>
                                    <img src="https://via.placeholder.com/230" alt="item1">
                                </div>
                                <h2>상품명</h2>
                                <div class="org_price">
                                    <del>30,000</del>
                                    <span>10%</span>
                                </div>
                                <div class="dis_price">
                                    <ins>27,000</ins>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="thumb">
                                    <i>2</i>
                                    <img src="https://via.placeholder.com/50" alt="item2">
                                </div>
                                <article>
                                    <h2>상품명</h2>
                                    <div class="org_price">
                                        <del>30,000</del>
                                        <span>10%</span>
                                    </div>
                                    <div class="dis_price">
                                        <ins>27,000</ins>
                                    </div>
                                </article>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="thumb">
                                    <i>3</i>
                                    <img src="https://via.placeholder.com/50" alt="item3">
                                </div>
                                <article>
                                    <h2>상품명</h2>
                                    <div class="org_price">
                                        <del>30,000</del>
                                        <span>10%</span>
                                    </div>
                                    <div class="dis_price">
                                        <ins>27,000</ins>
                                    </div>
                                </article>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="thumb">
                                    <i>4</i>
                                    <img src="https://via.placeholder.com/50" alt="item4">
                                </div>
                                <article>
                                    <h2>상품명</h2>
                                    <div class="org_price">
                                        <del>30,000</del>
                                        <span>10%</span>
                                    </div>
                                    <div class="dis_price">
                                        <ins>27,000</ins>
                                    </div>
                                </article>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="thumb">
                                    <i>5</i>
                                    <img src="https://via.placeholder.com/50" alt="item5">
                                </div>
                                <article>
                                    <h2>상품명</h2>
                                    <div class="org_price">
                                        <del>30,000</del>
                                        <span>10%</span>
                                    </div>
                                    <div class="dis_price">
                                        <ins>27,000</ins>
                                    </div>
                                </article>
                            </a>
                        </li>
                    </ol>
                </article>
            </aside>
            <section>
                <!-- 슬라이더 영역 -->
                <section class="slider">
                    <ul class="bxslider"><
                        <li>
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                        <li>
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li> 
                        <li>
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                        <li class="bx-clone">
                            <a href="#"><img src="https://via.placeholder.com/985x447" alt="item5"></a>
                        </li>
                    </ul>
                </section>
                <!-- 히트상품 영역 -->
                <section class="hit">
                    <h3><span>히트상품</span></h3>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a> 
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                </section>
                <!-- 추천상품 영역 -->
                <section class="recommend">
                    <h3><span>추천상품</span></h3>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                </section>
                <!-- 최신상품 영역 -->
                <section class="new">
                    <h3><span>최신상품</span></h3>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                </section>
                <!-- 할인상품 영역 -->
                <section class="discount">
                    <h3><span>할인상품</span></h3>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                    <article>
                        <a href="#">
                            <div class="thumb">
                                <img src="https://via.placeholder.com/230x230" alt="t1">
                            </div>
                            <h2>상품명</h2>
                            <p>간단한 상품 설명</p>
                            <div class="org_price">
                                <del>30,000</del>
                                <span>10%</span>
                            </div>
                            <div class="dis_price">
                                <ins>27,000</ins>
                                <span class="free">무료배송</span>
                            </div>
                        </a>
                    </article>
                </section>
            </section>
        </main>
        <footer>
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">서비스이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">전자금융거래약관</a></li>
            </ul>
            <div>
                <p><img src="./img/footer_logo.png" alt="로고"></p>
                <p>
                    <strong>(주)KMARKET</strong>
                    <br>
                    부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                    <br>
                    대표이사 : 홍길동
                    <br>
                    사업자등록번호 : 220-81-83676 사업자정보확인
                    <br>
                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                </p>
                <p>
                    <strong>고객센터</strong>
                    <br>
                    Tel : 1234-5678 (평일 09:00~18:00)
                    <br>
                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                    <br>
                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                    <br>
                    Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr
                </p>
            </div>
        </footer>
        <button type="button" id="top">상단이동</button>
    </div> 
</body>
</html>