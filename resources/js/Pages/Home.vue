<template>
  <Head>
    <title>Home</title>
    <meta
      type="description"
      content="Home information"
      head-key="description"
    >
  </Head>

  <h1 class="text-3xl">
    Home

  </h1>

  <div class="flex flex-col">

    <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
        <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
          <table class="min-w-full divide-y divide-gray-200">
            <tbody class="bg-white divide-y divide-gray-200">

            <tr>

              <th>dueDate</th>
              <th>description</th>
              <th>paymentRequestId</th>
              <th>paymentStatus</th>
              <th>totalAmount</th>

            </tr>

            <tr v-for="item in invoices" :key="item.id">


              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      {{ item.dueDate }}
                    </div>
                  </div>
                </div>
              </td>

              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      {{ item.description }}
                    </div>
                  </div>
                </div>
              </td>

              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      {{item.paymentRequestId != null? item.paymentRequestId: 'no invoice sent yet' }}
                    </div>
                  </div>
                </div>
              </td>





              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      {{item.paymentStatus != null? item.paymentStatus: 'no invoice sent yet' }}
                    </div>
                  </div>
                </div>
              </td>



              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      {{item.totalAmount != null? item.totalAmount: 'no invoice sent yet' }}

                    </div>
                  </div>
                </div>
              </td>

            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>




</template>
<script>
  export default {
    name: "Home",

    computed:{
  invoices(){

if (this.$page.props.invoices){
  return this.$page.props.invoices.response.data;
}else{

  this.$inertia.get('/invoice/view')


  return [];
}




      },

    }

  }

</script>

<style scoped>

</style>
