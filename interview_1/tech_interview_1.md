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

######more here: http://igoro.com/archive/what-really-happens-when-you-navigate-to-a-url/


###What's the difference between HTTP and HTTPS?