(load "NuMarkup:macros")

(set &feed (NuMarkupOperator operatorWithTag:"feed" prefix:<<-END
<?xml version="1.0" encoding="UTF-8"?>
END))

# add tags as needed
(markup title
        subtitle
        id
        generator
        link
        updated
        entry
        author
        published
        content
        name)

