<template>
  <Head>
    <title>Home</title>
    <meta
      type="description"
      content="Home information"
      head-key="description"
    >
  </Head>
  <hr>
  {{message}}
  <hr>
  <div class="main">

    <div v-for="plan in plans" :key="plan.id">
      <h1>{{plan.price}}</h1>
      <p>{{plan.name}}</p>
      <ul>

        <li> {{plan.invoice_period}} {{plan.invoice_interval}}</li>

      </ul>
      <a v-on:click="subscribe('1', plan.id,subscriber)" target="_blank">full paid</a>
      <a v-on:click="subscribe('2', plan.id,subscriber)" target="_blank">2 installment</a>
      <a v-on:click="subscribe('3', plan.id,subscriber)" target="_blank">3 installment</a>
    </div>


  </div>

</template>


<script>
export default {

  layout: null,
computed: {
message() {
return this.$page.props.message;
      },

  plans(){
    return this.$page.props.plans;

  } ,
  subscriber(){
    return this.$page.props.subscriber;

  }
    }
  };



</script>

<script setup >
import {Inertia} from "@inertiajs/inertia";


function subscribe(e,id,subscriber){
console.log(subscriber);
Inertia.post('/order/store', {package : e,package_id:id,subscriber } );
  }


</script>

<style scoped>
@import "../../../css/package.css";
</style>
