<!-- 作成者 : 권예성 -->

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>所属コード検索</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 6px;
            text-align: left;
        }
        th {
            background: #eee;
        }
    </style>
</head>
<body>

<h2>所属コード検索</h2>

<table>
    <tr>
        <th>所属コード</th>
        <th>所属名</th>
        <th>住所</th>
        <th>選択</th>
    </tr>

    <c:forEach var="s" items="${list}">
        <tr>
            <td>${s.shozokuCd}</td>
            <td>${s.shozokuNm}</td>
            <td>${s.shozokuAddress}</td>
            <td>
                <button onclick="choose('${s.shozokuCd}')">選択</button>
            </td>
        </tr>
    </c:forEach>
</table>

<script>
function choose(cd) {
    // 부모창 input에 값 설정
    opener.document.getElementById("newShozokuCd").value = cd;

    // 팝업 닫기
    window.close();
}
</script>

</body>
</html>
