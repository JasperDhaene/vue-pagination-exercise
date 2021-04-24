<template>
  <div v-if="error">
    {{error}}
  </div>
  <div v-else>
    <h2>This app has {{totalUsers}} happy users!</h2>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>First name</th>
          <th>Last name</th>
          <th>Email</th>
        </tr>
      </thead>
      <tbody>
        <UsersTableRow 
            v-for="user in users"
            :user="user"
            :key="user.id" />
      </tbody>
    </table>
    <button @click="goToPage('desc')" :disabled="previousDisabled">Previous page</button>
    <button @click="goToPage('asc')" :disabled="nextDisabled">Next page</button>
  </div>
</template>

<script>
import UsersTableRow from '@/components/UsersTableRow.vue';

export default {
  components: {
    UsersTableRow
  },

  name: 'UsersTable',

  data() {
    return {
      users: [],
      page: 1,
      perPage: 10,
      totalPages: 1,
      totalUsers: 0,
      error: ''
    }
  },

  created() {
      this.fetchUsers();
  },

  methods: {
    async fetchUsers() {
      try {
        const { page, perPage } = this;

        const response = await fetch(`//127.0.0.1:3000/api/v1/users?page=${page}&per_page=${perPage}`, {
          method: "GET",
          headers: { "Content-Type": "application/json" }
        });

        const data = await response.json();

        this.users = data.users
        this.totalPages = data.meta.total_pages
        this.totalUsers = data.meta.total_users
      } catch(e) {
        this.error = 'Oops! Something went wrong while fetching data';
      }
    },

    goToPage(direction) {
      this.page = direction == 'asc' ? this.page + 1 : this.page - 1;
      this.fetchUsers();
    },
  },
  computed: {
    previousDisabled: function() {
      return this.page - 1 <= 0;
    },
    nextDisabled: function() {
      return this.page + 1 > this.totalPages;
    }
  }
}
</script>

<style scoped>
  table {
    margin: 5vh auto;
  }
  button {
    margin: 0 20px;
  }
</style>