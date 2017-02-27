<%--
  Created by IntelliJ IDEA.
  User: zhangry
  Date: 2017/2/27
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctxp" value="${pageContext.request.contextPath}"></c:set>

<link href="${ctxp}/css/bootstrap/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="${ctxp}/css/bootstrap/bootstrap-table.css" rel="stylesheet">
<link href="${ctxp}/css/bootstrap/bootstrap-modal.css" rel="stylesheet"/>
<link href="${ctxp}/css/bootstrap/bootstrap-datetimepicker.css" rel="stylesheet"/>
<link href="${ctxp}/css/bootstrap/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctxp}/css/themes/style-metro.css" rel="stylesheet" type="text/css"/>
<link href="${ctxp}/css/themes/style.css" rel="stylesheet" type="text/css"/>
<link href="${ctxp}/css/themes/style-responsive.css" rel="stylesheet" type="text/css"/>

<ex-section id="ScriptHead">
    <script type="text/javascript" src="${ctxp}/js/jquery/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="${ctxp}/js/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctxp}/js/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctxp}/js/ui/bootstrap-table.js"></script>
</ex-section>
<html>
<head>
    <title>LOGIN</title>
    <script type="text/javascript">
        $(document).ready(function () {
            gridTable = $("#gridTable").bootstrapTable({
                columns: [
                    {field: "num", title: "序号", width: 60},
                    {field: "id", title: "ID", width: 100},
                    {field: "name", title: "姓名", width: 100},
                    {field: "sex", title: "性别", width: 180},
                    {field: "age", title: "年龄", width: 120, align: "center"},
                    {field: "address", title: "地址", width: 180}
                ],
                striped: true,
                pagination: true,
                pageNumber: 1,
                pageSize: 25,
                pageList: [10, 25, 50, 100],
                sidePagination: "server",
                // sortName: "reportTime",
                // sortOrder: "desc",
                // showColumns: true,
                method: "post",
                url: "${ctxp}/login/getUserList",
                queryParams: function () {
                    userListManager.searchData(1, 25);
                },
                onPageChange: function (number, size) {
                    userListManager.searchData(number, size);
                }
            });
            $("#searchBtn").click(function () {
                userListManager.searchData(gridTable.pageNumber, gridTable.pageSize);
            });
        });
        userListManager = {
            searchData: function (number, size) {
                var params = {
                    pageNumber: number ? number : 1,
                    pageSize: size ? size : 25
                };
                $.ajax({
                    url: "${ctxp}/login/getUserList",
                    type: "post",
                    data: JSON.stringify(params),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        //table赋值方式待定
                        alert(data["pageSize"]);
                        gridTable.pageSize = data["pageSize"];
                        gridTable.pageNumber = data["pageNumber"];
                    },
                    error: function (errMsg) {
                        alert(errMsg+"111");
                    }
                });
            }
        };
    </script>
</head>
<body>
<div>
            <input type="button" id="searchBtn" value="查询">

    <table id="gridTable"></table>
</div>
</body>
</html>
