<template>
  <Head>
    <title>{{order.name}}</title>
    <meta
      type="description"
      content="Home information"
      head-key="description"
    >
  </Head>



  <div class="flex flex-col">
  <span>totalAmount : {{order.totalAmount}}  </span>
    <br>  <span>supscriber : {{order.name}}  </span>
    <br>
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

            <tr v-for="item in order.installments" :key="item.id">


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
                      {{item.invoice != null? item.invoice.paymentRequestId: 'no invoice sent yet' }}
                    </div>
                  </div>
                </div>
              </td>      <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      {{item.invoice != null? item.invoice.paymentStatus: 'no invoice sent yet' }}
                    </div>
                  </div>
                </div>
              </td>

              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">
                      {{item.invoice != null? item.invoice.totalAmount: 'no invoice sent yet' }}
                    </div>
                  </div>
                </div>
              </td>




              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">

                    </div>
                  </div>
                </div>
              </td>



              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div>
                    <div class="text-sm font-medium text-gray-900">

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

    computed: {
      order(){
        return this.$page.props.order;

      }
    }
  };



</script>

<script setup>


</script>
