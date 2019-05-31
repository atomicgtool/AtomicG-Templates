# AtomicG
*AtomicG Generator Tool*

The idea with this tool is to provide an easy and intuitive way to generate code for the Backend and Frontend based on a **Model** defined by us and using templates that we can have access [here](https://github.com/gorums/AtomicG-Templates/tree/master/templates). 

The goal is generate integrated **CRUDs** code base on good practices for the most used frameworks today such as **Angular**, **React**, **DotNet Core**, **ExpressJs**, etc.

## Model

The Model defines the entities and fields with properties that we use to send to the templates to generate the code, plus other configurations like the project name, version, etc.

Example of simple valid Model on yaml

```yaml
projectName: MyProjectName
version: 0.0.1
entities:
  - name: user
    fields:
      - name: id
        type: guid
        key: true
        
      - name: email
        type: string
        required: true
        
  - name: group 
    fields:
      - name: id
        type: guid
        key: true
        
      - name: name
        type: string
        required: true
```

- General properties
  - projectName: project name 
  - version: project version 
  
- Entity properties 
  - name: entity name
  - type: entity type
  - key: entity key (all the entities need one key)
  - required: true/false
  - show: the relation field to show if the type is another entity
  
- Types
  - guid
  - string
  - number
  - boolean
  - date
  - another entity name

- One relation
  - if we have one relation with another entity the type is going to be the entity name
  
  ex: 
  ```
  - name: country
    type: country
    show: name
  ```
- Many relations
  - if we have one or more than one relationship with another entity the type is going to be the entity name with [] postfix
  
  ex: 
  ```
  - name: roles
    type: role[]
    show: name
  ```
### Constraints

 - `projectName` is required.
 - `projectName` needs to be alphanumeric and start with a lowercase letter.
 - `projectName` cannot be more than 25 characters.
 - `entities` needs at least one item inside.
 - All the entities need a `key` field.
 - All the entities need to be alphanumeric and start with a lowercase letter.
 - All the entities cannot be more than 25 characters. 
 - All the fields inside the entities need to be alphanumeric and start with a lowercase letter.
 - All the fields inside the entities cannot be more than 25 characters.
 - All the fields inside the entities need basic `type` or another entity as a `type` 
 - We cannot have more than 10 entities.
 - We cannot have more than 10 fields per entities.
 - If the entity has relation with another entities that fields need `show` item.
 
## Templates

Check the template's documentation [here](https://github.com/gorums/AtomicG-Templates/tree/master/templates)

## Thanks

Here we are going to put the list of contributors and people that support us that allow this project to continue alive.
