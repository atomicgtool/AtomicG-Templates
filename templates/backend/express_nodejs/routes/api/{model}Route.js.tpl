@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
var express = require('express');
var router = express.Router();
var @(Model.Name)Service = require("../../services/@(Model.Name)Service");

/* GET @Model.Name.Pluralize() listing. */
router.get('/', (req, res, next) => {
  res.json(@(Model.Name)Service.getAll());
});

/* GET a @Model.Name by id. */
router.get('/:id', (req, res, next) => {
  const id = req.params.id;

  res.json(@(Model.Name)Service.getById(id));
});

/* POST add a new @Model.Name. */
router.post('/', (req, res) => {
  const new@(Model.Name.FirstLetterToUpper()) = req.body;
  const @(Model.Name)Saved = @Model.Name.ToLower()Service.create(new@(Model.Name.FirstLetterToUpper()));

  res.status(201).send(@(Model.Name)Saved);
});

/* PUT edit a @Model.Name with this id. */
router.put('/:id', (req, res) => {
  const id = req.params.id;
  const edited@(Model.Name.FirstLetterToUpper()) = req.body;

  const @Model.Name = @(Model.Name)Service.getById(id);
  if (@Model.Name === undefined || @Model.Name === null) {
    res.status(404).send();
  }

@foreach(var field in Model.Fields)
{
    if (!field.Key)
    {
<text>  @(Model.Name).@field.Name = edited@(Model.Name.FirstLetterToUpper()).@field.Name;
</text>
    }
}

  @(Model.Name)Service.update(@Model.Name);

  res.status(204).send();
});

/* DELETE delete a @Model.Name by id. */
router.delete('/:id', (req, res) => {
  const id = req.params.id;
  const @Model.Name = @(Model.Name)Service.getById(id);
  if (@Model.Name === undefined || @Model.Name === null) {
    res.status(404).send();
  }

  @(Model.Name)Service.delete(@Model.Name);

  res.status(204).send();
});

module.exports = router;
