<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>요청 파라미터 출력</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        table {
            border-collapse: collapse;
            width: 400px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .param-name {
            width: 50%;
        }
        .param-value {
            width: 50%;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th class="param-name">요청 파라미터 이름</th>
            <th class="param-value">요청 파라미터 값</th>
        </tr>
        <%
            request.setCharacterEncoding("UTF-8");
            java.util.Enumeration<String> paramNames = request.getParameterNames();
            while(paramNames.hasMoreElements()) {
                String paramName = paramNames.nextElement();
                String paramValue = request.getParameter(paramName);
        %>
        <tr>
            <td class="param-name"><%= paramName %></td>
            <td class="param-value"><%= paramValue %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>