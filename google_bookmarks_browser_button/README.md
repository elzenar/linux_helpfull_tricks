This is a Javascript code should be added to bookmark button in web browser like Google Chrome or Mozilla Firefox.
It will open a NEW WINDOW in a web browser to save a current page url to Google Bookmarks

    javascript:(function(){var%20a=window,b=document,c=encodeURIComponent,d=a.open("http://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk="+c(b.location)+"&title="+c(b.title)+"&annotation="+c(b.title),"bkmk_popup"    ,"left="+((a.screenX||a.screenLeft)+10)+",top="+((a.screenY||a.screenTop)+10)+",height=420px,width=550px,resizable=1,alwaysRaised=1");a.setTimeout(function(){d.focus()},300)})();

This script will open a NEW TAB in a web browser to save a current page url to Google Bookmarks

    javascript:(function(){var%20a=window,b=document,c=encodeURIComponent,d=a.open("http://www.google.com/bookmarks/mark?op=edit&output=popup&bkmk="+c(b.location)+"&title="+c(b.title)+"&annotation="+c(b.title),"bkmk_popup"    );a.setTimeout(function(){d.focus()},300)})();
