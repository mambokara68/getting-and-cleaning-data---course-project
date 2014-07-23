getting-and-cleaning-data---course-project
==========================================
<h1>How does my script work??</h1>
Nothing special to note. You have to run the entire script and wait for the finale result.

You must take care of the location of the Samsung files to be loaded, they MUST be directly in the working directory (no directory Train or test), all the files are in one unique directory, the wd...

X train and Xtest data take a long time to be read, don't worry...

Explanation of the different steps of my script are written on the script.

<h2>Important source files</h2>
app.js - Main js entrypoint for Doodle Paint<br />
popup.js - Pokki popup wrapper<br />
window.html - HTML entrypoint for Doodle Paint<br />
default.css - All Doodle Paint CSS<br />
<br />
ToolBase.js - Abstract base class for painting Tools<br />
*****Tool.js - Painting tool implementations, pencil, brush, circle, spray, etc.<br />
