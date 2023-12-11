//
//  Load the packages needed for MathJax
//
import { mathjax } from 'mathjax-full/js/mathjax.js';
import { TeX } from 'mathjax-full/js/input/tex.js';
import { SVG } from 'mathjax-full/js/output/svg.js';
import { liteAdaptor } from 'mathjax-full/js/adaptors/liteAdaptor.js';
import { RegisterHTMLHandler } from 'mathjax-full/js/handlers/html.js';

import { AllPackages } from 'mathjax-full/js/input/tex/AllPackages.js';

export default function render(src, inline) {
  //
  //  Minimal CSS needed for stand-alone image
  //
  const CSS = [
    'svg a{fill:blue;stroke:blue}',
    '[data-mml-node="merror"]>g{fill:red;stroke:red}',
    '[data-mml-node="merror"]>rect[data-background]{fill:yellow;stroke:none}',
    '[data-frame],[data-line]{stroke-width:70px;fill:none}',
    '.mjx-dashed{stroke-dasharray:140}',
    '.mjx-dotted{stroke-linecap:round;stroke-dasharray:0,140}',
    'use[data-c]{stroke-width:3px}'
  ].join('');

  //
  //  Create DOM adaptor and register it for HTML documents
  //
  const adaptor = liteAdaptor();
  const handler = RegisterHTMLHandler(adaptor);

  //
  //  Create input and output jax and a document using them on the content from the HTML file
  //
  const tex = new TeX({ packages: AllPackages });
  const svg = new SVG({ fontCache: 'local', internalSpeechTitles: false });
  const html = mathjax.document('', { InputJax: tex, OutputJax: svg });

  const node = html.convert(src, {
    display: !inline,
  });
  let res = adaptor.innerHTML(node);
  // <svg style="vertical-align: -0.186ex;"
  // extract -0.186 from the svg
  const vertical_align = parseFloat(res.match(/<svg style="vertical-align: ([^;]+)ex;/)[1]);
  res = res.replace(/<defs>/, `<defs><style>${CSS}</style>`)
  return {
    svg: res,
    vertical_align
  };
}
