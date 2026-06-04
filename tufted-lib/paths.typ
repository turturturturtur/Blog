/// Convert root-relative site paths to paths relative to the current page.
///
/// This keeps the site working both at the domain root and under a GitHub
/// Pages project path such as /Blog/.
#let page-relative(path, page-path: none) = {
  if type(path) != str {
    path
  } else if path.starts-with("http") or path.starts-with("mailto:") or path.starts-with("tel:") or path.starts-with("#") {
    path
  } else if path.starts-with("/") {
    let current-page = if page-path == none {
      sys.inputs.at("page-path", default: "")
    } else {
      page-path
    }

    let current-page = if current-page == none {
      ""
    } else {
      current-page.trim("/")
    }

    let depth = if current-page == "" {
      0
    } else {
      current-page.split("/").len()
    }

    let prefix = if depth == 0 {
      ""
    } else {
      range(depth).map(_ => "../").join("")
    }
    let target = path.trim("/", at: start)

    if target == "" {
      if prefix == "" { "./" } else { prefix }
    } else {
      prefix + target
    }
  } else {
    path
  }
}
