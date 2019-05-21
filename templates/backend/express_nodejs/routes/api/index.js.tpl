@model AtomicG.Core.Models.TemplateModel
@using AtomicG.Helper
var router = require('express').Router();

@foreach (var entity in Model.Entities)
{
<text>router.use('/@entity.Name.Pluralize()', require('./@(entity.Name)Route'));
</text>
}

module.exports = router;