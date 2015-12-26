<%
session.setAttribute("email", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>