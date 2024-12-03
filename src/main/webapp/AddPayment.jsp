<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Add payment</title>
</head>
<body>

<%
    Integer studentId = Integer.parseInt(request.getParameter("studentId"));
    Integer groupId = Integer.parseInt(request.getParameter("groupId"));
%>

<div class="row">
    <div class="col-6 offset-3">
        <div class="card">
            <div class="card-header">
                Add payment
            </div>
            <div class="card-body">
                <form action="/payment/add" method="post">
                    <input type="hidden" name="studentId" value="<%=studentId%>">
                    <input type="hidden" name="groupId" value="<%=groupId%>">
                    <input class="form-control" type="number" placeholder="Amount" name="amount">
                    <button class="btn btn-success my-2">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
