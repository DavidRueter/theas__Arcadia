<template>
    <b-container id="TestJQ1_Appvue" fluid="lg" style="padding: 0">

        <b-row no-gutters fluid>
            <b-col cols="12">
                <h3>Bust that cache! For Sure!</h3>
                <p>Hello World</p>
            </b-col>
        </b-row>

        <b-row no-gutters>
            <b-col cols="5">
               <TestBSVTable></TestBSVTable>
            </b-col>
        </b-row>


  <b-container>

</template>
 
<script>
    import TestBSVTable from  {{ '/vuecomp/TestBSVTable.vue'|theasResource }};

 
    export default {
        components: {
            TestBSVTable
        },
        data: function () {
            return {
                placeholder: 1

            }
        },

    }
</script>

<style>
    h1   {color: blue;}
    p    {color: red;}    
</style>
