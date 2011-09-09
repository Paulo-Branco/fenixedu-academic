<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<html:html xhtml="true">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<style type="text/css">

body {
	color: #333;
	text-align: left;
	background: #369;
	margin: 0;
	padding: 0;
	font-size: 71%;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	}

.center { text-align: center; }
.left { text-align: left; }

table {
	color: #333;
	}

h1, h2, h3 { font-family: Trebuchet MS, Arial, Helvetica, sans-serif; }

h1	{
	font-size: 1.7em;
	color: #fff;
	}

h2	{
	font-size: 1.7em;
	color: #223d4a;
	}

h3 {
	font-size: 1.25em;
	color: #223d4a;
	}
h4 {
	font-size: 1.0em;
	color: #223d4a;
	}

a:link, a:visited {
	color: #00427b;
	text-decoration: underline;
	}

a:hover {
	color: #00427b;
	text-decoration: none;
	}

.centerContent {
	text-align: center;
	}

#header {
	display: block;
	height: 70px;
	background: url("../images/header_bck.gif") repeat-x top;
	padding: 0 0 0 20px;
	margin: 0;
	}
	
#header p {
	position: absolute;
	top: 30px;
	right: 20px;
	font-family: "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	font-size: 1.15em;
	font-weight: bold;
	color: #fff;
	margin: 0;
	padding: 0;
	}

#hdr-nav {
	position: absolute;
	top: 0;
	right: 15px;
	width: 250px;
	text-align: right;
	margin-right: -15px; /* IE5/Mac hor-scr hack */
	padding: 0;
	}

#hdr-nav img{
	border: 0;
	}

#navgeral ul {
	margin: 0;
	padding: 0;
	}
#navgeral ul li {
	margin: 0;
	padding: 0;
	}
#navgeral {
	float: left;
	width: 100%;
	font-size: 1.0em;
	padding-top: 0.25em;
	}
#navgeral ul {
	margin: 0;
	margin-left: 150px;
	list-style: none;
	}
#navgeral li {
	float: left;
	margin: 0;
	padding: 0;
	}
#navgeral li a {
	font-family: "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	float: left;
	margin: 0 9px 0 9px;
	padding: 0.25em 0 0.15em 0;
	font-size: 100%;
	font-weight: normal;
	text-decoration: none;
	white-space: nowrap;
	}
#navgeral span {	
	float: left;
	margin: 0 1px 0 0;
	padding: 0.75em 1em;
	font-size: 100%;
	font-weight: normal;
	text-decoration: none;
	}
#navgeral {
border-bottom: 2px solid #223D4A;
background: #c0a488;  
}
#navgeral li a {
color: #223d4a;
border-bottom: 4px solid #c0a488;
}
#navgeral li a:hover {
text-decoration: underline  /* show to IE5 */
}
#navgeral a.active, #navgeral li.active a {
border-bottom: 4px solid #223D4A;
}

body {
voice-family: "\"}\""; 
voice-family: inherit;
}
#navgeral li a:hover {
text-decoration: none;
border-bottom: 4px solid #369; 
}


div.clear { clear: both; }

#logged {
	clear: both;
	float: left; width: 100%; /* show to IE5 */
	background: #cc9;
	font-size: 0.9em;
	color: #666;
	border-bottom: 1px solid #C0A488;
	margin: 0;
	padding: 5px 10px 5px 10px;
	voice-family: "\"}\"";
	voice-family:inherit;
	float: none;
	width: auto;
	}

#logged * {  margin: 0; padding: 0; } /* duplicate line because of IE5 filter */
#logged * {  margin: 0; padding: 0; }

.user {
	float: left;
	width: 300px;
	margin: 0;
	padding: 0;
	/*background: #f00;*/
	}
	
.info {
	float: right;
	width: 300px;
	text-align: right;
	vertical-align: top;
	margin: 0;
	padding: 0;
	/*background: #f00;*/
	}

#bodycontent {
}

#bodycontent {
	/*font-size: 11px; line-height: 16px; */
	line-height: 1.45em;
	color: #333;
	background: #fff;
	padding: 20px;
	}

#footer {
	background: #C0A488;
	padding: 10px;
	border-bottom: 10px solid #223D4A;
	}

#footer p {
	font-family: "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	font-size: 1.0em;
	line-height: 1.25em;
	text-align: center;
	color: #333;
	margin: 0;
	}
	
.wrapper {
	/*position: relative; */
	background: #fff;
	}
	
.clear {
	clear: both;
	background: #fff;
	}
	
#navlateral, #navlateral_photos {
	font-size: 71%;

	color: #333;
	background: #fff;
	padding: 20px;
	}

#navlateral {
	border-right: 1px solid #ccc;
	}
	
#navlateral ul {
	list-style: none;
	margin: 0;
	}

#navlateral li {
	list-style: none;
	background: url("../images/red-list-bullet.gif") no-repeat 0 2px;
	/*font: 10px Verdana, Arial, Helvetica, sans-serif;*/
	
	font-size: 10px;
	padding: 0 0 0 10px;
	margin: 5px 0 5px 0;
	}
	
#navlateral a:link, #navlateral a:visited {
	color:#666;
	text-decoration: none;
	}

#navlateral a:hover {
	color:#666;
	text-decoration: underline;
	}

.error {
	font-weight: bold;
	color: #c00;
	background: #ffc;
	}

.inputbutton {
	font: 11px Verdana, Arial, Helvetica, sans-serif;
	color: #333;
	background: #b5bdd6;
	width: 100px;
}

.inputbuttonSmall {
	font: 11px Verdana, Arial, Helvetica, sans-serif;
	color: #333;
	background-color: #b5bdd6;
	}

table { line-height: 1.45em; }
table { font-size: 100%; }
table table { font-size: 100%; }

.infoop {
	background-color: #EBECED;
	vertical-align: middle;
	padding: 10px 10px;
	border-bottom: 1px solid #ccc;
	}
	
.infoselected {
	background: #ffc;
	padding: 10px 20px;
	border: 1px dotted #333;
	text-align: left;
	}

.infotable {
	background: #EBECED;
	padding: 20px;
	border: 1px solid #ccc;
	}

.formTD	{
	text-align: left;
	height: 30px;
	width: 100px;
	}
	
.listClasses	{
	background: #EBECED;
	border: 1px solid #ccc;
	text-align: center;
	height: 30px;
	}

.listClasses-header	{
	background: #ccc;
	font-weight: bold;
	text-align: center;
	padding: 5px;
	}

table.style1 {
	margin-bottom: 1em;
	border: 2px solid #ccc;
	border-collapse: collapse;
	}
table.style1 tr.header {
	border-bottom: 2px solid #ccc;
	}
table.style1 td.listClasses-header {
	padding: 0.5em 1em;
	border: 1px solid #ddd;
	background-color: #eee;
	}
table.style1 td.listClasses {
	padding: 0 1em;
	background-color: #fafafa;
	border: none;
	border: 1px solid #eee;
	}
table.style1 td.courses {
	border-right: 1px solid #eee;
	background-color: #ffe;
	padding: 0 1em;
	}

table tr.highlight td.listClasses {
background-color: #e9fee9;
}

.greytxt {
	font: 11px  Arial, Helvetica, sans-serif;
	color: #666;
	}
	
.redtxt {
	color: #c00;
	}
	
.bluetxt {
	color: #369;
	}
	
.inline {
	display: inline;
	}
	
.px9-b {
	font: bold 9px/1em Verdana, Arial, Helvetica, sans-serif;
	color: #333;
	background-color: transparent;
	}

.emphasis {
	font: bold 14px "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #930;
	}
	
.emphasis-box {
	font: bold 14px "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #fff;
	background: #930;
	padding: 3px 6px 3px 6px;
	}
	
.examMapContainer{
	margin-left: 5px;
	margin-bottom: 5px;	
	text-align: left;
}

.courseList{
	text-align:left;
	vertical-align: top;
}

.examMap{
	border:1px solid #000;
}

.examMap_header_first{	
	color: #fff;
	font-weight: bold;
	border-bottom: 1px solid #000;	
	background: #000;
	text-align: center;	
	width: 16.7%;
	}

.examMap_header{
	color: #fff;
	font-weight: bold;	
	border-left: 1px solid #000;
	border-bottom: 1px solid #000;
	background: #000;
	text-align: center;
	width: 16.7%;	
	}

.exam_cell_day_first{	
	color: #000;
	text-align: right;
	background: #EBECED;
	}

.exam_cell_day{
	color: #000;
	text-align: right;
	border-left: 1px solid #000;
	background: #EBECED;
	}

.exam_cell_content{
	text-align: left;
	color: #000;
	border-left: 1px solid #000;
	border-bottom: 1px solid #000;	
	background: #EBECED;
	}

.exam_cell_content_first{
	text-align: left;
	color: #000;
	border-bottom: 1px solid #000;
	background: #EBECED;
	}

.exam_cell_content_bottom{
	text-align: left;
	color: #000;
	border-left: 1px solid #000;
	background: #EBECED;
	}

.exam_cell_content_first_bottom{
	text-align: left;
	color: #000;
	background: #EBECED;
	}
	
.photo img {
	border: 5px solid #ccc;
	margin: 5px;
	}

body.registration {
	font: 14px "Courier New", Courier, monospace;
	color: #000;
	text-align: justify;
	background: #fff;
	}
	
table.registration {	
	font: 14px Courier;
	text-align: justify;
	}
	
.registration_cell  {
	/*font-size: 12px;*/
	color: #000;
	}	
	
.break-before {
	page-break-before:always;
	}	
		
#pagewrapper_registration {
	width: 800px;
	margin-right:auto;
	margin-left:auto;
	margin-top:30px;
	padding:0px;
	text-align: left;
	}
	
h2.diploma_posGrad	{
	font: bold 28px "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #223d4a;
	/*color: #036;*/
	}	
	
h3.diploma_posGrad {
	font: bold 18px "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #223d4a;
	}	
	
h4.diploma_posGrad {
	font: 18px "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: #223d4a;
	}	
	
h2.registration	{
	font: 20px Courier;
	color: #000;
	}

h3.registration	{
	font: 16px Courier;
	color: #000;
	}
	
h4.registration {
	font: bold 18px "Trebuchet MS", Arial, Helvetica, sans-serif;		
	color: #000;
	}
	
/*not used*/
.sucessfulOperarion {
	font: bold 11px Verdana, Arial, Helvetica, sans-serif;
	color: darkblue;
	}

/*not used*/
.inputlist {
	font: 11px Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #333;
	}
	
select.courseEnroll {
	font: 9px Verdana, Arial, Helvetica, sans-serif;
	width: 100%;
	}
select.degrees {
	font: 10px Verdana, Arial, Helvetica, sans-serif;
	width: 100%;
	}
	
.infoIcons {
	background-color: #EBECED;
	vertical-align: middle;
	padding-left: 10px;
	border-bottom: 1px solid #ccc;
	width: 15px;
	}

.infoop2 {
	background-color: #fafade;
	vertical-align: middle;
	padding: 0.5em 0.75em;
	border-bottom: 1px solid #f2f2a6;
	}

.infoop2 p { margin: 0.25em 0; }

.infoop3 {
	background-color: #fafade;
	padding: 2px 4px;
	border-bottom: 1px solid #f2f2a6;
	}
.infoop4 {
	background-color: #ffc;
	padding: 2px 4px;
	}
	
.infoop5 {
	background-color: #ebf5ea;
	vertical-align: middle;
	padding: 0.5em 0.75em;
	border-bottom: 1px solid #cce5c7;
	}

.infoop5 p { margin: 0.25em 0; }
	
.infoop-blue {
	background-color: #9CF;
	vertical-align: middle;
	padding: 10px 10px;
	border-bottom: 1px solid #ccc;
	}
	
.bottomborder {
	border-bottom: 1px solid #ccc;
	}
	
.listClassesWhite	{
	border: 1px solid #ccc;
	text-align: center;
	height: 30px;
	}

.listClasses-subheader{
	color:#FFF;
	background:#999; 
	padding:5px;
	font-weight:bold;
}

.listClasses-supheader{
	color:#FFF;
	background:#4F82B5; 
	padding:5px;
	font-weight:bold;
	text-align: center;
}

.listClasses-subheader a:link, .listClasses-subheader a:visited{
	color:#FFF;
	text-decoration:underline;
	font-weight:normal;	
}

.listClasses-subheader a:hover{
	color:#FFF;
	text-decoration:none;
	font-weight:normal;
}

.tall-td {
	height: 50px;
	}

.ects_headertable {
	border: 1px solid #000;
	}

.ects_headertable td {
	color: #333;
	padding: 5px;
	background:#EBECED;
	}
	
table#ects {
	page-break-after: always;
	}

.verb-table {
	border: 1px solid #333;
	}

.verb-hdr {
	padding: 5px;
	font-weight: bold;
	text-align: center;
	background: #ccc;
	border-right: 1px solid #333;
	border-bottom: 1px solid #333;
	}

.verb-hrd-last {
	padding: 5px;
	font-weight: bold;
	text-align: center;
	background: #ccc;
	border-bottom: 1px solid #333;
	}
	
.verb-td {
	padding: 5px;
	background: #ebeced;
	border-right: 1px solid #333;   
	border-bottom: 1px solid #ccc;                               
	}
	
.verb-td-last {
	padding: 5px;
	background: #ebeced;  
	border-bottom: 1px solid #ccc;                               
	}

.verb-finalrow {
	padding: 5px;
	background: #ebeced;
	border-right: 1px solid #333;
	}

.verb-finalrow-last {
	padding: 5px;
	background: #ebeced;
	}

div.autoComplete { 
      position:absolute; 
      width:250px; 
      background-color:white; 
      border:1px solid #888; 
      margin:0px; 
      padding:0px; 
    } 
ul.autoCompleteItems  { 
      list-style-type: none; 
      margin:0px;
      padding:0px;
  } 
 
ul.autoCompleteItems li.selected { background-color:  #cef; }

.altJavaScriptSubmitButton { display:block; }

.showHideDetailsButton { display:none; }

body {
	font: 11pt Arial, Helvetica, sans-serif;
	color: #fff;
	text-align: left;
	margin: 0;
	margin-left: 25px;
	}
	
table {
	font: 9pt Arial, Helvetica, sans-serif;
	color: black;
	}

h2	{
	font: bold 16pt "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: black;
	}

h3 {
	font: bold 12pt "Trebuchet MS", Arial, Helvetica, sans-serif;
	color: grey;
	}

.print_smaller {
	font-size: 80%;	
	}

a:link {
	font: 9pt Arial, Helvetica, sans-serif;
	color: black;
	text-decoration: underline;
	}

a:visited {
	font: 9pt Arial, Helvetica, sans-serif;
	color: #00427b;
	}

.centerContent {
	text-align: center;
	}
	
#header *, #footer *, #navgeral *, #navopgeral *, #navlateral *, #hdr-nav *, #logged * {
    display: none;
	}

#bodycontent {
	width: 100%;
	/*font: 11pt/0.5em Arial, Helvetica, sans-serif;*/ /*corrected print line-height problem*/
	color: #000;
	margin: 0;
	padding 0;
	vertical-align: top;
	}

.navlateral-td {
	display: none;
	}
	
.navlateral-td {
	display: none;
	}

.error {
	font: bold 11pt Arial, Helvetica, sans-serif;
	color: red;
	background: yellow;
	}	

.sucessfulOperarion {
	font: bold 11pt Arial, Helvetica, sans-serif;
	color: blue;
	}

.inputlist {
	font: 11pt Arial, Helvetica, sans-serif;
	color: black;
	}
	
.inputbutton {
	display: none;
}

.inputbuttonSmall {
	font: 11pt Arial, Helvetica, sans-serif;
	color: black;
	background: #b5bdd6;
	}

.infoIcons {
	background: #ebeced;
	vertical-align: middle;
	padding-left: 10pt;
	border-bottom: 1pt solid #ccc;
	width: 15pt;
	}
	
.infoop {
	background-color: #ebeced;
	vertical-align: middle;
	padding: 5pt 5pt;
	border-bottom: 1pt solid #ccc;
	}
	
.infoselected {
	background-color: #ffc;
	padding: 5pt 10pt;
	border: 1px dotted #333;
	text-align: left;
	}

.infotable {
	background: #ebeced;
	padding: 10pt;
	border: 1pt solid #ccc;
	}                         

.bottomborder {
	border-bottom: 1pt solid #ccc;
	}  
	
.formTD	{
	text-align: left;
	height: 15pt;
	width: 100pt;
	}
	
.listClasses	{
	background: #ebeced;
	border: 1pt solid #ccc;
	text-align: center;
	height: 15pt;
	}
	
.listClasses-header	{
	background: #999;
	font-weight: bold;
	text-align: center;
	padding: 2pt;
	}

.tall-td {
	height: 50pt;
	}

.ects_headertable {
	border: 1px solid #666;
	}

.ects_headertable td {
	color: #333;
	padding: 5px;
	background:#EBECED;
	}
	
table#ects {
	page-break-after: always;
	}

table.timetable tr {
	font-size: 6px;
}	

table.timetable .period-hours {
	font-size: 7px;
}	

.verb-table {
	border: 1pt solid #333;
	align: center;
	}

.verb-hdr {
	font-weight: bold;
	text-align: center;
	background: #ccc;
	border-right: 1pt solid #333;
	border-bottom: 1pt solid #333;
	}

.verb-hrd-last {
	font-weight: bold;
	text-align: center;
	background: #ccc;
	border-bottom: 1pt solid #333;
	}
	
.verb-td {
	border-right: 1pt solid #333;   
	border-bottom: 1pt dotted #333;                               
	}
	
.verb-td-last { 
	border-bottom: 1pt dotted #333;                               
	}

.verb-finalrow {
	border-right: 1pt solid #333;
	}

.greytxt {
	font: 11pt  Arial, Helvetica, sans-serif;
	color: #666;
	}

.inline {
	display: inline;
	}
	
.px9-b {
	font: bold 8pt/1em Arial, Helvetica, sans-serif;
	color: #333;
	}
	
.examMapContainer{
	margin-left: 5px;
	margin-bottom: 5px;	
	text-align: left;
}

.courseList{
	text-align:left;
	vertical-align: top;
}

.examMap{
	border:1pt solid #000;
}

.examMap_header_first{	
	color: #fff;
	font-weight: bold;
	border-bottom: 1pt solid #000;	
	background: #000;
	text-align: center;	
	width: 16.7%;
	}

.examMap_header{
	color: #fff;
	font-weight: bold;	
	border-left: 1pt solid #000;
	border-bottom: 1pt solid #000;
	background: #000;
	text-align: center;
	width: 16.7%;	
	}

.exam_cell_day_first{	
	color: #000;
	text-align: right;
	}

.exam_cell_day{
	color: #000;
	text-align: right;
	border-left: 1pt solid #000;
	}

.exam_cell_content{
	text-align: left;
	color: #000;
	border-left: 1pt solid #000;
	border-bottom: 1pt solid #000;	
	}

.exam_cell_content_first{
	text-align: left;
	color: #000;
	border-bottom: 1pt solid #000;
	}

.exam_cell_content_bottom{
	text-align: left;
	color: #000;
	border-left: 1pt solid #000;
	}

.exam_cell_content_first_bottom{
	text-align: left;
	color: #000;
	}

body.registration {
	font-size: 11pt;
	font-family: "Courier New", Courier, monospace;
	color: #000;
	text-align: justify;
	}
	
table.registration {	
	font-size: 11pt;
	font-family: "Courier New", Courier, monospace;
	text-align: justify;
	}
	
h2.registration	{
	font-size: 15pt;
	font-family: "Courier New", Courier, monospace;
	color: #000;
	}	
	
h3.registration	{
	font-size: 13pt;
	font-family: "Courier New", Courier, monospace;
	color: #000;
	}
	
.break-before {
	page-break-before:always;
	}		
	
.invisible { display: none;	}
.printhidden { display: none; } /**/ 

.p_mvert015 p { margin: 0.15em 0; }
.smalltxt { font-size: 0.85em;}
.prenomargin { margin: 0; padding: 0; }

.aleft { text-align: left; }
.aright { text-align: right; }
.acenter { text-align: center; }
.hidden { display: none; }
.bold { font-weight: bold; }
.nobullet { list-style: none; }
.noindent { margin-left: 0; padding-left: 0; }

.pbottom1 { padding-bottom: 1em;}
.pbottom2 { padding-bottom: 2em;}
.pbottom3 { padding-bottom: 3em;}
.mtop0 { margin-top: 0;}
.mtop05 { margin-top: 0.5em;}
.mtop1 { margin-top: 1em;}
.mtop2 { margin-top: 2em;}
.mtop3 { margin-top: 3em;}
.mbottom0 { margin-bottom: 0;}
.mbottom1 { margin-bottom: 1em;}
.mbottom2 { margin-bottom: 2em;}
.mbottom3 { margin-bottom: 3em;}
.mleft0 { margin-left: 0; }
.mleft1 { margin-left: 1em; }
.mvert0 { margin-top: 0; margin-bottom: 0; }
.mvert1 { margin-top: 1em; margin-bottom: 1em; }
.mvert2 { margin-top: 2em; margin-bottom: 2em; }
.mvert3 { margin-top: 3em; margin-bottom: 3em; }
.indent0 { margin-left: 0; }
.indent1 { margin-left: 1em; }
.indent2 { margin-left: 2em; }
.indent3 { margin-left: 3em; }
.indent4 { margin-left: 4em; }
.indent5 { margin-left: 5em; }
.indent6 { margin-left: 6em; }
.indent9 { margin-left: 9em; }
.indent12 { margin-left: 12em; }
.indent15 { margin-left: 15em; }
.valigntop { vertical-align: top; }

ul.indent0 { margin-left: 0; padding-left: 0; }
table.mtop05 { margin-top: 0.5em; }
table.smallmargin td { padding: 0.25em; }
td.pleft1 { padding-left: 1em; }
td.pleft2 { padding-left: 2em; }
td.pleft3 { padding-left: 3em; }
td.pleft4 { padding-left: 4em; }
td.pleft5 { padding-left: 5em; }
td.pleft6 { padding-left: 6em; }

.breakafter {page-break-after: always; }
table.showborder { border-collapse: collapse; }
table.showborder th, table.showborder td { padding: 2px 4px; }
table.showborder th { border: 1px solid #aaa; }
table.showborder td { border: 1px solid #aaa; }
.printbold { font-weight: bold; }

.toprint { display: block;}

table.printborder { border-collapse: collapse; }
table.printborder th, table.printborder td { border: 1px solid #888; }
table.tpadding1 th, table.tpadding1 td { padding: 0.15em 0.5em;}


.prtwidth100pc { width: 100%; }

/* student curriculum display */
.col01 { width: auto; }
.col02 { width: 6%; }
.col03 { width: 6%; }
.col04 { width: 3%; }
.col05 { width: 9%; }
.col06 { width: 3%; }
.col07 { width: 3%; }
.col08 { width: 3%; }
.col09 { width: 3%; }
.col10 { width: 6%; }
.col11 { width: 6%; }
.col12 { width: 7%; }
.col13 { width: 5%; }
</style>
</head>

<body class="registration" id="pagewrapper_registration">

<jsp:include page="./printRegistrationDeclarationTemplate.jsp" flush="true" />
<div class="break-before">
</div>

<jsp:include page="./printRegistrationDeclarationTemplate.jsp" flush="true" />
<div class="break-before">
</div>

<jsp:include page="./printRegistrationDeclarationTemplate.jsp" flush="true" />
<div class="break-before">
</div>

<jsp:include page="./printRegistrationDeclarationTemplate.jsp" flush="true" />



</body>

</html:html>
