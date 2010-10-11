(load "NuMarkup:macros")

(set &feed (NuMarkupOperator operatorWithTag:"feed" prefix:<<-END
<?xml version="1.0" encoding="UTF-8"?>
END))

(set &service (NuMarkupOperator operatorWithTag:"service" prefix:<<-END
<?xml version="1.0" encoding="UTF-8"?>
END))

;; add tags as needed
(markup accept
        author
        category
        collection
        content
        entry
        generator
        id
        link
        name
        published
        rights
        subtitle
        summary
        title
        updated
        workspace)

;; dashed markup
(markup app-control
        app-draft
        app-edited
        atom-title)