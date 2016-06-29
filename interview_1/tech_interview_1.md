<i>This interview was done over Google Hangouts with the duration of about 30 minutes.</i>

##HTTP

###What happens when you visit Google.com?

The browser looks up the ip address from a Domain Name Service (DNS).

The browser sends an HTTP GET request to the server.

There could be a redirect eg. https://facebook.com => https://www.facebook.com to ensure good search engine ranking.

Browser sends another GET request to the redirect: https://www.facebook.com

The server handles the request. 

#####If this was Rails...
![MVC](http://image.slidesharecdn.com/principlesofmvcforrailsdevelopers-150828125546-lva1-app6892/95/principles-of-mvc-for-rails-developers-8-638.jpg?cb=1440766607)

The browser may fetch other things like images from imgtags in the html.

A GET request is sent to all those assets:

* Images
http://static.ak.fbcdn.net/rsrc.php/z12E0/hash/8q2anwu7.gif
* CSS style sheets
http://static.ak.fbcdn.net/rsrc.php/z448Z/hash/2plh8s4n.css
* JavaScript files
http://static.ak.fbcdn.net/rsrc.php/zEMOA/hash/c8yzb6ub.js

Continues to do any AJAX.

######[more here](http://igoro.com/archive/what-really-happens-when-you-navigate-to-a-url/)


###What's the difference between HTTP and HTTPS?

With HTTP, data intercepted between the server and clients are decrytable. 

HTTPS use SSL encryption which encrypts data between server and client. Only the sender and the recipient can read the data even if somebody intercepts it.

###How do websites tell what browser you're using when you visit it?

In your GET request, there's a header called User-Agent that has the information. This is what a GET request looks like:

```
GET /tutorials/other/top-20-mysql-best-practices/ HTTP/1.1
Host: net.tutsplus.com
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729)
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7
Keep-Alive: 300
Connection: keep-alive
Cookie: PHPSESSID=r2t5uvjq435r4q7ib3vtdjq120
Pragma: no-cache
Cache-Control: no-cache
```
###What is the DOM?
The Document Object Model(DOM) is an object-oriented, tree structure representation of a webpage. 

It allows for further manipulation by a scripting language like JavaScript.

![DOM from wikipedia](https://upload.wikimedia.org/wikipedia/commons/5/5a/DOM-model.svg)

###What are the HTTP methods?

GET - Used to read/retrieve a webpage. (eg: Visiting Facebook.com)
POST - Used to create a new resource. (eg: Creating a Facebook post)
PUT - Used to update a resource. (eg: Edit a Facebook post)
DELETE - Deletes a resource. (eg: Delete a Facebook post)

##HMTL

###Why do you put the script tags inside the body and not the head?
"The problem with writing scripts at the head of a page is blocking. The browser must stop processing the page until the script is download, parsed and executed. The reason for this is pretty clear, these scripts might insert more into the page changing the result of the rendering, they also may remove things that dont need to be rendered, etc."

* Place library script such as the jQuery library in the head section.
* Place normal script in the head unless it becomes a performance/page load issue.
* Place script that impacts the render of the page at the end of the body (before the body closure).

######[more here](http://stackoverflow.com/questions/3531314/should-i-write-script-in-the-body-or-the-head-of-the-html)

##SQL

###What is an inner join?
An SQL JOIN clause is used to combine rows from two or more tables, based on a common field between them.

The most common type of join is: SQL INNER JOIN (simple join). An SQL INNER JOIN returns all rows from multiple tables where the join condition is met.

######[more here](http://www.w3schools.com/sql/sql_join.asp)