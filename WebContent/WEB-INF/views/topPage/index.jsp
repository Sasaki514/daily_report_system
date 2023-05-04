<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>日報管理システムへようこそ</h2>
        <h3>【自分の承認済み日報 一覧】</h3>
        <table id="report_list">
            <tbody>
                <tr>
                    <th class="report_name">氏名</th>
                    <th class="report_date">日付</th>
                    <th class="report_title">タイトル</th>
                    <th class="report_action">操作</th>
                    <th class="approval_flag">承認</th>
                </tr>
                <c:forEach var="report" items="${reports}" varStatus="status">
                    <tr class="row${status.count % 2}">
                    <c:if test="${report.approval_flag==1}">
                        <td class="report_name"><c:out
                                value="${report.employee.name}" /></td>
                        <td class="report_date"><fmt:formatDate
                                value='${report.report_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="report_title">${report.title}</td>
                        <td class="report_action"><a
                            href="<c:url value='/reports/show?id=${report.id}' />">詳細を見る</a></td>
                                <c:choose>
                                    <c:when test="${report.approval_flag==0}">
                                        <c:set var="approvalText" value="未承認" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="approvalText" value="承認済み" />
                                    </c:otherwise>
                                </c:choose>
                                <td class="approval_flag">${approvalText}</td>
                    </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${approval_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((approval_count - 1) / 15) + 1}"
                step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p>
            <h3>【自分の未承認日報 一覧】</h3>
        </p>
        <table id="report_list">
            <tbody>
                <tr>
                    <th class="report_name">氏名</th>
                    <th class="report_date">日付</th>
                    <th class="report_title">タイトル</th>
                    <th class="report_action">操作</th>
                    <th class="approval_flag">承認</th>
                </tr>
                <c:forEach var="report" items="${reports}" varStatus="status">
                    <tr class="row${status.count % 2}">
                    <c:if test="${report.approval_flag==0}">
                        <td class="report_name"><c:out
                                value="${report.employee.name}" /></td>
                        <td class="report_date"><fmt:formatDate
                                value='${report.report_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="report_title">${report.title}</td>
                        <td class="report_action"><a
                            href="<c:url value='/reports/show?id=${report.id}' />">詳細を見る</a></td>
                                <c:choose>
                                    <c:when test="${report.approval_flag==0}">
                                        <c:set var="approvalText" value="未承認" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="approvalText" value="承認済み" />
                                    </c:otherwise>
                                </c:choose>
                                <td class="approval_flag">${approvalText}</td>
                    </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


        <div id="pagination">
            （全 ${reports_count - approval_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((reports_count - 1) / 15) + 1}"
                step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>

        <p>
            <a href="<c:url value='/reports/new' />">新規日報の登録</a>
        </p>
    </c:param>
</c:import>