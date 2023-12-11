#import "./typst-package/lib.typ" as m-jaxon
// Uncomment the following line to use the m-jaxon from the official package registry
// #import "@preview/m-jaxon:0.1.1"
#set page(height: auto, width: auto, margin: 2em)
#set text(size: 14pt)

= M-Jaxon

Typst, now with *MathJax*.

#let code = ```
  \vec{\nabla} \times \vec{F} =
            \left( \frac{\partial F_z}{\partial y} - \frac{\partial F_y}{\partial z} \right) \mathbf{i}
          + \left( \frac{\partial F_x}{\partial z} - \frac{\partial F_z}{\partial x} \right) \mathbf{j}
          + \left( \frac{\partial F_y}{\partial x} - \frac{\partial F_x}{\partial y} \right) \mathbf{k}
  ```
#code

#m-jaxon.render(code.text, inline: false)

The equation of mass-energy equivalence is often written as $E=m c^2$ in modern physics.

But we can also write it using M-Jaxon as: #m-jaxon.render("E = mc^2", inline: true)
