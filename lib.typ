
#let myutils-setup(doc) = {
  context if (target() == "html" or target() == "bundle") {
    html.elem(
      "style",
      ```css
      .svg-graph > svg, img {
        display: block;
        max-width: 95%;
        height: auto;
        margin: 0 auto;
      }

      @media screen and (max-width: 600px) {
        img {
          width: 95%;
          max-width: 600px;
        }
      }

      @media screen and (min-width: 601px) and (max-width: 1000px) {
        img {
          width: 80%;
          max-width: 600px;
        }
      }

      @media screen and (min-width: 1001px) {
        img {
          width: 70%;
          max-width: 600px;
        }
      }
      ```.text,
    )

    // show grid: it => html.elem("div", attrs: (class: "svg-graph"), html.frame(it))
    // show image: it => html.img(src: it.source)
    // show规则的作用域必须改为全局
  }

  show grid: it => if (target() == "html" or target() == "bundle") {
    html.elem("div", attrs: (class: "svg-graph"), html.frame(it))
  } else { it }

  show image: it => if (target() == "html" or target() == "bundle") {
    html.img(src: it.source)
  } else {
    it
  }

  doc
}

