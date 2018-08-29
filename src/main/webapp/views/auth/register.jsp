<%-- 
    Document   : register
    Created on : Aug 19, 2018, 10:44:53 PM
    Author     : Le An
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="../header.jsp"/>
    <body>
        <jsp:include page="../customer_nav.jsp"/>
        <div class="container center-block">
            <h1 style="text-align: center;">Register</h1>
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <form class="form-horizontal" action="./register" th:object="${user}" method="POST" enctype="utf8">
                    <p style="color: red;text-align: center">${error}</p>
                    <div class="form-group">
                        <label>Username</label>
                        <input class="input100" type="text" name="username" placeholder="Username" required="true" maxlength="20">
                    </div>
                    <div class="form-group">
                        <label>First name</label>
                        <input class="input100" type="text" name="firstName" placeholder="First name" required="true" maxlength="20">
                    </div>
                    <div class="form-group">
                        <label>Last name</label>
                        <input class="input100" type="text" name="lastName" placeholder="Last name" required="true" maxlength="20">
                    </div>
                    <div class="form-group">
                        <label>Phone number</label>
                        <input id="phone" class="input100" type="text" name="phone" placeholder="Phone number" required="true" maxlength="15" onchange="checkPhone()">
                        <p id="error-phone" style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input class="input100" type="text" name="address" placeholder="Address" required="true" maxlength="30">
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input id="password" class="input100" type="password" name="password" placeholder="Password" onchange="checkPassword()" required="true">
                    </div>
                    <div class="form-group">
                        <label>Confirm</label>
                        <input id="matching" class="input100" type="password" placeholder="Password" onchange="checkPassword()" required="true">
                        <p id="error-notmatched" style="color: red"></p>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-6">
                            <div class="container-login100-form-btn">
                                <button id="submit-btn" class="login100-form-btn" type="submit">Submit</button>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="container-login100-form-btn">
                                <a class="login100-form-btn" href="./login">login</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            const submit_btn = document.getElementById('submit-btn');
            const checkPhone = () => {
                let phone = document.getElementById('phone').value;
                if (isNaN(phone)) {
                    document.getElementById('error-phone').innerHTML = 'Phone shoud be number';
                    submit_btn.disabled = true;
                } else {
                    document.getElementById('error-phone').innerHTML = '';
                    submit_btn.disabled = false;
                }
            }
            const checkPassword = () => {
                let pass = document.getElementById('password').value;
                let match = document.getElementById('matching').value;
                if (pass != '' & match != '' & pass !== match) {
                    document.getElementById('error-notmatched').innerHTML = 'Not matched!';
                    submit_btn.disabled = true
                } else {
                    document.getElementById('error-notmatched').innerHTML = '';
                    submit_btn.disabled = false;
                }
            }
        </script>
    </body>
</html>