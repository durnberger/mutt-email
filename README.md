---
title: Mutt Configuration Files 
author: Paul Dürnberger	
date: 02 August 2023 
tags: [ mutt, email ]
---

test

# Mutt Configuration Files

## Introduction

I had never used Mutt before, and I spent a lot of time on the internet researching Mutt's configuration. It was a steep learning curve, and had it not been for the following articles, I would have been left scratching my head!

- [therandymon.com](http://therandymon.com/woodnotes/mutt/node24.html)
- [www.xmodulo.com](https://www.xmodulo.com/mutt-email-client-encrypted-passwords.html)
- [jasonwryan.com](http://jasonwryan.com/blog/2012/05/12/mutt/)

I would recommend anyone new to the subject visit those pages. 

My thanks to the authors in each case.

## File Locations 

Each of the mutt configuration files has to be located in `~/.mutt`.

The two bash scripts (`mutt-print.sh` and `browser-norace.sh`) need to be placed in`~/bin`.

## Setting the Password

As per [https://www.xmodulo.com/mutt-email-client-encrypted-passwords.html](https://www.xmodulo.com/mutt-email-client-encrypted-passwords.html), I created a file `~/.mutt/password` into which I typed my passwords;

```bash
set smtp_pass="XXXXXXX"
set imap_pass="XXXXXXX"
```

I then generated an encrypted `gpg` file using the command `$ gpg -r myemail@email.com -e ~/.mutt/password`. Having done so the original `password` file was deleted.

Finally, I added `source "gpg -d ~/.mutt/password.gpg |"` to the end of `~/.mutt/muttrc` so that Mutt would know where to find the passwords.

With the configuration complete, I started Mutt from the command line. Mutt tried to connect to my email provider, but I kept receiving a message to say that login had failed. It turns out the problem was a pair of quote marks! 

The passwords in the password file should have been surrounded by single quote marks, not double. The correct configuration is;

```bash
set smtp_pass='XXXXXXX'
set imap_pass='XXXXXXX'
```

Having recreated `password.gpg`, I was able to log in without a problem.

