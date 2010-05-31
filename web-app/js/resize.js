/**
*                                                             @@@@
*                                                            (o o)                
* -------------------------------------------------------oOOo-(_)-oOOo--------
* resize_css.js by jason hinkle <www.verysimple.com>
*
* description
* this javascript handles the onresize event and updates the className property of a div
* tag based on the width of the browser window.  this allows you to style your page 
* differently based on the width of the browser.
* 
* instructions:
* 1. include this file on your html page
* 2. make sure you have a div tag called 'resize_css'  on your page (or rename the var below)
* 3. put any elements you wish to be resized inside the 'resize_css' div
* 4. edit your css code to style differently based on the classname of the resize_css div like so:
*      .narrow #mytag {width: 600px;}
*      .medium #mytag {width: 100%;}
*      .wide #mytag {width: 900px}
*
* license: GPL <http://www.gnu.org/copyleft/gpl.html>
* ----------------------------------------------------------------------------
*/

var resize_div_id = 'resize_css';
var narrow_limit = 600;
var wide_limit = 900;

var prev_w = 0;
var dupe_count = 0;

function resize_css()
{
    var w = document.body.clientWidth; //document.body.offsetWidth;
    var c = (w < narrow_limit) ? 'narrow' : (w > wide_limit) ? 'wide' : 'medium';
    
    // this prevents an infinite loop problem in IE 6
    if (prev_w == w && dupe_count++ > 10)
    {
        alert('Dynamic resize CSS has been disabled to prevent an infinite loop. (Are you using IE 6?)');
        window.onresize = null;
    }

    document.getElementById(resize_div_id).className = c;
    prev_w = w;
}

// set the event handlers
window.onresize = resize_css;
window.onload = resize_css;
