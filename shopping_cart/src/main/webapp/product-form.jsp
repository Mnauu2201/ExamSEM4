<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${product != null ? 'Chỉnh sửa sản phẩm' : 'Thêm sản phẩm mới'}</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; padding: 20px; }
        .form-container { background: white; padding: 20px; border-radius: 8px; max-width: 500px; margin: auto; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="number"], textarea { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; }
        .btn-submit { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .btn-back { background-color: #f44336; color: white; text-decoration: none; padding: 10px 15px; border-radius: 4px; display: inline-block; margin-top: 10px; }
    </style>
</head>
<body>

<div class="form-container">
    <h2>${product != null ? 'Chỉnh sửa sản phẩm' : 'Thêm sản phẩm mới'}</h2>
    
    <form action="${pageContext.request.contextPath}/products" method="post">
        
        <input type="hidden" name="action" value="${product != null ? 'update' : 'insert'}">
        <c:if test="${product != null}">
            <input type="hidden" name="id" value="${product.id}">
        </c:if>

        <div class="form-group">
            <label>Tên sản phẩm:</label>
            <input type="text" name="name" value="${product.name}" required>
        </div>

        <div class="form-group">
            <label>Giá (VNĐ):</label>
            <input type="number" name="price" value="${product.price}" required>
        </div>

        <div class="form-group">
            <label>Mô tả:</label>
            <textarea name="description" rows="4">${product.description}</textarea>
        </div>

        <div class="form-group">
            <label>Link ảnh:</label>
            <input type="text" name="imageUrl" value="${product.imageUrl}">
        </div>

        <div class="form-group">
            <label>Số lượng tồn kho:</label>
            <input type="number" name="stock" value="${product.stock}" required>
        </div>

        <button type="submit" class="btn-submit">
            ${product != null ? 'Cập nhật sản phẩm' : 'Thêm sản phẩm'}
        </button>
    </form>
    
    <a href="${pageContext.request.contextPath}/products" class="btn-back">Hủy bỏ</a>
</div>

</body>
</html>