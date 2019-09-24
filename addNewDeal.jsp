<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Deal</title>
</head>
<body>
<form name="addDealForm" action="addNewDeal.htm" method="POST">
Deal Name : <input type="text" name="dealName"/>
DG Lead Name : <input type="text" name="dgLead"/>
DU Lead Name : <input type="text" name="duLead"/>
Location Name : <input type="text" name="location"/>
Month : <select  name="month">
<option value="January">January</option>
<option value="February">February</option>
<option value="March">March</option>
<option value="April">April</option>
<option value="May">May</option>
<option value="June">June</option>
<option value="July">July</option>
<option value="August">August</option>
<option value="September">September</option>
<option value="October">October</option>
<option value="November">November</option>
<option value="December">December</option>
</select>

<input type="submit" value="Create Deal" />
</form>
</body>
</html>