<p>This project simply asks you to complete an AJAX demo project. It is separate from Harrison College but allows you to understand how AJAX works.</p>
<p><span class="_Tgc">AJAX is a method of exchanging data with a servlet and updating parts of a web page without reloading the entire page. AJAX uses JavaScript and XML to pass data between the JSP and the servlet. It allows you to create fast-dynamic data-driven JSPs.<br /></span></p>
<p><span class="_Tgc">You're already familiar with AJAX if you have used the auto-complete feature of Google search or any page that changes the list suggestions as you type it.</span></p>
<p><span class="_Tgc">AJAX is also used with chat-bots. You've seen chat-bots on retail web sites that invite you to submit a question in the small box below. The implication is that there is someone waiting for your questions. In reality, that someone is probably a database and a servlet. Think Eliza.</span></p>
<p>&nbsp;</p>
<p><span class="_Tgc">The following demo will help you understand how AJAX works. Don't just copy and paste the code. Make sure you understand what is happening.</span></p>
<p><span class="_Tgc">Create a dynamic web application. It will contain a servlet and a JSP.</span></p>
<p><span class="_Tgc">Add a JSP and to that add a form that will call your servlet, <code>AJAXServlet </code>. The form should contain a text input named "user" with an id of "user" and a submit button with an id of "submit". </span></p>
<p>&nbsp;</p>
<pre>&lt;h1&gt;AJAX Demo&lt;/h1&gt;<br />&lt;form id="form1" name="form1" action="AJAXServlet" method="get"&gt;<br />Enter your name: &lt;input type="text" id="user"/&gt;&lt;br/&gt;<br />&lt;input type="button" id="submit" value="Ajax Submit"/&gt;<br />&lt;/form&gt;<br />&lt;p/&gt;</pre>
<p><br />&nbsp;</p>
<p>Somewhere on your page add the following div:</p>
<pre id="message">&lt;div id="message"&gt;&lt;/div&gt;</pre>
<p>&nbsp;</p>
<p>Add the following script in the page head section:</p>
<pre> &lt;script src="http://code.jquery.com/jquery-latest.js"&gt;&lt;/script&gt;<br />&lt;script&gt;
    $(document).ready(function() {
    	$('#submit').click(function(event){
    		var username = $('#user').val();
    	$.get('ActionServlet',{user:username},function(responseText){
    		$('#message').text("&gt;&gt;&gt;" + responseText);
    	});
    	});
    });<br />&lt;/script&gt;

</pre>
<p>&nbsp;</p>
<p>Finally, add this input box outside of the form tags. Since it is not part of the above form it will not be submitted. Anything you type in it would be cleared when the page is refreshed. You'll enter some text in this box and then submit the form and notice that this input box remains ... meaning the page is not refreshed. Only part of the page is updated.</p>
<pre>If you refresh the entire page then the color you type here would be lost:<br />What is your favorite color: &lt;input type="text" name="color" id="color"/&gt;</pre>
<pre></pre>
<p>Your servlet is shown below. Some code has been cut but all relevant parts are displayed:</p>
<pre>@WebServlet("/AJAXServlet")
public class ActionServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = null;
		name = "Hello " + request.getParameter("user");
		if (request.getParameter("user").toString().equals("")){
			name = "Hello User";
		}
		response.setContentType("text/plain");//send plain text back to browser
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(name);

	}
}
</pre>
<p>&nbsp;</p>
