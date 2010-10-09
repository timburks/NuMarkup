(load "NuMarkup:macros")

(set &rss (NuMarkupOperator operatorWithTag:"rss" prefix:<<-END
<?xml version="1.0" encoding="UTF-8"?>
END contents:(list)))

# add tags as needed
(markup channel
        title
        link
        language
        description
        item
        author
        pubDate
        guid
        description)
