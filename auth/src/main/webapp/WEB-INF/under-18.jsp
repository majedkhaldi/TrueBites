<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hey there!</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        p {
            color: #555;
        }
        .btn-home {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-home:hover {
            background-color: #0056b3;
        }
        img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin: 0 auto 20px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="<%=request.getContextPath()%>/images/istockphoto-1046623026-612x612.jpg" alt="The best is yet to come. Be patient.">
        <h1>Hey there!</h1>
        <p>We're so happy you're interested in a balanced diet!</p>
        <p>Right now, it's all about building healthy habits and listening to what your body needs. You're doing great!</p>
        <p>Keep learning and growing, and when the time is right, we'll be here to help you create the perfect diet just for you.</p>
        <p>In the meantime, try to eat a variety of foods, drink plenty of water, and get some exercise. It's all about feeling good and having fun!</p>
        <p>Remember, every little step you take is a step towards a healthier you. Celebrate your progress and enjoy the journey!</p>
        <p>Feel free to check out our tips and resources on healthy eating. If you ever have questions or need a bit of support, we're here for you.</p>
        
            <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
    </div>
</body>
</html>
