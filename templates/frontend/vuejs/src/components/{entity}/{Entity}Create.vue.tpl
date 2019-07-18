@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
@using AtomicG.Helper.Frontend
<template>
    <div>
        <h3>Create @Model.Name.FirstLetterToUpper()</h3>

        <form @@submit.prevent="save">
  @foreach (var field in Model.Fields)
  {
    if (field.Key)
    {
      continue;
    }
    if (field.IsBasicType())
    {
            <div class="form-group">
                <label for="inputName">@field.Name.FirstLetterToUpper()</label>
		@if (field.EntityType() == "Date")
		{
                <input type="date" name="@field.Name" formControlName="@field.Name" class="form-control" id="@field.Name" v-model="@(Model.Name).@field.Name">
		}
		else
		{
                <input name="@field.Name" formControlName="@field.Name" class="form-control" id="@field.Name" v-model="@(Model.Name).@field.Name">
		}
            </div>
    }
  }
  @if (Model.HasMuchRelations())
  {
    foreach (var field in Model.GetMuchRelations())
    {
            <div class="form-group">
                <label for="inputName">@field.Name.FirstLetterToUpper().Pluralize()</label>
                <div v-for="@field.Name.Singularize() in @field.Name.Pluralize()" :key="@(field.Name.Singularize()).id">                    
                    <input type="checkbox" :value="@field.Name.Singularize()" v-model="@(Model.Name).@field.Name" />{{ @field.Name.Singularize().@field.Show }}                    
                </div>
            </div>
    }
  }
  @if (Model.HasOneRelations())
  {
    foreach (var field in Model.GetOneRelations())
    {
              <div class="form-group">
                  <label for="inputName">@field.Name.FirstLetterToUpper()</label>                
                  <select formControlName="@field.Name" class="form-control" v-model="@(Model.Name).@field.Name">
                      <option v-for="@field.Name in @field.Name.Pluralize()" :key="@(field.Name).id">
                          {{ @(field.Name).@field.Show }}
                      </option>
                  </select>
              </div>
    }
  }
            <button class="btn btn-primary" :disabled='!isValid()'>Create</button> |
            <router-link to="/@Model.Name.Pluralize()">Back</router-link>
        </form>
    </div>
</template>

<script>
export default {
    name: '@Model.Name.FirstLetterToUpper()Create',
    data: () => {
        return { 
            @Model.Name: { 
@if (Model.HasMuchRelations())
{
	foreach (var field in Model.GetMuchRelations())
	{
<text>                @field.Name: [],
</text>
	}
}				
            },
@if (Model.HasOneRelations())
{
    foreach (var field in Model.GetOneRelations())
    {
<text>            @field.Name.Pluralize(): [],
</text>
	}
}
@if (Model.HasMuchRelations())
{
    foreach (var field in Model.GetMuchRelations())
    {
<text>            @field.Name.Pluralize(): [],
</text>
	}
}
        }
    },
@if (Model.HasOneRelations() || Model.HasMuchRelations())
{
<text>    async mounted () {
</text>
@if (Model.HasOneRelations())
{
	foreach (var field in Model.GetOneRelations())
	{
<text>        this.@field.Name.Pluralize() = (await this.$api.get('@field.Name.Pluralize()')).data
</text>
	}
}
@if (Model.HasMuchRelations())
{
	foreach (var field in Model.GetMuchRelations())
	{
<text>        this.@field.Name.Pluralize() = (await this.$api.get('@field.Name.Pluralize()')).data
</text>
	}
}
<text>     },
</text>
}
    methods: {
        async save () {
            await this.$api.create('@Model.Name.Pluralize()', this.@Model.Name)
            this.$router.push({name: '@Model.Name.FirstLetterToUpper()'})
        },
        isValid () {
            @Model.GetValidationCondition()
        }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
