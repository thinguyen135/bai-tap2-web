<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Murach's Java Servlets and JSP</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 11pt;
            margin: 2em 3em;
            color: #333;
            line-height: 1.6;
        }

        h1 {
            color: teal;
            margin-top: 1em;
            margin-bottom: 0.5em;
        }

        p {
            margin-bottom: 1em;
        }

        /* Nhãn có độ rộng 16em để chứa vừa các câu khảo sát dài */
        label {
            float: left;
            width: 16em;
            font-weight: bold;
            color: #222;
            margin-bottom: 0.6em;
        }

        /* Dữ liệu người dùng nhập hiển thị màu xanh dịu mắt, dễ phân biệt */
        span {
            color: #0056b3;
            display: inline-block;
            margin-bottom: 0.6em;
        }

        /* Cực kỳ quan trọng: ngắt dòng và xóa float để không bị lệch cột */
        br {
            clear: both;
        }

        /* Nút bấm Return đẹp và đồng bộ với màu tiêu đề */
        input[type="submit"] {
            background-color: teal;
            color: white;
            border: none;
            padding: 8px 20px;
            font-size: 11pt;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 0.5em;
            transition: background-color 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #006666;
        }
    </style>
</head>

<body>
    <h1>Thanks for joining our email list</h1>
    <p>Here is the information that you entered:</p>

    <label>Email:</label>
    <span>${user.email}</span><br>
    <label>First Name:</label>
    <span>${user.firstName}</span><br>
    <label>Last Name:</label>
    <span>${user.lastName}</span><br>
    <label>Date of birth:</label>
    <span>${user.dateOfBirth}</span><br>

    <h1>Survey</h1>
    <label>How did you hear about us?:</label>
    <span>${survey.heardFrom}</span><br>
    <label>Announcements preferences:</label>
    <span>${survey.wantsUpdates}</span><br>
    <label>&nbsp;</label>
    <span>${survey.emailOk}</span><br>
    <label>Please contact me by:</label>
    <span>${survey.contactMethod}</span><br>

    <p>To enter another email address, click on the Back button in your browser or the Return button shown below.</p>

    <form action="emailList" method="post">
        <input type="hidden" name="action" value="join">
        <input type="submit" value="Return">
    </form>
</body>

</html>