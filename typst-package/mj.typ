#import "@preview/jogs:0.2.1": compile-js, call-js-function

#let mj-src = read("./mj.js")
#let mj-bytecode = compile-js(mj-src)

#let render(src, inline: false, ..args) = {
  let result = call-js-function(mj-bytecode, "mj", src, inline)
  let img = image.decode(result.svg, ..args, format: "svg")
  let ex = result.vertical_align
  if inline {
    box(img, baseline: -ex * 0.5em)
  } else {
    align(center, img)
  }
}
