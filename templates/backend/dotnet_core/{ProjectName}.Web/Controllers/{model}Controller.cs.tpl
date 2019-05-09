@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
using AutoMapper;
using @(Model.ProjectName).Core.Services;
using @(Model.ProjectName).Entities;
using @(Model.ProjectName).Web.Dtos;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace @(Model.ProjectName).Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class @Model.Name.FirstLetterToUpper().Pluralize()Controller : ControllerBase
    {
        private readonly IMapper mapper;
        private readonly I@(Model.Name.FirstLetterToUpper())Service @(Model.Name)Service;

        public @Model.Name.FirstLetterToUpper().Pluralize()Controller(IMapper mapper, I@(Model.Name.FirstLetterToUpper())Service @(Model.Name)Service)
        {
            this.mapper = mapper;
            this.@(Model.Name)Service = @(Model.Name)Service;
        }

        // GET api/@Model.Name.Pluralize()
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var @Model.Name.Pluralize() = await this.@(Model.Name)Service.GetAll@(Model.Name.FirstLetterToUpper().Pluralize())Async();

            return Ok(this.mapper.Map<List<@Model.Name.FirstLetterToUpper()>, List<@Model.Name.FirstLetterToUpper()Dto>>(@Model.Name.Pluralize()));
        }

        // GET api/@Model.Name.Pluralize()/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(Guid id)
        {
            var @(Model.Name) = await this.@(Model.Name)Service.Get@(Model.Name.FirstLetterToUpper())ByIdAsync(id);
            if (@(Model.Name) == null)
            {
                return NotFound();
            }

            return Ok(this.mapper.Map<@Model.Name.FirstLetterToUpper(), @Model.Name.FirstLetterToUpper()Dto>(@(Model.Name)));
        }

        // POST api/@Model.Name.Pluralize()
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] @Model.Name.FirstLetterToUpper()Dto @(Model.Name)Dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var @(Model.Name) = this.mapper.Map<@Model.Name.FirstLetterToUpper()Dto, @Model.Name.FirstLetterToUpper()>(@(Model.Name)Dto);

            var new@(Model.Name.FirstLetterToUpper()) = await this.@(Model.Name)Service.Create@(Model.Name.FirstLetterToUpper())Async(@(Model.Name));

            return CreatedAtAction(nameof(Get), new { id = new@(Model.Name.FirstLetterToUpper()).Id}, new@(Model.Name.FirstLetterToUpper()));
        }

        // PUT api/@Model.Name.Pluralize()/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(Guid id, [FromBody] @Model.Name.FirstLetterToUpper()Dto @(Model.Name)Dto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var @(Model.Name) = await this.@(Model.Name)Service.Get@(Model.Name.FirstLetterToUpper())ByIdAsync(id);
            if (@(Model.Name) == null)
            {
                return NotFound();
            }

            var edited@(Model.Name.FirstLetterToUpper()) = this.mapper.Map<@Model.Name.FirstLetterToUpper()Dto, @Model.Name.FirstLetterToUpper()>(@(Model.Name)Dto);

@foreach(var field in Model.Fields)
{
    if (!field.Key)
    {
<text>            @(Model.Name).@field.Name.FirstLetterToUpper() = edited@(Model.Name.FirstLetterToUpper()).@field.Name.FirstLetterToUpper();
</text>
    }
}

            await this.@(Model.Name)Service.Update@(Model.Name.FirstLetterToUpper())Async(@(Model.Name));

            return NoContent();
        }

        // DELETE api/@Model.Name.Pluralize()/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(Guid id)
        {
            var @(Model.Name) = await this.@(Model.Name)Service.Get@(Model.Name.FirstLetterToUpper())ByIdAsync(id);
            if (@(Model.Name) == null)
            {
                return NotFound();
            }

            await this.@(Model.Name)Service.Delete@(Model.Name.FirstLetterToUpper())Async(@(Model.Name));

            return NoContent();
        }
    }
}
