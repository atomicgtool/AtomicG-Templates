@model AtomicG.Core.Models.TemplateModel
@using AtomicG.Helper
import Vue from 'vue';
import Router from 'vue-router';
import Home from '@@/components/Home';
@foreach (var entity in Model.Entities)
{
<text>
import @entity.Name.FirstLetterToUpper()List from '@@/components/@entity.Name/@entity.Name.FirstLetterToUpper()List';
import @entity.Name.FirstLetterToUpper()Detail from '@@/components/@entity.Name/@entity.Name.FirstLetterToUpper()Detail';
import @entity.Name.FirstLetterToUpper()Create from '@@/components/@entity.Name/@entity.Name.FirstLetterToUpper()Create';
import @entity.Name.FirstLetterToUpper()Update from '@@/components/@entity.Name/@entity.Name.FirstLetterToUpper()Update';
</text>
}

Vue.use(Router);

export default new Router({
  routes: [
    { path: '/', name: 'Home', component: Home },
@foreach (var entity in Model.Entities)
{
<text>
    { path: '/@entity.Name.Pluralize()', name: '@entity.Name.FirstLetterToUpper()', component: @entity.Name.FirstLetterToUpper()List },
    { path: '/@entity.Name.Pluralize()/create', name: '@entity.Name.FirstLetterToUpper()Create', component: @entity.Name.FirstLetterToUpper()Create },
    { path: '/@entity.Name.Pluralize()/update/:id', name: '@entity.Name.FirstLetterToUpper()Update', component: @entity.Name.FirstLetterToUpper()Update },
    { path: '/@entity.Name.Pluralize()/:id', name: '@entity.Name.FirstLetterToUpper()Detail', component: @entity.Name.FirstLetterToUpper()Detail },    
</text>
}

    { path: '*', redirect: { name: 'Home' } },
  ],
});