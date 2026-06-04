/// Renders a blog index entry with a date column and linked title.
///
/// The `date` argument may be either a `datetime` value or preformatted
/// content. The `path` argument may include or omit a trailing slash.
#let blog-entry(
  date: auto,
  path: str,
  title: str,
  category: none,
  tags: (),
  description: none,
) = {
  let href = if path.ends-with("/") {
    path
  } else {
    path + "/"
  }

  let date_display = if type(date) == datetime {
    date.display()
  } else {
    date
  }

  html.div(
    class: "blog-entry",
    {
      html.div(
        class: "blog-entry-date",
        date_display,
      )
      html.div(
        class: "blog-entry-content",
        {
          html.a(href: href, title)

          if category != none or tags.len() > 0 {
            html.div(
              class: "blog-entry-meta",
              {
                if category != none {
                  html.span(class: "blog-entry-category", category)
                }
                for tag in tags {
                  html.span(class: "blog-entry-tag", tag)
                }
              },
            )
          }

          if description != none {
            html.p(class: "blog-entry-description", description)
          }
        },
      )
    },
  )
}
