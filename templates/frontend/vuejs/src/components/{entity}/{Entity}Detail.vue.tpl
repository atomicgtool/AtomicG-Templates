@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
<template>
    <div>
        <h3>@Model.Name.Pluralize().FirstLetterToUpper() Details</h3>
		@foreach (var field in Model.Fields)
		{
        <div><strong>@field.Name.FirstLetterToUpper(): </strong>{{ @(Model.Name).@field.Name@field.GetVueJsPipeOrShow() }}</div>
		}
		
        <hr />        
        <router-link :to="{ name: '@Model.Name.FirstLetterToUpper()Update', params: { id: @(Model.Name).@Model.GetKeyName() }}">Edit</router-link> |
        <router-link to="" v-on:click.native="onDelete@(Model.Name.FirstLetterToUpper())(@(Model.Name).@Model.GetKeyName())">Delete</router-link> |
        <router-link to="/@Model.Name.Pluralize()">Back</router-link>
    </div>
</template>

<script>
export default {
    name: '@Model.Name.FirstLetterToUpper()Detail',
    data() {
        return { 
            @Model.Name: {}
        }
    },
    async mounted () {
        this.@Model.Name = (await this.$api.getById('@Model.Name.Pluralize()', this.$route.params.id)).data
    },
    methods: {
        onDelete@(Model.Name.FirstLetterToUpper()): async (id) => {
            if (confirm('Are you sure to delete this @Model.Name: ' + id)) {
                await this.$api.delete('@Model.Name.Pluralize()', this.$route.params.id)
                this.$router.push({name: '@Model.Name.FirstLetterToUpper()'})
            }
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
