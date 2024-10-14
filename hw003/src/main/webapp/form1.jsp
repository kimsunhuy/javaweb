<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>데이터 전송 폼</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label, input, textarea {
            margin-bottom: 10px;
        }
        input[type="submit"] {
            align-self: flex-start;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>데이터 전송 폼</h1>
    <form action="form1_proc.jsp" method="post">
        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>

        <label for="age">나이:</label>
        <input type="number" id="age" name="age" required>

        <label for="message">메시지:</label>
        <textarea id="message" name="message" rows="4" required></textarea>

        <input type="submit" value="제출">
    </form>
</body>
</html>