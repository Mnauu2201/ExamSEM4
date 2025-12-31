<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head><title>Giỏ hàng của bạn</title></head>
<body>
    <h2>Giỏ hàng của bạn</h2>
    <table border="1" style="width:100%; text-align:left;">
        <tr>
            <th>Sản phẩm</th><th>Số lượng</th><th>Đơn giá</th><th>Thành tiền</th>
        </tr>
        <c:set var="total" value="0" />
        <c:forEach items="${sessionScope.cart}" var="entry">
            <c:set var="item" value="${entry.value}" />
            <tr>
                <td>${item.product.name}</td>
                <td>${item.quantity}</td>
                <td>${item.product.price}</td>
                <td>${item.product.price * item.quantity}</td>
            </tr>
            <c:set var="total" value="${total + (item.product.price * item.quantity)}" />
        </c:forEach>
    </table>
    <h3>Tổng cộng: <fmt:formatNumber value="${total}" type="currency" currencySymbol="₫"/></h3>
    <a href="${pageContext.request.contextPath}/products">Tiếp tục mua sắm</a>
</body>
</html>