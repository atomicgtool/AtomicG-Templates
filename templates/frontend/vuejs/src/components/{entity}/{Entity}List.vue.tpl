@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
<template>
  <div>
   <h3>@Model.Name.Pluralize().FirstLetterToUpper()</h3>

    <router-link  to="/@Model.Name.Pluralize()/create">Create new @Model.Name.FirstLetterToUpper()</router-link>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">@Model.GetKeyName().FirstLetterToUpper()</th>
                    @foreach (var field in Model.Fields)
					{
						if (!field.Key)
						{
                    <th scope="col">@field.Name.FirstLetterToUpper()</th>
						}                
					}
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="@Model.Name in @Model.Name.Pluralize()" :key="@(Model.Name).@Model.GetKeyName()">
                    <th scope="row">{{ @(Model.Name).@Model.GetKeyName() }}</th>
					 @foreach (var field in Model.Fields)
				  {
					if (!field.Key)
					{
                    <td>{{ @(Model.Name).@field.Name@field.GetVueJsPipeOrShow()}}</td>
					}
				  }
                    <td>
                        <router-link :to="{ name: '@Model.Name.FirstLetterToUpper()Detail', params: { id: @(Model.Name).@Model.GetKeyName() }}">Details</router-link> |
                        <router-link :to="{ name: '@Model.Name.FirstLetterToUpper()Update', params: { id: @(Model.Name).@Model.GetKeyName() }}">Edit</router-link>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
  </div>
</template>

<script>
export default {
    name: '@Model.Name.FirstLetterToUpper()List',
    data: () => {
        return { 
            @Model.Name.Pluralize(): []    
        }
    },
    async mounted () {  
        this.@Model.Name.Pluralize() = (await this.$api.get('@Model.Name.Pluralize()')).data
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
