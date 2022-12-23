<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
                <article>
                    <table>
                        <tr>
                            <td>유형</td>
                            <td>${vo.cate1}</td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td>${vo.title}</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <p>${vo.content}</p>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <a href="#">삭제</a>
                        <a href="#">수정</a>
                        <a href="/Kmarket/admin/cs/list.do?group=${group}&cate=${cate}&type=list&pg=${pg}">목록</a>
                    </div>
                </article>
            </section>
        </main>
<jsp:include page="../_footer.jsp"/>