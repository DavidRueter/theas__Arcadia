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

<b-container style="padding: 0">

    <template>
        <theas-modal :message="theasParams.th$ErrorMessage" @clear-error="clearError"></theas-modal>

        <b-row>
            <b-col cols="5">
                <img src="/ArcadiaLogo_180.jpg"/>
            </b-col>
            <b-col cols="7">
                <a href="#" class="float-right">Login</a>
            </b-col>
        </b-row>


        <b-row>
            <b-col cols="12">
                <b-row class="row form-group nopadding">
                    <b-col cols="12" md="6">


                        <b-form-fieldset
                                description="Enter your user name."
                                label="User Name"
                                :label-cols="6"
                        >

                            <b-form-input v-model="theasParams.Login$UserName"
                                          type="text"
                                          placeholder="User name"
                                          @keyup.enter.native="submitForm"
                            ></b-form-input>

                        </b-form-fieldset>


                        <b-form-fieldset
                                description="Enter your password."
                                label="Password"
                                :label-cols="6"
                        >

                            <b-form-input v-model="theasParams.Login$Password"
                                          type="password"
                                          placeholder="Password"
                                          @keyup.enter.native="submitForm"
                            ></b-form-input>

                        </b-form-fieldset>


                        <b-form-checkbox id="ckbxRememberUser"
                                         v-model="theasParams.th$RememberUser"
                                         value="1"
                                         unchecked-value="1">
                            Keep me logged in on this computer
                        </b-form-checkbox>


                        <b-btn variant="success" @click.prevent="submitForm">Submit</b-btn>
                        <!--b-btn :variant="outline-warning" @click.prevent="cancelForm">Cancel</b-btn-->


                    </b-col>
                </b-row>

            </b-col>
        </b-row>

</b-container>

</main>


<!-- include file for end of body.  This includes needed javascript files, etc.-->
$thInclude_incThVue_BodyEnd


<!-- close the HTML -->
$thInclude_incThVue_HTMLEnd


