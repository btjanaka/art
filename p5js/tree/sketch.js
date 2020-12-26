const s = function (p) {
  let canvas;
  let img;
  let slider;
  let saveButton;
  let x = 0;
  let width = 400;
  let height = 400;

  function save() {
    p.saveCanvas(canvas, "image", "jpg");
  }

  const branchScale = 0.8; // Subsequent branches are scaled by this factor.
  const branchAngle = p.PI / 8;

  // len is initial length of the branch, lvl tells how many more levels to
  // draw.
  function fractalTree(len, lvl) {
    p.strokeWeight(lvl);
    p.line(0, 0, 0, -len);
    p.translate(0, -len);

    const newLen = len * branchScale;

    if (lvl > 0) {
      p.push();
      p.rotate(branchAngle);
      fractalTree(newLen, lvl - 1);
      p.pop();

      p.push();
      p.rotate(-branchAngle);
      fractalTree(newLen, lvl - 1);
      p.pop();
    }
  }

  p.preload = function () {};

  p.setup = function () {
    canvas = p.createCanvas(width, height);
    p.background("#ffffff");

    button = document.getElementById("control-save");
    button.onclick = save;

    p.translate(width / 2, height);
    fractalTree(62, 11);
  };

  p.draw = function () {};
};

let p5Canvas = new p5(s, "p5_canvas");
