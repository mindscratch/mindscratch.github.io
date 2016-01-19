+++
categories = ["misc"]
date = "2016-01-18T20:06:53-05:00"
title = "Secure Email on Mac OS X"
menu = "main"
+++

This will be quick. I use GMail but it lacks the native ability to sign and
encrypt email. I did some looking around for desktop email clients for Mac OS X
that support [S/MIME](https://en.wikipedia.org/wiki/S/MIME).

I ended up going with [Airmail 2](http://airmailapp.com/) because it has S/MIME
support and it supports [Markdown](https://daringfireball.net/projects/markdown/) which I like to use.

S/MIME support is provided by a [plugin](http://airmailapp.com/smime). Follow
the instructions after going to the link, you'll ultimately download a zip file.

Open Airmail, click on the `Window` menu and select `Show Plugins Folder...`.
Extract the S/MIME plugin zip file and copy the `.bundle` file into the plugins
folder.

Click on the `Window` menu and choose `Plugins` and click `Reload Plugins`.

You should be all set to send signed and encrypted email.

__note__: Comodo offers a [free email certificate](https://www.comodo.com/home/email-security/free-email-certificate.php).
