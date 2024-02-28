# README

### Setup:

- $ rails db:create && rails db:migrate && rails db:seed && rails s
- Open localhost:3000/graphiql

### Endpoint

- Please use this link and make a POST request to https://restaurant-menu-4gwt.onrender.com/graphql, if you wish to try in Postman, Insomnia or etc
- Note: I recalled in my previous project with Graphql I am unable to view `/graphiql` in production environments. To view the available query and mutation inputs please refer in localhost `/graphiql` or in Postman use ctrl + space (Mac) to autofill

### Graphiql Notes:

- Within the left sidebar there will be further documentation on how to interact with the menu.

  - Query - To get menu and many other details.
    - Currently it consist of 2 queries.
    1. A Menu query and all its associated records (MenuSection, Section, SectionItem, Item, Modifier, ModifierGroup)
    2. A ModifierGroup query which allows user to view the available options. May be useful for some mutations when creating Modifier.
  - Mutation - To create and update menu, items and much more.

- At the centre of the graphiql page you may populate based on an example

```
query {
  modifierGroup{
    id
    label
    selectionRequiredMin
    selectionRequiredMax
  }
}
```

- The results will be on the right of the graphiql page.

```
{
  "data": {
    "modifierGroup": [
      {
        "id": "1",
        "label": "Toppings",
        "selectionRequiredMin": 0,
        "selectionRequiredMax": 0
      }
    ]
  }
}
```

### Diagram:

An overview on this application.

![Menu ERD diagram](/menu-erd-sketch.png)

### Notes/Miscs:

Some notable things that was looming in my mind when coding this exercise.

- I am unfamiliar with certain terms such as Modifier and ModifierGroup.
  - Took some time to ChatGPT and lookup and read some informations online. Some references I used were:
    - https://support.bypassmobile.com/hc/en-us/articles/360043043212-Modifiers-and-Modifier-Groups
    - https://help.deliverect.com/en/articles/7979028-create-a-modifier-or-modifier-group
- I was puzzled where do I place the Modifier name/label e.g Onion, Cheese, Tomato. Do I place in Modifier, Item or a new table.
  - Based on the available ERD and some site as reference, I went with the decision to stick with the ERD diagram and add a new column reside in Modifier.
- In my past project I did a structure similar based on the comment in https://www.reddit.com/r/rails/comments/e0xfpn/how_to_organise_graphql_code/. The issue arises when I add more queries and mutations, the file was growing bigger and messier in mutation_type.rb and query_type.rb.
  - I decided to proceed with this structure approach and set the folder structure as such
  ```
  graphql/
    - enums
      - files.rb
    - mutations
      - files.rb
    - queries
      - files.rb
    - types
      - model
        - files.rb
  ```
  - Note: It was my first and only graphql project and had no other developer to bounce idea so I am unsure if this is industry approach/practice but is a topic I will lookup for during my free time. Either via Udemy courses or online resources, blogs etc.
- 26 Feb 9.30pm I was reading through the requirements and some informations regarding Modifier and ModifierGroup. Trying to picture how the app will look like. Emailed some questions to Sunny.
- 27 Feb after came back from work I started coding around 8pm and coded until 12am. Mostly setup the migration, model validations, seeding datas and graphql init/install command and got a basic menu query to work.
- 28 Feb 7.30pm continue where I left off and finish the remaining query and mutations.
- I deployed via Render (was always using heroku in the past but is no longer free).

### Query

This is for reference only since graphiql is not available in production.

```
query {
  menu {
    id
    label
    state
    startDate
    endDate
    sections{
      id
      label
      description
      displayOrder
      items{
        id
        type
        label
        description
        displayOrder
        price
        modifiers{
          id
          label
          defaultQuantity
          displayOrder
          priceOverride
          modifierGroup{
            id
            label
            selectionRequiredMax
            selectionRequiredMin
          }
        }
      }
    }
  }
}
```
