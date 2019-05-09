# AtomicG
*AtomicG Generator Tool*

The idea with this tool is to provide an easy and intuitive way to generate code for the Backend and Frontend based on a **Model** defined by us and using templates that we can have access [here](https://github.com/gorums/AtomicG-Templates/tree/master/templates). 

The goal is generate integrated **CRUDs** code base on good practices for the most used frameworks today such as **Angular**, **React**, **DotNet Core**, **ExpressJs**, etc.

## Model

The Model defines the entities and fields with properties that we use to send to the templates to generate the code, plus other configurations like the project name, version, etc.

Example of simple valid Model on yaml

```yaml
projectName: MyProjectName
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
      - name: id
        type: guid
        key: true
        
      - name: name
        type: string
        required: true
```

## Templates

Check the template's documentation [here](https://github.com/gorums/AtomicG-Templates/tree/master/templates)

## Thanks

Here we are going to put the list of contributors and people that support us that allow this project to continue alive.
