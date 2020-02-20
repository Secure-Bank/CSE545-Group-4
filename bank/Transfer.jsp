<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>External User</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
    <link href="tabs.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #Submit1
        {
            height: 25px;
            width: 137px;
        }
    </style>
    <script type="text/javascript">
   
     function MakeTransfer(){
    	 var fromAccount=$("#fromAccountSelect").val();
    	 var toUser = $("#toAccount").val();
    	 var amt=$("#amount").val();
    	 //var requestURL = "transferService?customerA="+customerAcc;
    	 /*$.get(requestURL,function(data){
    		    alert(data);
    		  });*/
	    	 $.post( "transferService", { toAcc: toUser,fromAcc:fromAccount, amount: amt})
	    	  .done(function( data ) {
	    	    alert( data );
	    	    document.location.reload(true);
	    	  });  	  
     }
     
      $(document).ready(function () {
    	  //called when key is pressed in textbox
    	  $("#toAccount").keypress(function (e) {
    	     //if the letter is not digit then display error and don't type anything
    	     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
    	        //display error message
    	        $("#errmsg").html("Digits Only").show().fadeOut("");
    	               return false;
    	    }
    	   });
    	});
     
     $(document).ready(function () {
     $("#amount").keypress(function (event) {
         //this.value = this.value.replace(/[^0-9\.]/g,'');
  $(this).val($(this).val().replace(/[^0-9\.]/g,''));
         if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
             event.preventDefault();
         }
     	});
     }); 
     
     document.onmousedown=disableclick;
     status="Right Click Disabled";
     function disableclick(event)
     {
       if(event.button==2)
        {
          alert(status);
          return false;    
        }
     }
    </script>    
</head>
<body>
<div class="topnav">
  <a href="#">Link</a>
  <a href="#">Link</a>
  <a href="#">Link</a>
</div>
    <div class="content">
        <center><h1>Welcome to Sun Financial</h1></center>
        <div id="login-box-ext-usr">
        <ol id="toc">
            <li><a href="account.jsp"><span>Account</span></a></li>
            <li><a href="TranPayment.jsp"><span>Payment</span></a></li>
            <li class="current"><a href="Transfer.jsp"><span>Transfer</span></a></li>
            <li><a href="creditDebit.jsp"><span>Credit/Debit</span></a></li>
            <li><a href="authorize.jsp"><span>Make Payment</span></a></li>
            <li><a href="viewTransactions.jsp"><span>View Transactions</span></a></li>
            <li><a href="extProfile.jsp"><span>Profile</span></a></li>
            <li><a href="accmgmt.jsp"><span>Account Management</span></a></li> 
            <li><a href="help.jsp"><span>Help and Support Center</span></a></li>
            <li><a href="<c:url value='/j_spring_security_logout'/>"><span>Logout</span></a></li>   
        </ol>
         <center><h2>Make a Transfer</h2></center>
              <div id="mainDiv" style="width:100%">
                <div id="Div1" style="float:left;width:33%;">
                    <strong><label for="accountSelect" style="clear:both;">Select an Account to Pay from:</label></strong>
                    <br /><br />
                   <select id="fromAccountSelect" style="clear:both;display:block">
                    <c:forEach var="acc" items="${lstAccount}" varStatus="status">
                        <option>${acc.accNo}</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="Div2" style="float:left;width:33%">
                   <strong><label for="accountSelect" style="clear:both;">Transfer to Account Number :</label></strong>
                    <br /><br />
                   <input type="text" name="ToAccount" id="toAccount" maxlength="11">
                </div><div id="amt" style="float:left;width:33%;">
                <strong><label for="amount" style="clear:both;">Enter the amount to be transferred:</label></strong>
                 <br /><br />
                <input type="text" id="amount" class='decimal' maxlength="15"></div></div>
                   <div>
                      <br />
                      <br />
              </div>
              <br/><br/>
                  <div> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                      
                      <input id="SubmitTransfer" type="submit" value="Transfer" style="right: 50%" onclick="MakeTransfer()" /></div>
        </div>
      </div>
      <div class="footer">
        <p>Footer</p>
      </div>
</body>
</html>