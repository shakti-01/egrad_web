<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%
    // Set the countdown end time in the session
    if (session.getAttribute("countDownDate") == null) {
        Long countDownDate = new Date().getTime() + 100000;
        session.setAttribute("countDownDate", countDownDate);
    }
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Countdown Timer</title>
	<script>
		var countDownDate = <%= session.getAttribute("countDownDate") %>;
		//var countDownDate = new Date().getTime() + 100000; // 100 seconds from now
		var x = setInterval(function() {
			var now = new Date().getTime();
			var distance = countDownDate - now;

			var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
			var seconds = Math.floor((distance % (1000 * 60)) / 1000);

			document.getElementById("countdown").innerHTML = minutes + "m " + seconds + "s ";

			if (distance < 0) {
				clearInterval(x);
				document.getElementById("countdown").innerHTML = "EXPIRED";
				window.location.href = "exam_result.jsp";
			}
		}, 1000);
		// Function to set a cookie
	    function setCookie(name, value, days) {
	        var expires = "";
	        if (days) {
	            var date = new Date();
	            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
	            expires = "; expires=" + date.toUTCString();
	        }
	        document.cookie = name + "=" + (value || "") + expires + "; path=/";
	    }

	    // Function to get a cookie
	    function getCookie(name) {
	        var nameEQ = name + "=";
	        var ca = document.cookie.split(';');
	        for (var i = 0; i < ca.length; i++) {
	            var c = ca[i];
	            while (c.charAt(0) == ' ') c = c.substring(1, c.length);
	            if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
	        }
	        return null;
	    }
	</script>
</head>
<body>
	<p>Countdown Timer:</p>
	<div id="countdown"></div>
</body>
</html>
