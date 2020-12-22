$thInclude_incThVue_HTMLStart
<meta name="apple-mobile-web-app-title" content="ArcadiaCabs">
<meta name="application-name" content="ArcadiaCabs">
<title>Login</title>


<!--
Include main javascript file for this page.  Declares vue object, etc.

It is tempting for convenience to include this in this same file in a <script></script> block
(aka "content script"), but that will not work since the script needs to import modules.

Since modules are being used, this script itself must also be a module.
-->
<script type="module" src={{ 'login.js'|theasResource }}></script>

<!-- include code at the end of the HTML header / the start of the body -->
$thInclude_incThVue_BodyStart

    <main>
        <p>Hello World (global style)</p>
        <div id="thapp">This whole div is replaced by Vue-rendered content</div>
    </main>

<!-- include file for end of body.  This includes needed javascript files, etc.-->
$thInclude_incThVue_BodyEnd


<!-- close the HTML -->
$thInclude_incThVue_HTMLEnd


