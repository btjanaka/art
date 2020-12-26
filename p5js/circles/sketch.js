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

  // x and y are center coords.
  function fractalCircle(x, y, radius) {
    p.stroke(0);
    p.noFill();
    p.ellipse(x, y, radius * 2);
    if (radius > 40) {
      fractalCircle(x + radius / 2, y, radius / 2);
      fractalCircle(x - radius / 2, y, radius / 2);
      fractalCircle(x, y + radius / 2, radius / 2);
      fractalCircle(x, y - radius / 2, radius / 2);
    }
  }

  p.preload = function () {};

  p.setup = function () {
    canvas = p.createCanvas(width, height);
    p.background("#ffffff");

    button = document.getElementById("control-save");
    button.onclick = save;

    fractalCircle(width / 2, height / 2, width / 2);
  };

  p.draw = function () {};
};

let p5Canvas = new p5(s, "p5_canvas");
