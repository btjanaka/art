const s = function (p) {
  let canvas;
  let img;
  let slider;
  let saveButton;
  let x = 0;
  let width = 400;
  let height = 400;

  p.preload = function () {};

  function save() {
    p.saveCanvas(canvas, "image", "jpg");
  }

  p.setup = function () {
    canvas = p.createCanvas(width, height);
    p.background("#ffffff");

    button = document.getElementById("control-save");
    button.onclick = save;
  };

  p.draw = function () {};
};

const p5Canvas = new p5(s, "p5_canvas");
