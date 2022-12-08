<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<main id="product">            
    <aside>
        <ul class="category">     
            <li><i class="fa fa-bars" aria-hidden="true"></i>카테고리</li>
            <li>
                <a href="#"><i class="fas fa-tshirt"></i>패션·의류·뷰티</a>
                <ol>
                    <li><a href="#">남성의류</a></li>
                    <li><a href="#">여성의류</a></li>
                    <li><a href="#">잡화</a></li>
                    <li><a href="#">뷰티</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-laptop"></i>가전·디지털</a>
                <ol>
                    <li><a href="#">노트북/PC</a></li>
                    <li><a href="#">가전</a></li>
                    <li><a href="#">휴대폰</a></li>
                    <li><a href="#">기타</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-utensils"></i>식품·생필품</a>
                <ol>
                    <li><a href="#">신선식품</a></li>
                    <li><a href="#">가공식품</a></li>
                    <li><a href="#">건강식품</a></li>
                    <li><a href="#">생필품</a></li>
                </ol>
            </li>
            <li>
                <a href="#"><i class="fas fa-home"></i>홈·문구·취미</a>
                <ol>
                    <li><a href="#">가구/DIY</a></li>
                    <li><a href="#">침구·커튼</a></li>
                    <li><a href="#">생활용품</a></li>
                    <li><a href="#">사무용품</a></li>
                </ol>
            </li>
        </ul>
    </aside>

    <!-- 주문 페이지 시작-->
    <section class="order">
      
      <!-- 제목, 페이지 네비게이션 -->
      <nav>
        <h1>주문결제</h1>
        <p>
          HOME > 장바구니 > <strong>주문결제</strong>
        </p>
      </nav>

      <form action="#">
        <!-- 주문 상품 목록 -->                  
        <table>
          <tr>
            <th>상품명</th>
            <th>총수량</th>
            <th>판매가</th>
            <th>배송비</th>
            <th>소계</th>
          </tr>
          
            <tr class="empty">
              <td colspan="7">장바구니에 상품이 없습니다.</td>
            </tr>
            <tr>
              <td>
                <article>
                  <a href="#"><img src="https://via.placeholder.com/80x80" alt=""></a>
                  <div>
                    <h2><a href="#">상품명</a></h2>
                    <p>상품설명</p>
                  </div>
                </article>
              </td>
              <td>1</td>
              <td>27,000</td>
              <td>무료배송</td>
              <td>27,000</td>
            </tr>
            <tr>
              <td>
                <article>
                  <a href="#"><img src="https://via.placeholder.com/80x80" alt=""></a>
                  <div>
                    <h2><a href="#">상품명</a></h2>
                    <p>상품설명</p>
                  </div>
                </article>
              </td>
              <td>1</td>
              <td>27,000</td>
              <td>무료배송</td>
              <td>27,000</td>
            </tr>
            <tr>
              <td>
                <article>
                  <a href="#"><img src="https://via.placeholder.com/80x80" alt=""></a>
                  <div>
                    <h2><a href="#">상품명</a></h2>
                    <p>상품설명</p>
                  </div>
                </article>
              </td>
              <td>1</td>
              <td>27,000</td>
              <td>무료배송</td>
              <td>27,000</td>
            </tr>                    
          
        </table>                 
        
        <!-- 최종 결제 정보 -->
        <div class="final">
          <h2>최종결제 정보</h2>
          <table border="0">
            <tr>
              <td>총</td>
              <td>2 건</td>
            </tr>
            <tr>
              <td>상품금액</td>
              <td>27,000</td>
            </tr>
            <tr>
              <td>할인금액</td>
              <td>-1,000</td>
            </tr>
            <tr>
              <td>배송비</td>
              <td>0</td>
            </tr>
            <tr>
              <td>포인트 할인</td>
              <td>-1000</td>
            </tr>
            <tr>
              <td>전체주문금액</td>
              <td>25,000</td>
            </tr>                            
          </table>
          <input type="button" name="" value="결제하기">              
        </div>
          
        <!-- 배송정보 -->
        <article class="delivery">
          <h1>배송정보</h1>                          
          <table>
            <tr>
              <td>주문자</td>
              <td><input type="text" name="orderer" /></td>
            </tr>
            <tr>
              <td>휴대폰</td>
              <td>
                <input type="text" name="hp" />
                <span>- 포함 입력</span>
              </td>
            </tr>
            <tr>
              <td>우편번호</td>
              <td>
                <input type="text" name="zip"/>
                <input type="button" value="검색"/>
              </td>
            </tr>
            <tr>
              <td>기본주소</td>
              <td>
                <input type="text" name="addr1"/>
              </td>
            </tr>
            <tr>
              <td>상세주소</td>
              <td>
                <input type="text" name="addr2"/>
              </td>
            </tr>
          </table>
        </article>

        <!-- 할인정보 -->
        <article class="discount">
          <h1>할인정보</h1>

          <div>
            <p>현재 포인트 : <span>7200</span>점</p>
            <label>
                <input type="text" name="point" />점
                <input type="button" value="적용"/>
            </label>
            <span>포인트 5,000점 이상이면 현금처럼 사용 가능합니다.</span>
          </div>
        </article>

        <!-- 결제방법 -->
        <article class="payment">
            <h1>결제방법</h1>
            <div>
                <span>신용카드</span>
                <p>
                    <label><input type="radio" name="payment" value="type1"/>신용카드 결제</label>
                    <label><input type="radio" name="payment" value="type2"/>체크카드 결제</label>                                
                </p>
            </div>
            <div>
                <span>계좌이체</span>
                <p>
                    <label><input type="radio" name="payment" value="type3"/>실시간 계좌이체</label>
                    <label><input type="radio" name="payment" value="type4"/>무통장 입금</label>                                
                </p>
            </div>
            <div>
                <span>기타</span>
                <p>
                    <label><input type="radio" name="payment" value="type3"/>휴대폰결제</label>
                    <label>
                        <input type="radio" name="payment" value="type4"/>카카오페이
                        <img src="../img/ico_kakaopay.gif" alt="카카오페이"/>
                    </label>                                
                </p>
            </div>
        </article>

        <!-- 경고 -->
        <article class="alert">
          <ul>
              <li><span>케이마켓의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 케이마켓 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다.</span></li>
              <li><span>케이마켓 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다.</span></li>
              <li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다.</span></li>
          </ul>
        </article>
     
      </form>
      
    </section>
    <!-- 주문 페이지 끝-->
</main>
<jsp:include page="./_footer.jsp"/>