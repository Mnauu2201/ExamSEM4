<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
    <h2>Danh sách sản phẩm</h2>
    <table border="1">
        <tr>
            <th>ID</th><th>Tên</th><th>Giá</th><th>Hành động</th>
        </tr>
        <c:forEach var="p" items="${products}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>${p.price}</td>
                <td>
                    <a href="cart?action=add&id=${p.id}">Thêm vào giỏ</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>