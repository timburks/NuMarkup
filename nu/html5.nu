(load "NuMarkup:macros")

(set &html5 (NuMarkupOperator operatorWithTag:"html" prefix:"<!DOCTYPE html>" contents:nil))

(markup address
        article
        aside
        audio
        canvas
        command
        datalist
        details
        embed
        figcaption
        figure
        footer
        header
        hgroup
        keygen
        mark
        meter
        nav
        output
        progress
        section
        summary
        svg
        time
        video
        wbr)