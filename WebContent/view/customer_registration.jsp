<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Customer Registration</title>
</head>
<body>
	<div>
		<jsp:include page="sidebar.jsp"/>
	</div>
	<div>
		<jsp:include page="customer_header.jsp"/>
		<div>
			<h3>Customer Registration</h3>
			<form action="../com/kjjcsoft/controllers/CustomerRegistration" method="post" enctype="multipart/form-data">
				<label for="account_type">Account Type</label>
				<select name="account_type">
					<optgroup label="Saving Accounts">
						<option value="ds">Daily Savings</option>
						<option value="ms">Monthly Savings</option>
						<option value="fds">Fixed Deposit Savings</option>
						<option value="cfd">Cummulative Fixed Deposit</option>
					</optgroup>
					<optgroup label="Loan Accounts">
						<option value="bl">Bussiness Loan</option>
						<option value="al">Agricultural Loan</option>
					</optgroup>
				</select>
				<br>
				<label for="fullname">Fullname:</label>
				<input type="text" placeholder="Fullname" name="fullname"/>
				<br>
				<label for="upload_photo">Upload Photo:</label>
				<input type="file" name="upload_photo"/>
				<br>
				<label for="age">Age</label>
				<input type="text" name="age">
				<br>
				<label for="dob">Date of birth</label>
				<input type="text" name="dob"/>
				<br>
				<label for="sex">Sex :</label>
				<input type="radio" name="sex" value="Male"/>Male
				<input type="radio" name="sex" value="Female"/>Female
				<br>
				<label for="marital_status">Marital Status:</label>
				<input type="radio" name="marital_status" value="Single"/>Single
				<input type="radio" name="marital_status" value="Married"/>Married
				<br>
				<label for="spouse_name">Spouse Name:</label>
				<input type="text" name="spouse_name" placeholder="Spouse Name"/>
				<br>
				<label for="occupation">Occupation</label>
				<input type="text" name="occupation" placeholder="Occupation"/>
				<br>
				<label for="cellnumber_first">Mobile 1:</label>
				<input type="text" name="cellnumber_first" placeholder="eg. 98XXXXXXXX" />
				<br>
				<label for="cellnumber_second">Mobile 2:</label>
				<input type="text" name="cellnumber_second" placeholder="eg. 98XXXXXXXX"/>
				<br>
				<label for="landline">Landline</label>
				<input type="text" name="landline" placeholder="01XXXXXXXX"/>
				<br>
				<label for="customer_email">Email</label>
				<input type="text" name="customer_email"/>
				<br>
				<fieldset>
					<legend>Permanent Address</legend>
					<label for="perm_dist">District</label>
					<input type="text" name="perm_dist" placeholder="District"/>
					<label for="perm_vdc_mp">VDC/Municipality</label>
					<input type="text" name="perm_vdc_mp" placeholder="VDC/Municipality"/>
					<label for="perm_other">Other Information</label>
					<input type="text" name="perm_other" placeholder=""/>
				</fieldset>
				<fieldset>
					<legend>Temporary Address</legend>
					<label for="temp_dist">District</label>
					<input type="text" name="temp_dist" placeholder="District"/>
					<label for="temp_vdc_mp">VDC/Municipality</label>
					<input type="text" name="temp_vdc_mp" placeholder="VDC/Municipality"/>
					<label for="temp_other">Other Information</label>
					<input type="text" name="temp_other" placeholder=""/>
				</fieldset>
				<label for="fathers_name">Father's Name:</label>
				<input type="text" name="fathers_name" placeholder="Father's Name"/>
				<br>
				<label for="grandfathers_name">Grandfather's Name</label>
				<input type="text" name="grandfathers_name" placeholder="Grandfather's Name"/>
				<br>
				<label for="father_in_law_name">Father-in-Law's Name</label>
				<input type="text" name="father_in_law_name" placeholder="Father-in-Law"/>
				<fieldset>
					<legend>Nominee</legend>
					<label for="nominee_name">Nominee's Name</label>
					<input type="text" name="nominee_name" placeholder="Nominee Name"/>
					<br>
					<label for="nominee_cell_first">Mobile 1:</label>
					<input type="text" name="nominee_cell_first" placeholder="98XXXXXXXX"/>
					<br>
					<label for="nominee_cell_second">Mobile 2:</label>
					<input type="text" name="nominee_cell_second" placeholder="98XXXXXXXX"/>
					<br>
					<label for="nominee_landline">Landline</label>
					<input type="text" name="nominee_landline" placeholder="01XXXXXXXX"/>
					<br>
					<label for="nominee_email">Email:</label>
					<input type="text" name="nominee_email" placeholder="Email"/>
					<fieldset>
						<legend>Permanent Address</legend>
						<label for="n_perm_dist">District</label>
						<input type="text" name="n_perm_dist" placeholder="District"/>
						<label for="n_perm_vdc_mp">VDC/Municipality</label>
						<input type="text" name="n_perm_vdc_mp" placeholder="VDC/Municipality"/>
						<label for="n_perm_other">Other Information</label>
						<input type="text" name="n_perm_other" placeholder=""/>
					</fieldset>
					<fieldset>
						<legend>Temporary Address</legend>
						<label for="n_temp_dist">District</label>
						<input type="text" name="n_temp_dist" placeholder="District"/>
						<label for="n_temp_vdc_mp">VDC/Municipality</label>
						<input type="text" name="n_temp_vdc_mp" placeholder="VDC/Municipality"/>
						<label for="n_temp_other">Other Information</label>
						<input type="text" name="n_temp_other" placeholder=""/>
					</fieldset>
				</fieldset>
				<fieldset>
					<legend>For Under Age</legend>
					<label for="guardian_name">Guardian Name</label>
					<input type="text" name="guardian_name" placeholder="Guardian Name"/>
					<br>
					<label for="guardian_relation">Relation</label>
					<input type="text" name="guardian_relation" placeholder="Relation"/>
					<br>
					<label for="guardian_cell_first">Mobile 1:</label>
					<input type="text" name="guardian_cell_first" placeholder="98XXXXXXXX"/>
					<br>
					<label for="guardian_cell_second">Mobile 2:</label>
					<input type="type" name="guardian_cell_second" placeholder="98XXXXXXXX"/>
					<br>
					<label for="guardian_landline">Landline</label>
					<input type="text" name="guardian_landline" placeholder="01XXXXXXXX"/>
					<br>
					<label for="guardian_email">Email</label>
					<input type="text" name="guardian_email" placeholder="example@example.com"/>
					<fieldset>
						<legend>Permanent Address</legend>
						<label for="g_perm_dist">District</label>
						<input type="text" name="g_perm_dist" placeholder="District"/>
						<label for="g_perm_vdc_mp">VDC/Municipality</label>
						<input type="text" name="g_perm_vdc_mp" placeholder="VDC/Municipality"/>
						<label for="g_perm_other">Other Information</label>
						<input type="text" name="g_perm_other" placeholder=""/>
					</fieldset>
					<fieldset>
						<legend>Temporary Address</legend>
						<label for="g_temp_dist">District</label>
						<input type="text" name="g_temp_dist" placeholder="District"/>
						<label for="g_temp_vdc_mp">VDC/Municipality</label>
						<input type="text" name="g_temp_vdc_mp" placeholder="VDC/Municipality"/>
						<label for="g_temp_other">Other Information</label>
						<input type="text" name="g_temp_other" placeholder=""/>
					</fieldset>
				</fieldset>
				<label for="upload_fingerprints">Upload Finger Prints:</label>
				<input type="file" name="upload_fingerprints"/>
				<br>
				<label for="interest_rate">Interest Rate</label>
				<input type="text" name="interest_rate" placeholder="%"/>
				<br>
				<label for="starting_amount">Starting Deposit Rs:</label>
				<input type="text" name="starting_amount" placeholder="$$$$$"/>
				<br>
				<label for="creation_date">Account Creation Date</label>
				<input type="text" name="creation_date" placeholder="YYYY/mm/dd"/>
				<br>
				<label for="reffered_by">Reffered By:</label>
				<input type="text" name="reffered_by" placeholder="John Doe"/>
				<label for="approved_by">Approved By:</label>
				<input type="text" name="approved_by" placeholder="John Doe"/>
				<br>
				<input type="submit" value="Save"/>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>