<%@ page import="uz.pdp.demo9.studycenter.ReportData" %>
<%@ page import="java.util.List" %>
<%@ page import="uz.pdp.demo9.studycenter.Course" %>
<%@ page import="uz.pdp.demo9.studycenter.repo.CourseRepo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Report</title>
</head>
<body>

<%
    List<ReportData> reportData = CourseRepo.getReport();
%>

<table class="table">
    <thead>
    <tr>
        <th>Course name</th>
        <th>Student count</th>
        <th>Total payment</th>
    </tr>
    </thead>

    <tbody>
    <%
        for (ReportData data : reportData) {
    %>
        <tr>
            <td><%=data.getName()%></td>
            <td><%=data.getStudentCount()%></td>
            <td><%=data.getPaymentAmount()%></td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
