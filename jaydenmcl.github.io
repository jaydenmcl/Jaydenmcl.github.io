<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Icon Maker</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@600;700&family=Luckiest+Guy&family=Bangers&family=Baloo+2:wght@700;800&family=Russo+One&family=Arial+Black&display=swap" rel="stylesheet">
<style>
  :root{
    --bg:#f4f5f7;
    --panel:#ffffff;
    --border:#e2e4e9;
    --ink:#14161a;
    --muted:#6b7076;
    --accent:#ff5a1f;
    --accent-dark:#e0480f;
    --green:#1e8f4e;
    --green-dark:#166f3c;
    --track:#e5e7eb;
    --thumb:#2f6fed;
  }
  *{box-sizing:border-box;}
  body{
    margin:0;
    font-family:'Fredoka', system-ui, sans-serif;
    background:var(--bg);
    color:var(--ink);
  }
  header{
    background:#fff;
    border-bottom:1px solid var(--border);
    padding:16px 32px;
    display:flex;
    align-items:center;
    justify-content:space-between;
  }
  .logo{font-weight:700; font-size:20px; letter-spacing:-0.5px;}
  nav{display:flex; gap:28px; font-size:14px; color:var(--muted); font-weight:600;}
  nav .active{color:var(--ink); border-bottom:2px solid var(--ink); padding-bottom:4px;}
  main{
    max-width:1220px;
    margin:0 auto;
    padding:40px 32px 80px;
  }
  h1{
    font-size:42px;
    font-weight:700;
    margin:0 0 12px;
    letter-spacing:-1px;
  }
  h1 span{color:var(--accent);}
  .sub{color:var(--muted); font-size:16px; max-width:640px; line-height:1.5; margin-bottom:32px;}
  .layout{
    display:grid;
    grid-template-columns:520px 1fr;
    gap:28px;
    align-items:start;
  }
  @media (max-width:980px){
    .layout{grid-template-columns:1fr;}
  }
  .preview-card{
    background:var(--panel);
    border:1px solid var(--border);
    border-radius:14px;
    padding:16px;
  }
  #stage{
    width:100%;
    aspect-ratio:1/1;
    border-radius:8px;
    border:1px solid var(--border);
    display:block;
    background:repeating-conic-gradient(#f0f1f3 0% 25%, #e7e8eb 0% 50%) 50% / 24px 24px;
  }
  .upload-zone{
    width:100%;
    aspect-ratio:1/1;
    border-radius:8px;
    border:2px dashed #c9cdd4;
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;
    gap:10px;
    color:var(--muted);
    cursor:pointer;
    text-align:center;
    padding:24px;
  }
  .upload-zone:hover{border-color:var(--accent); color:var(--accent);}
  .upload-zone svg{opacity:0.7;}
  .link-row{margin-top:12px; font-size:14px;}
  .link-row a{color:var(--thumb); text-decoration:underline; cursor:pointer;}
  .download-btn{
    margin-top:14px;
    width:100%;
    background:var(--green);
    color:#fff;
    border:none;
    padding:14px;
    border-radius:8px;
    font-weight:700;
    font-size:15px;
    cursor:pointer;
    font-family:inherit;
  }
  .download-btn:hover{background:var(--green-dark);}
  .download-btn:disabled{background:#b9c0c9; cursor:not-allowed;}
  .panel{
    background:var(--panel);
    border:1px solid var(--border);
    border-radius:14px;
    padding:26px 28px 8px;
  }
  .field-label{
    font-size:11px;
    letter-spacing:0.06em;
    text-transform:uppercase;
    color:var(--muted);
    font-weight:700;
    margin-bottom:10px;
  }
  .text-input{
    width:100%;
    padding:12px 14px;
    border-radius:8px;
    border:1px solid var(--border);
    font-size:16px;
    font-weight:700;
    font-family:inherit;
    color:var(--ink);
  }
  hr{border:none; border-top:1px solid var(--border); margin:22px 0;}
  .font-grid{
    display:grid;
    grid-template-columns:1fr 1fr 1fr;
    gap:10px;
  }
  .font-opt{
    border:1px solid var(--border);
    border-radius:8px;
    padding:14px 8px;
    text-align:center;
    font-size:15px;
    cursor:pointer;
    background:#fff;
    color:var(--ink);
    line-height:1.3;
  }
  .font-opt small{display:block; font-size:10px; color:var(--muted); font-weight:600; text-transform:none;}
  .font-opt.selected{background:var(--ink); color:#fff; border-color:var(--ink);}
  .font-opt.selected small{color:#c7c9cc;}
  .slider-row{margin-bottom:20px;}
  .slider-top{
    display:flex;
    justify-content:space-between;
    font-size:14px;
    margin-bottom:8px;
  }
  .slider-top .val{color:var(--muted); font-weight:600;}
  input[type=range]{
    -webkit-appearance:none;
    width:100%;
    height:6px;
    border-radius:4px;
    background:var(--track);
  }
  input[type=range]::-webkit-slider-thumb{
    -webkit-appearance:none;
    width:20px; height:20px;
    border-radius:50%;
    background:var(--thumb);
    cursor:pointer;
    border:3px solid #fff;
    box-shadow:0 0 0 1px var(--thumb);
  }
  input[type=range]::-moz-range-thumb{
    width:20px; height:20px;
    border-radius:50%;
    background:var(--thumb);
    cursor:pointer;
    border:3px solid #fff;
    box-shadow:0 0 0 1px var(--thumb);
  }
  .row2{display:grid; grid-template-columns:1fr 1fr; gap:16px;}
  .swatches{display:flex; gap:10px; margin-top:8px;}
  .swatch{
    width:32px; height:32px;
    border-radius:50%;
    border:2px solid var(--border);
    cursor:pointer;
  }
  .swatch.selected{border-color:var(--ink); box-shadow:0 0 0 2px #fff inset;}
  input[type=color]{
    width:32px; height:32px;
    border-radius:50%;
    border:none;
    padding:0;
    cursor:pointer;
    background:none;
  }
  input[type=color]::-webkit-color-swatch-wrapper{padding:0;}
  input[type=color]::-webkit-color-swatch{border-radius:50%; border:2px solid var(--border);}
</style>
</head>
<body>

<header>
  <div class="logo">Flayo</div>
  <nav>
    <span>Home</span>
    <span class="active">Icon Maker</span>
    <span>Models</span>
    <span>More ▾</span>
  </nav>
</header>

<main>
  <h1>Update Icon <span>Maker</span></h1>
  <p class="sub">Sube el icono de tu juego de Roblox (512×512), aplícale el look del reloj de arena de "actualización" y descárgalo directamente desde tu navegador.</p>

  <div class="layout">
    <div class="preview-card">
      <canvas id="stage" width="512" height="512"></canvas>
      <div id="uploadZoneWrap" style="display:none;">
        <div class="upload-zone" id="uploadZone">
          <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6"><path d="M12 16V4M12 4l-4 4M12 4l4 4"/><path d="M4 16v3a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-3"/></svg>
          <div><strong>Arrastra tu icono aquí</strong><br>o haz clic para subir (512×512)</div>
        </div>
      </div>
      <div class="link-row" id="reuploadRow" style="display:none;">
        <a id="reuploadLink">Subir un icono diferente</a>
      </div>
      <input type="file" id="fileInput" accept="image/*" style="display:none;">
      <button class="download-btn" id="downloadBtn" disabled>Descargar PNG (512×512)</button>
    </div>

    <div class="panel">
      <div class="field-label">Texto</div>
      <input class="text-input" id="mainText" value="2 DÍAS" maxlength="20">

      <hr>

      <div class="field-label">Fuente</div>
      <div class="font-grid" id="fontGrid"></div>

      <hr>

      <div class="slider-row">
        <div class="slider-top"><span>Tamaño del reloj de arena</span><span class="val" id="v-hgsize">55%</span></div>
        <input type="range" id="hgsize" min="0" max="100" value="55">
      </div>
      <div class="slider-row">
        <div class="slider-top"><span>Posición del reloj de arena</span><span class="val" id="v-hgpos">36%</span></div>
        <input type="range" id="hgpos" min="0" max="100" value="36">
      </div>
      <div class="slider-row">
        <div class="slider-top"><span>Tamaño del texto</span><span class="val" id="v-textsize">18%</span></div>
        <input type="range" id="textsize" min="0" max="100" value="18">
      </div>
      <div class="slider-row">
        <div class="slider-top"><span>Posición del texto</span><span class="val" id="v-textpos">76%</span></div>
        <input type="range" id="textpos" min="0" max="100" value="76">
      </div>
      <div class="slider-row">
        <div class="slider-top"><span>Filtro oscuro</span><span class="val" id="v-blackfilter">50%</span></div>
        <input type="range" id="blackfilter" min="0" max="100" value="50">
      </div>

      <hr>

      <div class="row2">
        <div>
          <div class="field-label">Texto de la barra</div>
          <input class="text-input" id="barText" value="UPDATE 1.0" maxlength="24">
        </div>
        <div>
          <div class="field-label">Color de acento</div>
          <div class="swatches">
            <div class="swatch selected" style="background:#b3141c" data-color="#b3141c"></div>
            <div class="swatch" style="background:#1e8f4e" data-color="#1e8f4e"></div>
            <div class="swatch" style="background:#1f5fd6" data-color="#1f5fd6"></div>
            <div class="swatch" style="background:#e8a20a" data-color="#e8a20a"></div>
            <input type="color" id="customColor" value="#b3141c" title="Color personalizado">
          </div>
        </div>
      </div>

      <div style="height:16px;"></div>
    </div>
  </div>
</main>

<script>
const canvas = document.getElementById('stage');
const ctx = canvas.getContext('2d');
const SIZE = 512;

const fonts = [
  {label:'Arial Black', sub:'(por defecto)', css:'"Arial Black", Arial, sans-serif', weight:'900'},
  {label:'Fredoka', sub:'', css:'"Fredoka", sans-serif', weight:'700'},
  {label:'Luckiest Guy', sub:'', css:'"Luckiest Guy", cursive', weight:'400'},
  {label:'Bangers', sub:'', css:'"Bangers", cursive', weight:'400'},
  {label:'Baloo 2', sub:'', css:'"Baloo 2", sans-serif', weight:'800'},
  {label:'Russo One', sub:'', css:'"Russo One", sans-serif', weight:'400'},
];
let selectedFontIdx = 0;
let barColor = '#b3141c';
let userImage = null;

const fontGrid = document.getElementById('fontGrid');
fonts.forEach((f, i) => {
  const el = document.createElement('div');
  el.className = 'font-opt' + (i===0 ? ' selected' : '');
  el.style.fontFamily = f.css;
  el.style.fontWeight = f.weight;
  el.innerHTML = f.label + (f.sub ? '<small>'+f.sub+'</small>' : '');
  el.addEventListener('click', () => {
    selectedFontIdx = i;
    document.querySelectorAll('.font-opt').forEach(n => n.classList.remove('selected'));
    el.classList.add('selected');
    render();
  });
  fontGrid.appendChild(el);
});

document.querySelectorAll('.swatch[data-color]').forEach(sw => {
  sw.addEventListener('click', () => {
    barColor = sw.dataset.color;
    document.querySelectorAll('.swatch').forEach(n => n.classList.remove('selected'));
    sw.classList.add('selected');
    document.getElementById('customColor').value = barColor;
    render();
  });
});
document.getElementById('customColor').addEventListener('input', (e) => {
  barColor = e.target.value;
  document.querySelectorAll('.swatch[data-color]').forEach(n => n.classList.remove('selected'));
  render();
});

const sliders = ['hgsize','hgpos','textsize','textpos','blackfilter'];
sliders.forEach(id => {
  const input = document.getElementById(id);
  const label = document.getElementById('v-'+id);
  input.addEventListener('input', () => {
    label.textContent = input.value + '%';
    render();
  });
});
document.getElementById('mainText').addEventListener('input', render);
document.getElementById('barText').addEventListener('input', render);

const fileInput = document.getElementById('fileInput');
const uploadZone = document.getElementById('uploadZone');
const uploadZoneWrap = document.getElementById('uploadZoneWrap');
const reuploadRow = document.getElementById('reuploadRow');
const reuploadLink = document.getElementById('reuploadLink');
const downloadBtn = document.getElementById('downloadBtn');

function showUploadState(hasImage){
  uploadZoneWrap.style.display = hasImage ? 'none' : 'block';
  canvas.style.display = hasImage ? 'block' : 'none';
  reuploadRow.style.display = hasImage ? 'block' : 'none';
  downloadBtn.disabled = !hasImage;
}
showUploadState(false);

uploadZone.addEventListener('click', () => fileInput.click());
reuploadLink.addEventListener('click', () => fileInput.click());
uploadZone.addEventListener('dragover', (e) => { e.preventDefault(); uploadZone.style.borderColor = '#ff5a1f'; });
uploadZone.addEventListener('dragleave', () => { uploadZone.style.borderColor = '#c9cdd4'; });
uploadZone.addEventListener('drop', (e) => {
  e.preventDefault();
  uploadZone.style.borderColor = '#c9cdd4';
  if (e.dataTransfer.files && e.dataTransfer.files[0]) loadFile(e.dataTransfer.files[0]);
});
fileInput.addEventListener('change', (e) => {
  if (e.target.files && e.target.files[0]) loadFile(e.target.files[0]);
});

function loadFile(file){
  const reader = new FileReader();
  reader.onload = (ev) => {
    const img = new Image();
    img.onload = () => {
      userImage = img;
      showUploadState(true);
      render();
    };
    img.src = ev.target.result;
  };
  reader.readAsDataURL(file);
}

function roundedRect(x, y, w, h, r){
  ctx.beginPath();
  ctx.moveTo(x + r, y);
  ctx.lineTo(x + w - r, y);
  ctx.arcTo(x + w, y, x + w, y + r, r);
  ctx.lineTo(x + w, y + h - r);
  ctx.arcTo(x + w, y + h, x + w - r, y + h, r);
  ctx.lineTo(x + r, y + h);
  ctx.arcTo(x, y + h, x, y + h - r, r);
  ctx.lineTo(x, y + r);
  ctx.arcTo(x, y, x + r, y, r);
  ctx.closePath();
}

// Exact hourglass silhouette traced from the reference icon (viewBox 0 0 1000 1320.4)
const HG_VB_W = 1000, HG_VB_H = 1320.4;
const HG_bottomSand = [778.27,1154.1,753.88,1064.3,730.6,1014.41,700.67,965.63,650.78,904.66,548.78,813.75,524.39,776.05,513.3,740.58,506.65,733.92,493.35,732.82,483.37,741.69,473.39,773.84,449.0,811.53,359.2,888.03,318.18,930.16,278.27,982.26,229.49,1074.28,216.19,1113.08,206.21,1165.19,218.4,1179.6,766.08,1179.6,778.27,1168.51];
const HG_neckSand = [360.31,414.63,362.53,426.83,414.63,472.28,450.11,513.3,470.07,547.67,484.48,594.24,493.35,602.0,504.43,602.0,512.2,596.45,519.96,568.74,534.37,534.37,560.98,495.57,594.24,461.2,631.93,431.26,637.47,422.39,636.36,410.2,633.04,405.76,625.28,402.44,372.51,402.44,365.85,405.76];
const HG_frameOuter = [16.63,5.54,4.43,98.67,21.06,119.73,76.5,123.06,92.02,258.31,138.58,383.59,207.32,480.04,339.25,595.34,358.09,651.88,339.25,689.58,202.88,817.07,133.04,919.07,79.82,1051.0,59.87,1200.67,14.41,1205.1,0.0,1226.16,5.54,1308.2,23.28,1319.29,988.91,1312.64,997.78,1222.84,978.94,1202.88,927.94,1199.56,909.09,1051.0,858.09,922.39,778.27,805.99,652.99,686.25,637.47,635.25,659.65,590.91,796.01,473.39,852.55,396.9,905.76,268.29,924.61,123.06,974.5,121.95,996.67,103.1,994.46,14.41,973.39,0.0];
const HG_frameHole = [155.21,121.95,848.12,124.17,832.59,241.69,790.47,351.44,732.82,431.26,595.34,554.32,572.06,600.89,566.52,651.88,600.89,733.92,716.19,839.25,791.57,947.89,840.35,1075.39,852.55,1201.77,136.36,1200.67,151.88,1068.74,192.9,957.87,264.97,851.44,401.33,725.06,429.05,651.88,423.5,598.67,400.22,553.22,262.75,431.26,207.32,351.44,167.41,241.69];

function pathFromFlat(flat, sx, sy, ox, oy){
  ctx.moveTo(ox + flat[0]*sx, oy + flat[1]*sy);
  for (let i = 2; i < flat.length; i += 2){
    ctx.lineTo(ox + flat[i]*sx, oy + flat[i+1]*sy);
  }
  ctx.closePath();
}

function drawHourglass(cx, cy, w, h, color){
  // Render the exact traced silhouette, scaled/centered into the (w x h) box at (cx,cy)
  const scale = Math.min(w / HG_VB_W, h / HG_VB_H);
  const drawW = HG_VB_W * scale, drawH = HG_VB_H * scale;
  const ox = cx - drawW / 2, oy = cy - drawH / 2;

  ctx.fillStyle = color;

  // frame: outer silhouette with the bulb interiors cut out (even-odd fill)
  ctx.beginPath();
  pathFromFlat(HG_frameOuter, scale, scale, ox, oy);
  pathFromFlat(HG_frameHole, scale, scale, ox, oy);
  ctx.fill('evenodd');

  // solid sand pieces (neck trickle + bottom pile)
  ctx.beginPath();
  pathFromFlat(HG_neckSand, scale, scale, ox, oy);
  ctx.fill();

  ctx.beginPath();
  pathFromFlat(HG_bottomSand, scale, scale, ox, oy);
  ctx.fill();
}

function render(){
  ctx.clearRect(0,0,SIZE,SIZE);
  if (!userImage) return;

  // base image, cover-fit into 512x512
  const ir = userImage.width / userImage.height;
  let dw = SIZE, dh = SIZE, dx = 0, dy = 0;
  if (ir > 1) { dh = SIZE; dw = SIZE*ir; dx = -(dw-SIZE)/2; }
  else { dw = SIZE; dh = SIZE/ir; dy = -(dh-SIZE)/2; }
  ctx.drawImage(userImage, dx, dy, dw, dh);

  // black filter overlay
  const blackAlpha = parseInt(document.getElementById('blackfilter').value,10) / 100 * 0.85;
  ctx.fillStyle = `rgba(0,0,0,${blackAlpha})`;
  ctx.fillRect(0,0,SIZE,SIZE);

  // hourglass
  const hgSizePct = parseInt(document.getElementById('hgsize').value,10) / 100;
  const hgPosPct = parseInt(document.getElementById('hgpos').value,10) / 100;
  const hgW = SIZE * 0.24 * (0.5 + hgSizePct);
  const hgH = hgW * (HG_VB_H / HG_VB_W);
  const hgCx = SIZE/2;
  const hgCy = SIZE * (0.15 + hgPosPct * 0.55);
  ctx.save();
  ctx.shadowColor = 'rgba(0,0,0,0.35)';
  ctx.shadowBlur = 10;
  drawHourglass(hgCx, hgCy, hgW, hgH, '#ffffff');
  ctx.restore();

  // bottom accent bar
  const barH = SIZE * 0.14;
  ctx.fillStyle = barColor;
  ctx.fillRect(0, SIZE - barH, SIZE, barH);
  const barText = document.getElementById('barText').value || '';
  if (barText.trim()){
    ctx.save();
    ctx.font = `800 ${barH*0.5}px ${fonts[0].css}`;
    ctx.fillStyle = 'rgba(0,0,0,0.35)';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
    ctx.lineWidth = 4;
    ctx.strokeStyle = 'rgba(0,0,0,0.5)';
    ctx.strokeText(barText.toUpperCase(), SIZE/2, SIZE - barH/2 + 2);
    ctx.fillStyle = '#d9dcdf';
    ctx.fillText(barText.toUpperCase(), SIZE/2, SIZE - barH/2);
    ctx.restore();
  }

  // main text
  const mainText = document.getElementById('mainText').value || '';
  if (mainText.trim()){
    const font = fonts[selectedFontIdx];
    const textSizePct = parseInt(document.getElementById('textsize').value,10) / 100;
    const textPosPct = parseInt(document.getElementById('textpos').value,10) / 100;
    const fontSize = SIZE * (0.09 + textSizePct * 0.22);
    const textY = SIZE * (0.35 + textPosPct * 0.45);
    ctx.save();
    ctx.font = `${font.weight} ${fontSize}px ${font.css}`;
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
    ctx.lineJoin = 'round';
    ctx.lineWidth = fontSize * 0.14;
    ctx.strokeStyle = 'rgba(0,0,0,0.55)';
    ctx.strokeText(mainText.toUpperCase(), SIZE/2, Math.min(textY, SIZE - barH - fontSize*0.7));
    ctx.fillStyle = '#ffffff';
    ctx.fillText(mainText.toUpperCase(), SIZE/2, Math.min(textY, SIZE - barH - fontSize*0.7));
    ctx.restore();
  }
}

downloadBtn.addEventListener('click', () => {
  const link = document.createElement('a');
  link.download = 'update-icon.png';
  link.href = canvas.toDataURL('image/png');
  link.click();
});

// wait for fonts to be ready before first paint of any text
document.fonts.ready.then(render);
</script>

</body>
</html>
