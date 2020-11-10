<template>
    <b-container id="order_appvue" fluid="lg" style="padding: 0">

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
