<template>
  <div id="app">
    <nav>
      <router-link to="/">Principal</router-link> |
      <router-link to="/PaginaYayis">PaginaYayis</router-link> |
      <router-link to="/Login">Login</router-link>
    </nav>
    <v-app>
      <router-view/>
    </v-app>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
