<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
            <section id="admin-cs-write">
                <nav>
                    <h3>공지사항 작성</h3>
                    <p>
                        HOME > 고객센터 > <strong>공지사항</strong>
                    </p>
                </nav>
                <article>
                    <form action="#">
                        <table>
                            <tr>
                                <td>유형</td>
                                <td>
                                    <select name="cate1" id="#">
                                        <option value="0">1차 선택</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><input type="text" name="title" placeholder="제목을 입력합니다."></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td><textarea name="content" id="#" cols="30" rows="10" placeholder="내용을 입력합니다."></textarea></td>
                            </tr>
                        </table>
                        <div>
                            <a href="#">취소하기</a>
                            <input type="submit" class="btnSubmit" value="등록하기"/>
                        </div>
                    </form>
                </article>
            </section>
        </main>
<jsp:include page="../_header.jsp"/>