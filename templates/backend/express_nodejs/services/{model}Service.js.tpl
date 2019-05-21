@model AtomicG.Core.Models.Entity
@using AtomicG.Helper
/* return all the @Model.Name.Pluralize() */
module.exports.getAll = () => {    
    return [{}];
};

/* return a @Model.Name by id */
module.exports.getById = (id) => {    
    return {};
};

/* add a new @Model.Name */
module.exports.create = (@Model.Name) => {
    return @Model.Name;
};

/* update a @Model.Name */
module.exports.update = (@Model.Name) => {    
};

/* delete this @Model.Name */
module.exports.delete = (@Model.Name) => {    
};
