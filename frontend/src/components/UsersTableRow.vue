<template>
  <tr>
    <td>{{user.id}}</td>
    <td>{{user.first_name}}</td>
    <td>{{user.last_name}}</td>
    <td>{{user.email}}</td>
  </tr>
</template>

<script>
export default {
  name: 'UsersTableRow',

  props: {
    user: {
      type: Object,
      required: true
    }
  }
}
</script>

<style scoped>
  tr {
    padding: 20px 0;
  }
  td {
    padding: 0 20px;
  }
</style>