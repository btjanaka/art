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

  const branchScaleMin = 0.5;
  const branchScaleMax = 0.9;
  const branchAngleMin = p.PI / 8;
  const branchAngleMax = p.PI / 4;

  // len is initial length of the branch, lvl tells how many more levels to
  // draw.
  function fractalTree(len, lvl) {
    p.strokeWeight(lvl);
    p.line(0, 0, 0, -len);
    p.translate(0, -len);

    if (lvl > 0) {
      const angle1 = p.random(branchAngleMin, branchAngleMax);
      const angle2 = p.random(branchAngleMin, branchAngleMax);
      const len1 = len * p.random(branchScaleMin, branchScaleMax);
      const len2 = len * p.random(branchScaleMin, branchScaleMax);

      p.push();
      p.rotate(angle1);
      fractalTree(len1, lvl - 1);
      p.pop();

      p.push();
      p.rotate(-angle2);
      fractalTree(len2, lvl - 1);
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
