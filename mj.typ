#import "./typst-package/lib.typ" as m-jaxon
// Uncomment the following line to use the m-jaxon from the official package registry
// #import "@preview/m-jaxon:0.1.2"
#set page(height: auto, width: auto, margin: 2em, fill: white)
= M-Jaxon #m-jaxon.render(`\mathcal{M}-\mathrm{jaxon}`, inline: true)

Typst, now with *MathJax*. 

The equation of mass-energy equivalence is often written as $E=m c^2$ in modern physics.

But we can also write it using M-Jaxon as: #m-jaxon.render(`E = mc^2`, inline: true), which is ```#m-jaxon.render(`E = mc^2`, inline: true)```


#let code = ```
  \vec{\nabla} \times \vec{F} =
            \left( \frac{\partial F_z}{\partial y} - \frac{\partial F_y}{\partial z} \right) \mathbf{i}
          + \left( \frac{\partial F_x}{\partial z} - \frac{\partial F_z}{\partial x} \right) \mathbf{j}
          + \left( \frac{\partial F_y}{\partial x} - \frac{\partial F_x}{\partial y} \right) \mathbf{k}
  ```

#table(columns: (30em, 30em), inset: 10pt,
  align: horizon,
[Typst], [M-Jaxon],
[$ arrow(nabla) times arrow(F) eq lr((frac(diff F_z, diff y) minus frac(diff F_y, diff z))) bold(i) plus lr((frac(diff F_x, diff z) minus frac(diff F_z, diff x))) bold(j) plus lr((frac(diff F_y, diff x) minus frac(diff F_x, diff y))) bold(k) $], [#m-jaxon.render(code, inline: false)],
[`$ arrow(nabla) times arrow(F) eq lr((frac(diff F_z, diff y) minus frac(diff F_y, diff z))) bold(i) plus lr((frac(diff F_x, diff z) minus frac(diff F_z, diff x))) bold(j) plus lr((frac(diff F_y, diff x) minus frac(diff F_x, diff y))) bold(k) $`], [#code]
)
