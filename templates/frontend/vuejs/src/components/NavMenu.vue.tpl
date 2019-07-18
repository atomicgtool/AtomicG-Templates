@model AtomicG.Core.Models.TemplateModel
@using AtomicG.Helper
<template>
  <header>
    <nav class='navbar navbar-expand-sm navbar-expand-md navbar-light bg-white border-bottom box-shadow mb-3'>
      <div class="container">
        <a class="navbar-brand" href='/'>MyProjectName</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-label="Toggle navigation"
                aria-expanded="isExpanded" v-on:click="toggle">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse">
          <ul class="navbar-nav flex-grow">

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Menu
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
@foreach (var entity in Model.Entities)
{
                  <router-link class="dropdown-item" to="/@entity.Name.Pluralize()">@entity.Name.Pluralize().FirstLetterToUpper()</router-link>
}
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
</template>

<script>
export default {
  name: 'NavMenu',
  data: () => {
    return {
      isExpanded: false
    }
  },
  methods: {
    collapse: function() {
      this.isExpanded = false;
    },
    toggle: function() {
      this.isExpanded = !this.isExpanded;
    }
  }  
};
</script>

<style scoped>
a.navbar-brand {
  white-space: normal;
  text-align: center;
  word-break: break-all;
}

html {
  font-size: 14px;
}
@@media (min-width: 768px) {
  html {
    font-size: 16px;
  }
}

.box-shadow {
  box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
}

</style>