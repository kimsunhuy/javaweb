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
        input[type="submit"], input[type="button"] {
            align-self: flex-start;
            cursor: pointer;
            margin-right: 10px;
        }
        .button-group {
            display: flex;
        }
        .error {
            color: red;
            font-size: 0.8em;
            margin-top: -5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>데이터 전송 폼</h1>
    <form id="dataForm" action="form1_proc.jsp" method="post" onsubmit="return validateForm()">
        <label for="id">아이디:</label>
        <input type="text" id="id" name="id" required>
        <div id="idError" class="error"></div>

        <label for="passwd">비밀번호:</label>
        <input type="password" id="passwd" name="passwd" required>
        <div id="passwdError" class="error"></div>

        <label for="name">이름:</label>
        <input type="text" id="name" name="name" required>
        <div id="nameError" class="error"></div>

        <label for="phone">전화번호:</label>
        <input type="tel" id="phone" name="phone" required>
        <div id="phoneError" class="error"></div>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" required>
        <div id="emailError" class="error"></div>

        <label for="comment">코멘트:</label>
        <textarea id="comment" name="comment" rows="4"></textarea>

        <div class="button-group">
            <input type="submit" value="제출">
            <input type="button" value="다시하기" onclick="resetForm()">
        </div>
    </form>

    <script>
        function validateForm() {
            let isValid = true;
            
            // 아이디 검증 (영문자로 시작하는 6~20자 영문자 또는 숫자)
            const idRegex = /^[a-zA-Z][a-zA-Z0-9]{5,19}$/;
            if (!idRegex.test(document.getElementById('id').value)) {
                document.getElementById('idError').textContent = "아이디는 영문자로 시작하는 6~20자의 영문자 또는 숫자여야 합니다.";
                isValid = false;
            } else {
                document.getElementById('idError').textContent = "";
            }

            // 비밀번호 검증 (8~16자 영문, 숫자, 특수문자 조합)
            const passwdRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
            if (!passwdRegex.test(document.getElementById('passwd').value)) {
                document.getElementById('passwdError').textContent = "비밀번호는 8~16자의 영문, 숫자, 특수문자 조합이어야 합니다.";
                isValid = false;
            } else {
                document.getElementById('passwdError').textContent = "";
            }

            // 이름 검증 (2~10자 한글)
            const nameRegex = /^[가-힣]{2,10}$/;
            if (!nameRegex.test(document.getElementById('name').value)) {
                document.getElementById('nameError').textContent = "이름은 2~10자의 한글이어야 합니다.";
                isValid = false;
            } else {
                document.getElementById('nameError').textContent = "";
            }

            // 전화번호 검증 (010으로 시작하는 11자리 숫자)
            const phoneRegex = /^010\d{8}$/;
            if (!phoneRegex.test(document.getElementById('phone').value)) {
                document.getElementById('phoneError').textContent = "전화번호는 010으로 시작하는 11자리 숫자여야 합니다.";
                isValid = false;
            } else {
                document.getElementById('phoneError').textContent = "";
            }

            // 이메일 검증
            const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!emailRegex.test(document.getElementById('email').value)) {
                document.getElementById('emailError').textContent = "올바른 이메일 형식이 아닙니다.";
                isValid = false;
            } else {
                document.getElementById('emailError').textContent = "";
            }

            return isValid;
        }

        function resetForm() {
            document.getElementById('dataForm').reset();
            const errorDivs = document.getElementsByClassName('error');
            for (let div of errorDivs) {
                div.textContent = "";
            }
        }
    </script>
</body>
</html>