<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp" %>
<div class="plan-list">

    <c:forEach var="item" items="${items}">
        <div class="card" data-planid="${item.planId}">
            <div class="card-header">
                <div class="left">
                    <div class="profile-image">
                        <img src="https://tripsoda.s3.ap-northeast-2.amazonaws.com/test/image/1670229253636-1"
                             alt="avatar">
                    </div>
                </div>
                <div class="right">
                    <div class="plan">
                        <span class="material-symbols-rounded">calendar_month</span>여행기간
                    </div>
                    <div class="date">
                            ${item.personnel}명 • &nbsp;<span>${item.startDay} ~ ${item.endDay}</span>
                    </div>
                </div>
            </div>

            <div class="card-body">
                    ${item.firstImage}
                <div class="content">
                        ${item.content}
                </div>
            </div>

            <div class="card-footer">
                <div class="title">${item.title}</div>
            </div>
        </div>
    </c:forEach>
</div>
<script>
    $(function () {
        $(".card").click(function () {
            location.href = "/detail/" + $(this).data("planid");
        });
    })
</script>

<%@ include file="footer.jsp" %>