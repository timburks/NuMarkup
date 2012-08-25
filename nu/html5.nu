(load "NuMarkup:macros")

(set &html (NuMarkupOperator operatorWithTag:"html" prefix:"<!DOCTYPE html>" contents:nil))

(markup a
        abbr
        acronym
        address
        applet
        area
        article
        aside
        audio
        b
        base
        bdi
        bdo
        big
        blockquote
        body
        br
        button
        canvas
        caption
        center
        cite
        code
        col
        colgroup
        command
        datalist
        dd
        del
        details
        dfn
        dir
        div
        dl
        dt
        em
        embed
        fieldset
        figcaption
        figure
        font
        footer
        form
        frame
        frameset
        h1
        h2
        h3
        h4
        h5
        h6
        head
        header
        hgroup
        hr
        html
        i
        iframe
        img
        input
        ins
        keygen
        kbd
        label
        legend
        li
        link
        map
        mark
        menu
        meta
        meter
        nav
        noframes
        noscript
        object
        ol
        optgroup
        option
        output
        p
        param
        pre
        progress
        q
        rp
        rt
        ruby
        s
        samp
        script
        section
        select
        small
        source
        span
        strike
        strong
        style
        sub
        summary
        sup
        table
        tbody
        td
        textarea
        tfoot
        th
        thead
        time
        title
        tr
        track
        tt
        u
        ul
        var
        video
        wbr)

(send &meta setEmpty:YES)
(send &link setEmpty:YES)
(send &hr setEmpty:YES)
(send &br setEmpty:YES)
(send &img setEmpty:YES)
(send &area setEmpty:YES)
(send &input setEmpty:YES)
(send &col setEmpty:YES)
