<template>
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
</template>

<script>
    // Import any Vue components we want to use.
    // Note that these can be via theasResource filter (for
    // cache-busting), but they must specify a fully-qualified
    // path (i.e. must start with a / )

    // TheasModal provides a dialog box for displaying errors.
    // Don't forget to include <TheasModal></TheasModal> somewhere in this page's
    // HTML template.
    import TheasModal from "{{ '/cdn/Theas.vue'|theasResource(quotes=False) }}";


    // We could (but are not required to) import any other Vue components we like.
    // These can be included in this page's HTML via "directives" (i.e.
    // custom HTML tags, such as <mMComponent></MyComponent>
    // import SingleFileComponent from "{{ '/vue/sample1.vue'|theasResource(quotes=False) }}";



    // Optionally, make some global changes to Vue
    // For example:

    // Let $http use Axios instead of vue-resource for HTTP calls
    // See:  https://medium.com/the-vue-point/retiring-vue-resource-871a82880af4
    //Vue.prototype.$http = axios;

    // Make config changes
    // See:  https://vuejs.org/v2/api/
    //Vue.config.productionTip = false;

    // Have Vue globally use some plugins or libraries.
    // See:  https://vuejsdevelopers.com/2017/04/22/vue-js-libraries-plugins/

    // But note that bootstrap-vue (which gets included automatically by
    // the include incThVue_BodyEnd) is loaded as a global content script...
    // which takes care of calling Vue.use() us automatically.
    //Vue.use('someModule')

    let thapp = new Vue({
        // Provide the name of the application's HTML element in the page's HTML
        el: '#thapp',

        data: {
            // Change Vue delimiters
            //   curly  will always refer to Jinja server-side templates
            //   square will always refer to Vue client-side templates
            delimiters: ["[[", "]]"],

            // The Vue data object is supposed to be a "plain" object
            // with only simple values.  But we want a Theas object
            // available to use, so we instantiate it here.

            // The Theas() object will be ignored by Vue:  properties will not
            // be reactive / cannot be used by Vue.
            // However we can access the properties and use the methods in our
            // event handlers and such.
            th: new Theas(),

            // theasParams is an object that will store all Theas parameters.
            // It is populated initially by server-side script.  The Theas
            // object (i.e. this.th) will also update this, such as on async calls
            // and the like.
            theasParams: JSON.parse('{{ "__th"|theasValuesJSON(as_string=True) }}')

        },

        // List the components that this Vue instance should use.
        // These must have been imported above.
        components: {
            TheasModal
            //SingleFileComponent
        },

        // Method that is executed when the Vue object is created.
        // We want the Theas object in th to have access to the Vue object,
        // so we set that reference here.
        created: function () {
            // Set the reference to the vue object in this.th
            // We needed to wait until now to do so (because the vue
            // object had to be created)
            this.th.setVue(this);
        },

        // Any arbitrary methods that we want this Vue instance to have.
        methods: {

            // Clear an error.  Useful with TheasDialog when the dialog is closed.
            // See:  <TheasDialog> in this page's HTML
            // Note that you cannot bind the event directly to th.clearError
            // as th is not managed by Vue...and thus calls to it are not proxied,
            // so when called there is not a good way to find the object's context.
            clearError: function () {
                let thatVue = this;

                thatVue.th.clearError();
            },

            submitForm: function (e) {

                let thatVue = this;

                thatVue.th.sendAsync({
                    url: '/login',
                    //asyncCmd: 'AsyncLogin',
                    //data: {}, //note: passes to @FormParams

                    onResponse: function (rd, response) {
                        // rd contains the response data split into an object (of name/value pairs)
                        // (might have been returned as either a string of URL-encoded name/value
                        // pairs, or as a JSON strong)

                        // response contains the complete response object, in which .data contains
                        // the raw data that was received.

                        if (thatVue.theasParams['th$LoggedIn'] == "1" &&
                            thatVue.theasParams['th$NextPage']) {
                            window.location = thatVue.theasParams['th$NextPage'];
                        }

                    }
                });

            }

        }
    });


</script>