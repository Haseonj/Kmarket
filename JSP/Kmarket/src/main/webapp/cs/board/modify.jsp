<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../_header.jsp"/>
<jsp:include page="./_${vo.group}.jsp"/>
<script></script>
                <form action="/Kmarket/cs/board/modify.do" method="post">
                <input type="hidden" name="uid" value="${sessMember.uid}">
                <input type="hidden" name="cate" value="${cate}">
                <input type="hidden" name="group" value="qna">
                <input type="hidden" name="type" value="${type}">
                <input type="hidden" name="no" value="${vo.no}">
                <input type="hidden" name="pg" value="${pg}">
                    <table>
                        <tbody>
                            <tr class="type">
                                <td>문의유형</td>
                                <td>
                                    <input type="text" name="cate1" value="${vo.cate1}" readonly/>
                                    <input type="text" name="cate2" value="${vo.cate2}" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>문의제목</td>
                                <td>
                                    <input type="text" name="title" value="${vo.title}">
                                </td>
                            </tr>
                            <tr>
                                <td>문의내용</td>
                                <td>
                                    <textarea name="content">${vo.content}</textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div>
                        <a href="/Kmarket/cs/board/list.do?group=${vo.group}&cate=${vo.c1Name}&type=list" class="btnList">취소하기</a>
                        <input type="submit" class="btnSubmit" value="등록하기">
                    </div>
                </form>
            </article>
        </section>
    </div>
</section>
<jsp:include page="../_footer.jsp"/>