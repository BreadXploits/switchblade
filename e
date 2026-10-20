<!DOCTYPE html>
<html lang="en"><head><meta charset="utf-8"><title>SWITCHBLADE</title>
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@500;700&family=Bebas+Neue&display=swap" rel="stylesheet">
<style>
:root{--ink:#f3eef7;--hot:#ff3d6e;--ice:#3ee6ff;--bg:#0c0618}
*{box-sizing:border-box;margin:0}
html,body{height:100%;overflow:hidden;background:var(--bg);color:var(--ink);font-family:'Rajdhani','Segoe UI',sans-serif}
canvas{display:block;position:fixed;inset:0}
#speed{position:fixed;inset:0;pointer-events:none;opacity:0;background:radial-gradient(ellipse at center,transparent 45%,rgba(62,230,255,.28) 100%)}
#hud{position:fixed;inset:0;pointer-events:none;display:none}
#cross{position:absolute;left:50%;top:50%;width:6px;height:6px;margin:-3px;border:1.5px solid #fff;border-radius:50%;opacity:.8;mix-blend-mode:difference}
#sp{position:absolute;left:32px;bottom:28px;font:400 84px/1 'Bebas Neue',Impact,sans-serif;letter-spacing:2px;text-shadow:0 0 24px rgba(62,230,255,.5)}
#sp small{font:700 18px 'Rajdhani',sans-serif;letter-spacing:3px;margin-left:8px;opacity:.7}
#st{position:absolute;left:36px;bottom:112px;font-weight:700;letter-spacing:4px;color:var(--ice);font-size:18px}
#tm{position:absolute;left:32px;top:24px;font:400 46px 'Bebas Neue',Impact,sans-serif;letter-spacing:2px}
#kl{position:absolute;right:32px;top:30px;font-weight:700;font-size:22px;letter-spacing:3px;color:var(--hot)}
#dash{position:absolute;left:50%;bottom:34px;width:240px;margin-left:-120px;text-align:center;font-weight:700;letter-spacing:4px;font-size:14px}
#dash i{display:block;height:5px;margin-top:6px;background:rgba(255,255,255,.15);transform:skewX(-25deg)}
#dash b{display:block;height:100%;width:100%;background:var(--ice);box-shadow:0 0 14px var(--ice)}
#lg{display:none;grid-template-columns:repeat(10,44px);gap:6px;margin-top:8px;max-width:520px}#lg button{height:38px;font:700 17px 'Rajdhani',sans-serif;color:var(--ink);background:rgba(255,255,255,.07);border:0;border-bottom:3px solid var(--ice);cursor:pointer}#lg button.d{border-color:#7dff4a}#lg button.c{background:var(--hot)}#lg button:hover{background:var(--hot)}#menu{overflow:auto}#hp{position:absolute;left:50%;top:26px;width:300px;margin-left:-150px;height:8px;background:rgba(255,255,255,.15);transform:skewX(-25deg)}#hb{display:block;height:100%;width:100%;background:var(--hot);box-shadow:0 0 14px var(--hot);transition:width .15s}#hurt{position:absolute;inset:0;background:radial-gradient(ellipse at center,transparent 40%,rgba(255,30,70,.65));opacity:0}#tip{position:absolute;left:50%;top:62%;transform:translateX(-50%);font:400 38px 'Bebas Neue',Impact,sans-serif;letter-spacing:5px;color:var(--ice);text-shadow:0 0 18px var(--ice)}
#menu,#end{position:fixed;inset:0;display:flex;flex-direction:column;justify-content:center;padding:0 9vw;z-index:5;
 background:linear-gradient(105deg,rgba(12,6,24,.96) 0%,rgba(12,6,24,.75) 45%,rgba(12,6,24,.2) 100%)}
#menu::before{content:"";position:absolute;inset:0;z-index:-1;background:
 repeating-linear-gradient(115deg,transparent 0 90px,rgba(255,61,110,.07) 90px 92px),
 radial-gradient(ellipse at 80% 90%,rgba(255,61,110,.55),transparent 55%),radial-gradient(ellipse at 90% 10%,rgba(62,230,255,.25),transparent 50%);animation:drift 14s linear infinite;background-size:auto,auto,auto}
@keyframes drift{to{background-position:400px 0,0 0,0 0}}
h1{font:400 clamp(64px,13vw,190px)/.82 'Bebas Neue',Impact,sans-serif;letter-spacing:.02em;transform:skewX(-9deg);text-shadow:6px 6px 0 var(--hot)}
h1 span{display:block;color:transparent;-webkit-text-stroke:2px var(--ice);text-shadow:none;margin-left:.6em}
.tag{margin:26px 0 36px;font-size:20px;letter-spacing:.3em;opacity:.75}
.btn{display:block;width:min(360px,80vw);margin:0 0 14px;padding:16px 26px;font:700 24px 'Rajdhani',sans-serif;letter-spacing:.18em;color:var(--ink);text-align:left;background:rgba(255,255,255,.04);border:0;border-left:5px solid var(--hot);cursor:pointer;transform:skewX(-9deg);transition:.15s}
.btn:hover,.btn:focus-visible{background:var(--hot);transform:skewX(-9deg) translateX(14px);outline:none}
#ctl{display:none;max-width:560px;margin-top:10px;line-height:1.7;font-size:18px;background:rgba(0,0,0,.45);padding:18px 24px;border-left:3px solid var(--ice)}
#ctl b{color:var(--ice);display:inline-block;min-width:150px}
#end{display:none;align-items:flex-start}
#end h2{font:400 110px/1 'Bebas Neue',Impact,sans-serif;color:var(--ice)}
#end p{font-size:26px;margin:8px 0 28px;letter-spacing:.1em}
</style></head><body>
<div id="speed"></div>
<div id="hud"><div id="cross"></div><div id="tm">0:00.0</div><div id="kl"></div><div id="hp"><b id="hb"></b></div><div id="hurt"></div><div id="tip"></div><div id="st"></div>
<div id="sp">0<small>M/S</small></div><div id="dash">DASH<i><b id="db"></b></i></div></div>
<div id="menu"><h1>SWITCH<span>BLADE</span></h1><div class="tag">RUN FAST. STAY FASTER. NEVER LET GO OF THE BLADE.</div>
<button class="btn" id="go">START RUN</button><button class="btn" id="ls">LEVEL 1</button><button class="btn" id="cb">CONTROLS</button><div id="lg"></div>
<div id="ctl"><b>WASD</b>Move &nbsp;<b>Shift</b>Toggle sprint<br><b>Space</b>Jump / double jump / wall jump<br><b>C / Ctrl</b>Crouch, slide at speed<br><b>Q</b>Dash (10s cooldown, keeps momentum)<br><b>Mouse L</b>Slash enemies<br><b>F</b>Throw the blade. Aim at an enemy to yank it toward you (or into the void). Aim at a wall within 24m to swing; hold F to keep swinging, Space launches you and the blade returns.<br><b>Esc</b>Pause</div></div>
<div id="end"><h2>RUN COMPLETE</h2><p id="res"></p><button class="btn" id="next">NEXT LEVEL</button><button class="btn" id="again">RUN IT AGAIN</button></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/shaders/CopyShader.js"></script><script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/shaders/LuminosityHighPassShader.js"></script><script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/shaders/GammaCorrectionShader.js"></script><script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/postprocessing/EffectComposer.js"></script><script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/postprocessing/RenderPass.js"></script><script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/postprocessing/ShaderPass.js"></script><script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/postprocessing/UnrealBloomPass.js"></script>
<script>
const T=THREE,$=id=>document.getElementById(id);
const R=new T.WebGLRenderer({antialias:true});R.setPixelRatio(Math.min(devicePixelRatio,2));R.setSize(innerWidth,innerHeight);
R.autoClear=false;R.toneMapping=T.ACESFilmicToneMapping;R.toneMappingExposure=1.1;R.outputEncoding=T.sRGBEncoding;R.shadowMap.enabled=true;R.shadowMap.type=T.PCFSoftShadowMap;
document.body.prepend(R.domElement);
const scene=new T.Scene(),vs=new T.Scene(),cam=new T.PerspectiveCamera(85,innerWidth/innerHeight,.05,700),vcam=new T.PerspectiveCamera(60,innerWidth/innerHeight,.01,10);
cam.rotation.order='YXZ';scene.fog=new T.FogExp2(0x5a2f4f,.0065);
// sky + env
const sky=new T.Mesh(new T.SphereGeometry(500,32,16),new T.ShaderMaterial({side:T.BackSide,depthWrite:false,fog:false,
 vertexShader:'varying vec3 p;void main(){p=position;gl_Position=projectionMatrix*modelViewMatrix*vec4(position,1.);}',
 fragmentShader:'varying vec3 p;void main(){vec3 d=normalize(p);float h=clamp(d.y,0.,1.);vec3 c=mix(vec3(.9,.28,.38),vec3(.04,.05,.18),pow(h,.45));float s=max(dot(d,normalize(vec3(.3,.12,-1.))),0.);c+=vec3(1.,.7,.4)*(pow(s,300.)*3.+pow(s,8.)*.35);if(d.y<0.)c=vec3(.35,.17,.3);gl_FragColor=vec4(c,1.);}'}));
const envS=new T.Scene();envS.add(sky.clone());const pm=new T.PMREMGenerator(R);const env=pm.fromScene(envS).texture;scene.environment=env;vs.environment=env;scene.add(sky);
scene.add(new T.HemisphereLight(0xff9a80,0x201840,.7));
const sun=new T.DirectionalLight(0xffc4a0,1.6);sun.castShadow=true;sun.shadow.mapSize.set(2048,2048);const sc=sun.shadow.camera;sc.left=sc.bottom=-45;sc.right=sc.top=45;sc.far=160;sun.shadow.bias=-.0004;scene.add(sun,sun.target);
vs.add(new T.HemisphereLight(0xffffff,0x443355,1.1));const vl=new T.DirectionalLight(0xffd0b0,1.5);vl.position.set(1,2,1);vs.add(vl);
let comp=null;try{if(T.EffectComposer&&T.UnrealBloomPass){comp=new T.EffectComposer(R);const a=new T.RenderPass(scene,cam),b=new T.RenderPass(vs,vcam);b.clear=false;b.clearDepth=true;comp.addPass(a);comp.addPass(b);comp.addPass(new T.UnrealBloomPass(new T.Vector2(innerWidth,innerHeight),.6,.75,.8));comp.addPass(new T.ShaderPass(T.GammaCorrectionShader))}}catch(e){comp=null}
const sp_=new Float32Array(2700);for(let i=0;i<900;i++){const a=Math.random()*6.283,y=Math.random(),r=Math.sqrt(1-y*y)*480;sp_.set([Math.cos(a)*r,y*480,Math.sin(a)*r],i*3)}
const stars=new T.Points(new T.BufferGeometry().setAttribute('position',new T.BufferAttribute(sp_,3)),new T.PointsMaterial({color:0xffffff,size:1.7,sizeAttenuation:false,fog:false}));scene.add(stars);
const dN=260,dg=new T.BufferGeometry(),dp=new Float32Array(dN*3);for(let i=0;i<dN*3;i++)dp[i]=(Math.random()-.5)*50;dg.setAttribute('position',new T.BufferAttribute(dp,3));
const dust=new T.Points(dg,new T.PointsMaterial({color:0xffb0c0,size:.07,transparent:true,opacity:.6,depthWrite:false,blending:T.AdditiveBlending}));dust.frustumCulled=false;scene.add(dust);
function dustUp(){const c=[pos.x,pos.y,pos.z];for(let i=0;i<dN*3;i++){const a=c[i%3];let d=dp[i]-a;d=((d+25)%50+50)%50-25;dp[i]=a+d}dg.attributes.position.needsUpdate=true}
// textures
function tex(){const c=document.createElement('canvas');c.width=c.height=256;const g=c.getContext('2d');g.fillStyle='#8b8aa0';g.fillRect(0,0,256,256);
 for(let i=0;i<5000;i++){g.fillStyle=`rgba(${Math.random()<.5?0:255},${Math.random()<.5?0:255},255,.04)`;g.fillRect(Math.random()*256,Math.random()*256,2,2)}
 g.strokeStyle='rgba(20,15,40,.55)';g.lineWidth=3;g.strokeRect(2,2,252,252);g.lineWidth=1;g.strokeRect(10,10,236,236);g.beginPath();g.moveTo(128,2);g.lineTo(128,254);g.stroke();
 const t=new T.CanvasTexture(c);t.wrapS=t.wrapT=T.RepeatWrapping;t.anisotropy=8;t.encoding=T.sRGBEncoding;return t}
const tx=tex(),mat=new T.MeshStandardMaterial({map:tx,roughness:.8,metalness:.15,color:0xcfd0e0}),wmat=new T.MeshStandardMaterial({map:tx,roughness:.6,metalness:.25,color:0x9a7ad0});
// level
const boxes=[],LG=new T.Group();scene.add(LG);let EC=0x3ee6ff;
function B(x,y,z,w,h,d,o={}){const g=new T.BoxGeometry(w,h,d),uv=g.attributes.uv,dm=[[d,h],[d,h],[w,d],[w,d],[w,h],[w,h]];
 for(let i=0;i<24;i++){const[a,b]=dm[i>>2];uv.setXY(i,uv.getX(i)*a/4,uv.getY(i)*b/4)}
 const m=new T.Mesh(g,o.wall?wmat:mat);m.position.set(x,y-h/2,z);m.castShadow=m.receiveShadow=true;LG.add(m);
 const e=new T.LineSegments(new T.EdgesGeometry(g),new T.LineBasicMaterial({color:o.c||(o.wall?0xff3d6e:EC)}));e.position.copy(m.position);LG.add(e);
 boxes.push({a:[x-w/2,y-h,z-d/2],b:[x+w/2,y,z+d/2],cp:o.cp,goal:o.goal})}
const L1=()=>{B(0,0,0,14,2,14,{cp:1});B(0,0,-20,8,2,10,{cp:1});B(0,3,-36,8,2,10);B(0,6,-50,8,2,10,{cp:1});
B(-5,16,-76,2,40,38,{wall:1});B(5,16,-108,2,40,36,{wall:1});B(0,6,-135,10,2,14,{cp:1});B(0,6,-176,10,2,14,{cp:1});
B(0,9,-205,6,60,6,{wall:1,cp:1});B(0,12,-235,6,60,6,{wall:1,cp:1});B(0,15,-265,6,60,6,{wall:1,cp:1});B(0,12,-305,16,2,16,{goal:1,cp:1})};
for(let i=0;i<130;i++){const h=10+Math.random()*60,w=8+Math.random()*16,x=(Math.random()<.5?-1:1)*(45+Math.random()*160),z=-Math.random()*800+40;
 const g=new T.BoxGeometry(w,h,w),m=new T.Mesh(g,new T.MeshStandardMaterial({color:0x1a1530,roughness:.9}));m.position.set(x,-48+h/2,z);scene.add(m);
 const e=new T.LineSegments(new T.EdgesGeometry(g),new T.LineBasicMaterial({color:Math.random()<.5?0xff3d6e:0x3ee6ff,transparent:true,opacity:.55}));e.position.copy(m.position);scene.add(e)}
const floor=new T.Mesh(new T.PlaneGeometry(2400,2400),new T.MeshBasicMaterial({color:0x140a22}));floor.rotation.x=-Math.PI/2;floor.position.set(0,-48,-400);scene.add(floor);
const gr=new T.Mesh(new T.TorusGeometry(4,.18,12,48),new T.MeshBasicMaterial({color:0x3ee6ff}));gr.position.set(0,16,-305);scene.add(gr);
const targets=[[0,2,-12],[0,5,-27],[-1,8,-43],[3,9,-52],[-3,9,-70],[3,9,-95],[0,9,-117],[0,9,-150],[0,10,-176],[0,12,-215],[0,14,-248],[0,18,-282]].map(p=>{
 const m=new T.Mesh(new T.OctahedronGeometry(.6),new T.MeshStandardMaterial({color:0xff3d6e,emissive:0xff1f55,emissiveIntensity:1.6,roughness:.3}));m.position.set(...p);scene.add(m);return{m,alive:1}});
// blade
function blade(){const g=new T.Group(),s=new T.Shape();
 s.moveTo(0,-.022);s.lineTo(.2,-.022);s.quadraticCurveTo(.31,-.02,.385,.014);s.quadraticCurveTo(.34,.03,.27,.022);s.lineTo(0,.022);
 const bg=new T.ExtrudeGeometry(s,{depth:.004,bevelEnabled:true,bevelThickness:.0035,bevelSize:.003,bevelSegments:2,curveSegments:14});bg.translate(0,0,-.002);bg.rotateY(-Math.PI/2);
 const steel=new T.MeshStandardMaterial({color:0xf2f6ff,metalness:1,roughness:.12,envMapIntensity:1.7}),dark=new T.MeshStandardMaterial({color:0x17121f,metalness:.5,roughness:.35}),red=new T.MeshStandardMaterial({color:0xff3d6e,emissive:0xff2a5a,emissiveIntensity:1.8}),brass=new T.MeshStandardMaterial({color:0xc9a15a,metalness:1,roughness:.28});
 g.add(new T.Mesh(bg,steel));const fl=new T.Mesh(new T.BoxGeometry(.0115,.007,.2),dark);fl.position.set(0,.002,.13);g.add(fl);
 const cy=(r,l,m,z,sx,sy)=>{const o=new T.Mesh(new T.CylinderGeometry(r,r,l,16),m);o.rotation.x=Math.PI/2;o.scale.set(sx,1,sy);o.position.z=z;g.add(o);return o};
 cy(.021,.15,dark,-.075,.8,1.3);cy(.026,.02,brass,-.005,.8,1.3);cy(.026,.02,brass,-.15,.8,1.3);
 const st=new T.Mesh(new T.BoxGeometry(.037,.006,.1),red);st.position.set(0,0,-.075);g.add(st);
 const bt=new T.Mesh(new T.CylinderGeometry(.008,.008,.012,10),red);bt.position.set(0,-.03,-.025);g.add(bt);return g}
function bladeOld(){const g=new T.Group(),s=new T.Shape();s.moveTo(0,-.022);s.lineTo(.22,-.022);s.lineTo(.34,.012);s.lineTo(.3,.018);s.lineTo(0,.018);
 const bg=new T.ExtrudeGeometry(s,{depth:.008,bevelEnabled:false});bg.translate(0,0,-.004);bg.rotateY(-Math.PI/2);
 g.add(new T.Mesh(bg,new T.MeshStandardMaterial({color:0xe8eef8,metalness:1,roughness:.18})));
 const h=new T.Mesh(new T.BoxGeometry(.034,.04,.13),new T.MeshStandardMaterial({color:0x14101c,metalness:.6,roughness:.4}));h.position.z=-.065;g.add(h);
 const a=new T.Mesh(new T.BoxGeometry(.036,.012,.12),new T.MeshStandardMaterial({color:0xff3d6e,emissive:0xff3d6e,emissiveIntensity:.8}));a.position.set(0,.022,-.065);g.add(a);return g}
const vm=new T.Group(),vw=new T.Group(),vb=blade();vw.rotation.y=Math.PI;vw.add(vb);vm.add(vw);
const gm=new T.MeshStandardMaterial({color:0x1d1828,roughness:.6,metalness:.2}),fist=new T.Group();
[[.085,.075,.11,0,-.012,-.07],[.075,.07,.5,0,-.03,-.4]].forEach(a=>{const o=new T.Mesh(new T.BoxGeometry(a[0],a[1],a[2]),gm);o.position.set(a[3],a[4],a[5]);fist.add(o)});
const kn=new T.Mesh(new T.BoxGeometry(.09,.02,.04),new T.MeshStandardMaterial({color:0xff3d6e,emissive:0xff3d6e,emissiveIntensity:1.2}));kn.position.set(0,.03,-.05);fist.add(kn);vw.add(fist);vw.scale.setScalar(1.5);
vm.position.set(.3,-.3,-.55);vs.add(vm);
const tb=blade();tb.scale.setScalar(3.2);tb.visible=false;scene.add(tb);
const rope=new T.Line(new T.BufferGeometry().setFromPoints([new T.Vector3(),new T.Vector3()]),new T.LineBasicMaterial({color:0x3ee6ff}));rope.visible=false;rope.frustumCulled=false;scene.add(rope);
// physics
const HW=.35,G=26,pos=new T.Vector3(0,.01,0),vel=new T.Vector3(),k={};
let H=1.8,yaw=0,pitch=0,grounded=false,gbox=null,crouch=false,sliding=false,coyote=0,buf=0,djUsed=false,dashCd=0,dashT=0,atk=0,wjLock=0,wallCoy=0,wallN=[0,0],
 blade_='held',A=[0,0,0],len=5,swSpeed=10,ret=0,jumpReq=false,dashReq=false,roll=0,eye=1.65,fov=85,time=0,kills=0,playing=false,paused=true,noLock=false,cp=[0,.05,0],stateTxt='',slash=0,sprintT=false,fReq=0,hp=100,hurtT=0,ek=0;
function hit(px,py,pz,h,e=0){for(const b of boxes)if(px+HW+e>b.a[0]&&px-HW-e<b.b[0]&&py+h>b.a[1]&&py<b.b[1]&&pz+HW+e>b.a[2]&&pz-HW-e<b.b[2])return b;return null}
function move(dt){grounded=false;gbox=null;let b,n;
 pos.x+=vel.x*dt;for(n=0;n<3&&(b=hit(pos.x,pos.y,pos.z,H));n++){pos.x=vel.x>0?b.a[0]-HW-1e-4:b.b[0]+HW+1e-4;vel.x=0}
 pos.z+=vel.z*dt;for(n=0;n<3&&(b=hit(pos.x,pos.y,pos.z,H));n++){pos.z=vel.z>0?b.a[2]-HW-1e-4:b.b[2]+HW+1e-4;vel.z=0}
 pos.y+=vel.y*dt;for(n=0;n<3&&(b=hit(pos.x,pos.y,pos.z,H));n++){if(vel.y<=0){pos.y=b.b[1];grounded=true;gbox=b}else pos.y=b.a[1]-H;vel.y=0}}
function wallProbe(){let best=null,bs=9;for(const d of[[1,0],[-1,0],[0,1],[0,-1]])if(hit(pos.x+d[0]*.14,pos.y+.3,pos.z+d[1]*.14,H-.3)){const n=[-d[0],-d[1]],s=Math.abs(vel.x*n[0]+vel.z*n[1]);if(s<bs){bs=s;best=n}}return best}
function ray(o,d,mx){let best=null,bt=mx;for(const b of boxes){let t0=0,t1=bt,ax=-1,sg=0,ok=true;
 for(let i=0;i<3;i++){if(Math.abs(d[i])<1e-8){if(o[i]<b.a[i]||o[i]>b.b[i]){ok=false;break}continue}
  let a=(b.a[i]-o[i])/d[i],c=(b.b[i]-o[i])/d[i],s=-1;if(a>c){[a,c]=[c,a];s=1}if(a>t0){t0=a;ax=i;sg=s}if(c<t1)t1=c;if(t0>t1){ok=false;break}}
 if(ok&&ax>=0&&t0<bt){bt=t0;const n=[0,0,0];n[ax]=sg;best={p:[o[0]+d[0]*t0,o[1]+d[1]*t0,o[2]+d[2]*t0],n}}}return best}
const look=()=>[-Math.sin(yaw)*Math.cos(pitch),Math.sin(pitch),-Math.cos(yaw)*Math.cos(pitch)];
const eyeP=()=>[pos.x,pos.y+eye,pos.z];
function throwBlade(r){const e=eyeP();if(!r)return false;A=r.p;len=Math.max(Math.hypot(e[0]-A[0],e[1]-A[1],e[2]-A[2]),4);
 swSpeed=Math.max(vel.length(),12);blade_='stuck';tb.visible=true;tb.position.set(...A);tb.lookAt(A[0]-r.n[0],A[1]-r.n[1],A[2]-r.n[2]);rope.visible=true;sliding=false;
 const c=new T.Vector3(pos.x,pos.y+H*.6,pos.z).sub(new T.Vector3(...A)).normalize(),o=vel.dot(c);if(o>0)vel.addScaledVector(c,-o);vel.setLength(swSpeed);return true}
function release(boost){if(blade_!=='stuck')return;blade_='ret';ret=0;rope.visible=false;if(boost){vel.multiplyScalar(1.1);vel.y+=4;djUsed=false;coyote=0}}
function respawn(){pos.set(cp[0],cp[1],cp[2]);vel.set(0,0,0);hook=null;if(blade_!=='held'){blade_='held';tb.visible=false;rope.visible=false}}
function step(dt){
 const f=(k.KeyW|0)-(k.KeyS|0),s=(k.KeyD|0)-(k.KeyA|0),sy=Math.sin(yaw),cy=Math.cos(yaw);
 let wx=-sy*f+cy*s,wz=-cy*f-sy*s;const wl=Math.hypot(wx,wz);if(wl>0){wx/=wl;wz/=wl}
 coyote-=dt;buf-=dt;dashCd-=dt;dashT-=dt;atk-=dt;wjLock-=dt;wallCoy-=dt;slash=Math.max(0,slash-dt/.3);
 if(jumpReq){buf=.12;jumpReq=false}
 if(grounded){coyote=.12;djUsed=false}
 // crouch/slide
 const wc=k.KeyC||k.ControlLeft;
 if(wc&&!crouch){crouch=true;H=1;if(grounded){const sp=Math.hypot(vel.x,vel.z);if(sp>7.5){sliding=true;const ns=Math.min(sp*1.15+1,20);vel.x*=ns/sp;vel.z*=ns/sp}}}
 if(!wc&&crouch&&!hit(pos.x,pos.y,pos.z,1.8)){crouch=false;H=1.8;sliding=false}
 if(!grounded||!crouch)sliding=false;
 // dash
 if(dashReq){dashReq=false;if(dashCd<=0){release(0);const dx=wl>0?wx:-sy,dz=wl>0?wz:-cy,sp=Math.max(30,Math.hypot(vel.x,vel.z));vel.x=dx*sp;vel.z=dz*sp;vel.y=Math.max(vel.y,0)+1.2;dashCd=10;dashT=.22;fov+=12}}
 // wall run check
 const wp=!grounded&&blade_!=='stuck'?wallProbe():null,hsp=Math.hypot(vel.x,vel.z);
 if(grounded&&wl===0)sprintT=false;const wr=!!wp&&f>0&&!crouch&&hsp>4&&wjLock<=0&&vel.y>-14;
 if(wp&&wjLock<=0){wallCoy=.15;wallN=wp}
 if(wr){djUsed=false;const n=wp,tx_=-n[1],tz=n[0],sg=Math.sign(vel.x*tx_+vel.z*tz)||(Math.sign(-sy*tx_-cy*tz)||1),sp=Math.max(hsp,10.5);
  vel.x=tx_*sg*sp-n[0]*1.5;vel.z=tz*sg*sp-n[1]*1.5;vel.y=Math.max(vel.y-G*.1*dt,-2);roll+=((-(n[0]*cy-n[1]*sy)*-.001)+0)*0;
  roll+=((n[0]*cy*-1+n[1]*sy*1)*0-0)}
 // attack
 if(k.mouse0&&wr&&blade_==='held')fReq=1;if(fReq){fReq=0;if(blade_==='held')fireBlade()}
 if(blade_==='stuck'&&!k.KeyF&&!k.mouse0)release(0);
 // jump
 if(buf>0){
  if(blade_==='stuck'){release(1);buf=0}
  else if(grounded||coyote>0){vel.y=9.8;buf=0;coyote=0;grounded=false;sliding=false}
  else if(wr||wallCoy>0){vel.x+=wallN[0]*8;vel.z+=wallN[1]*8;vel.y=10;buf=0;wjLock=.3;wallCoy=0;djUsed=false}
  else if(!djUsed){vel.y=Math.max(vel.y,0)+9.5;djUsed=true;buf=0;if(wl>0&&hsp>1){const a=Math.atan2(wx,wz),c=Math.atan2(vel.x,vel.z);let d=a-c;d=Math.atan2(Math.sin(d),Math.cos(d));const r=Math.max(-.6,Math.min(.6,d)),nc=c+r;vel.x=Math.sin(nc)*hsp;vel.z=Math.cos(nc)*hsp}}}
 if(blade_==='stuck'){
  vel.y-=G*.7*dt;const c=new T.Vector3(pos.x,pos.y+H*.6,pos.z).sub(new T.Vector3(...A)),l=c.length(),n=c.clone().divideScalar(l),L=look(),lk=new T.Vector3(...L);
  lk.addScaledVector(n,-lk.dot(n));if(lk.lengthSq()>.01){lk.normalize();const sp=vel.length();vel.divideScalar(sp).lerp(lk,1.4*dt).normalize().multiplyScalar(sp)}
  move(dt);const c2=new T.Vector3(pos.x,pos.y+H*.6,pos.z).sub(new T.Vector3(...A)),l2=c2.length();
  if(l2>len){c2.divideScalar(l2);pos.addScaledVector(c2,-(l2-len));const o=vel.dot(c2);if(o>0)vel.addScaledVector(c2,-o)}
  const sp=vel.length();if(sp>1&&sp<swSpeed)vel.multiplyScalar(swSpeed/sp);stateTxt='SWINGING';
 }else{
  if(!wr){const maxS=crouch&&!sliding?4.2:(sprintT?11:7.5);let sp=Math.hypot(vel.x,vel.z);
   if(!sliding){
    if(wl>0&&sp>.5){const rate=grounded?7:3.4,a=Math.atan2(wx,wz),c=Math.atan2(vel.x,vel.z);let d=a-c;d=Math.atan2(Math.sin(d),Math.cos(d));
     if(Math.abs(d)<2.3){const r=Math.max(-rate*dt,Math.min(rate*dt,d)),nc=c+r;vel.x=Math.sin(nc)*sp;vel.z=Math.cos(nc)*sp}}
    if(wl>0){const cur=vel.x*wx+vel.z*wz,add=maxS-cur;if(add>0){const ac=Math.min(add,(grounded?70:22)*dt);vel.x+=wx*ac;vel.z+=wz*ac}}
    if(grounded){sp=Math.hypot(vel.x,vel.z);if(sp>0){const dr=(sp>maxS+.5?sp*.9:sp*(wl>0?2:9))*dt,ns=Math.max(sp-dr,0);vel.x*=ns/sp;vel.z*=ns/sp}}
   }else{sp=Math.hypot(vel.x,vel.z);const ns=Math.max(sp-(1.4+sp*.35)*dt,0);vel.x*=ns/(sp||1);vel.z*=ns/(sp||1);if(ns<3.5)sliding=false}}
  if(!wr)vel.y-=G*(dashT>0?.12:1)*dt;if(vel.y<-55)vel.y=-55;
  move(dt);stateTxt=wr?'WALL RUN':sliding?'SLIDING':dashT>0?'DASH':grounded?(crouch?'CROUCH':sprintT&&wl>0?'SPRINT':''):djUsed?'DOUBLE JUMP':'';
 }
 // roll target
 const rt=(blade_!=='stuck'&&wp&&wr)?(wp[0]*cy-wp[1]*sy)*-.2:0;roll+=(rt-roll)*Math.min(1,10*dt);
 if(gbox){if(gbox.cp&&blade_!=='stuck')cp=[(gbox.a[0]+gbox.b[0])/2,gbox.b[1]+.05,(gbox.a[2]+gbox.b[2])/2];if(gbox.goal)finish()}
 if(pos.y<-40)respawn();
}
function finish(){if(!playing)return;playing=false;paused=true;document.exitPointerLock&&document.exitPointerLock();$('hud').style.display='none';$('end').style.display='flex';
 $('res').textContent='LEVEL '+lvl+'   TIME '+fmt(time)+'   ENEMIES '+ek+'/'+enemies.length+(lvl===1?'   TARGETS '+kills+'/'+targets.length:'');$('next').style.display=lvl<50?'block':'none';if(!done[lvl]||time<done[lvl])done[lvl]=time;try{localStorage.setItem('sb',JSON.stringify(done))}catch(e){}mkGrid()}
const fmt=t=>Math.floor(t/60)+':'+(t%60).toFixed(1).padStart(4,'0');
function slashAttack(){if(atk>0||blade_!=='held')return;atk=.35;slash=1;const e=new T.Vector3(...eyeP()),L=new T.Vector3(...look());
 for(const t of targets)if(t.alive){const d=t.m.position.clone().sub(e),dl=d.length();if(dl<3.8&&d.dot(L)/dl>.2){t.alive=0;kills++}}
 for(const en of enemies)if(en.alive){const d=new T.Vector3(en.p.x,en.p.y+.9,en.p.z).sub(e),dl=d.length();if(dl<3.6&&d.dot(L)/dl>.2)hurtEnemy(en,35,L)}}
// enemies, pickups, pads
const enemies=[],projs=[],pads=[],packs=[],parts=[];let hook=null,pullT=0,tipT=0;
const eM={body:new T.MeshStandardMaterial({color:0x1b1826,metalness:.85,roughness:.32}),trim:new T.MeshStandardMaterial({color:0x3a3550,metalness:.9,roughness:.25}),m:new T.MeshStandardMaterial({color:0xe8eef8,metalness:1,roughness:.15}),g:new T.MeshStandardMaterial({color:0xff5a1f,emissive:0xff4a10,emissiveIntensity:2.4}),c:new T.MeshStandardMaterial({color:0x3ee6ff,emissive:0x3ee6ff,emissiveIntensity:2.4})};
const bx=(w,h,d,m,x,y,z,p)=>{const o=new T.Mesh(new T.BoxGeometry(w,h,d),m);o.position.set(x,y,z);o.castShadow=true;p.add(o)};
function mkEnemy(ty,x,y,z){const g=new T.Group(),a=ty?eM.c:eM.g;
 bx(.72,.8,.44,eM.body,0,1.1,0,g);bx(.5,.5,.06,eM.trim,0,1.15,.23,g);bx(.2,.2,.05,a,0,1.15,.27,g);bx(.36,.32,.36,eM.body,0,1.68,0,g);bx(.3,.08,.05,a,0,1.7,.19,g);
 bx(.22,.7,.24,eM.trim,-.18,.35,0,g);bx(.22,.7,.24,eM.trim,.18,.35,0,g);bx(.2,.62,.22,eM.trim,-.5,1.1,0,g);bx(.2,.62,.22,eM.trim,.5,1.1,0,g);
 if(ty){bx(.1,.1,.7,eM.trim,.5,1,.4,g);bx(.12,.12,.06,a,.5,1,.78,g)}else bx(.05,.05,.6,eM.m,-.5,.8,.35,g);
 g.position.set(x,y,z);scene.add(g);enemies.push({g,ty,p:g.position,v:new T.Vector3(),hp:ty?45:70,alive:1,stun:0,cd:1+Math.random(),wind:0})}
let SP=[[0,0,0,-20],[0,0,3,-36],[0,0,6,-46],[1,0,6,-53],[0,-2,6,-135],[0,2,6,-138],[1,0,6,-141],[0,-2,6,-174],[0,2,6,-172],[1,0,6,-180],[0,0,9,-205],[1,0,12,-235],[0,0,15,-265],[0,-3,12,-300],[0,3,12,-302],[1,0,12,-310]];
function spawnEnemies(){enemies.forEach(e=>scene.remove(e.g));enemies.length=0;SP.forEach(s=>mkEnemy(s[0],s[1],s[2]+.05,s[3]))}
const mkPacks=l=>{packs.forEach(p=>scene.remove(p.m));packs.length=0;l.forEach(p=>{const m=new T.Mesh(new T.OctahedronGeometry(.35),new T.MeshStandardMaterial({color:0x44ff88,emissive:0x22ff66,emissiveIntensity:2.5}));m.position.set(...p);scene.add(m);packs.push({m,on:1})})};
const mkPads=l=>{pads.forEach(p=>scene.remove(p.m));pads.length=0;l.forEach(p=>{const m=new T.Mesh(new T.CylinderGeometry(1.2,1.2,.12,24),new T.MeshStandardMaterial({color:0x3ee6ff,emissive:0x3ee6ff,emissiveIntensity:2.4}));m.position.set(p[0],p[1]+.06,p[2]);scene.add(m);pads.push({p,m,cd:0})})};
const pg=new T.BoxGeometry(.09,.09,.09),pmM=[new T.MeshBasicMaterial({color:0xff6a2a}),new T.MeshBasicMaterial({color:0x3ee6ff})];
function burst(p,c,n){for(let i=0;i<n;i++){const m=new T.Mesh(pg,pmM[c]);m.position.set(p.x,p.y+1,p.z);scene.add(m);parts.push({m,v:new T.Vector3(Math.random()-.5,Math.random()*.8,Math.random()-.5).multiplyScalar(9),l:.7})}}
function tip(t){$('tip').textContent=t;tipT=1.3}
function dmg(n){hp-=n;hurtT=.45;if(hp<=0){hp=100;time+=5;tip('+5S PENALTY');respawn()}}
function killEnemy(en,v){en.alive=0;en.g.visible=false;ek++;burst(en.p,en.ty,26);if(v)tip('VOIDED')}
function hurtEnemy(en,d,L){en.hp-=d;en.v.set(L.x*9,4+L.y*4,L.z*9);en.stun=.45;en.wind=0;en.g.rotation.x=0;burst(en.p,en.ty,8);if(en.hp<=0)killEnemy(en)}
function emove(en,dt){const p=en.p,v=en.v;let b,n,gr=false;
 p.x+=v.x*dt;for(n=0;n<3&&(b=hit(p.x,p.y,p.z,1.8));n++){p.x=v.x>0?b.a[0]-HW-1e-4:b.b[0]+HW+1e-4;v.x=0}
 p.z+=v.z*dt;for(n=0;n<3&&(b=hit(p.x,p.y,p.z,1.8));n++){p.z=v.z>0?b.a[2]-HW-1e-4:b.b[2]+HW+1e-4;v.z=0}
 p.y+=v.y*dt;for(n=0;n<3&&(b=hit(p.x,p.y,p.z,1.8));n++){if(v.y<=0){p.y=b.b[1];gr=true}else p.y=b.a[1]-1.8;v.y=0}return gr}
function shoot(en){const m=new T.Mesh(new T.SphereGeometry(.2,10,8),eM.c);m.position.set(en.p.x,en.p.y+1.2,en.p.z);scene.add(m);
 const d=new T.Vector3(pos.x+vel.x*.25-m.position.x,pos.y+1.1+vel.y*.2-m.position.y,pos.z+vel.z*.25-m.position.z).normalize().multiplyScalar(17);projs.push({m,v:d,l:5})}
function fireBlade(){const e=eyeP(),L=look();let bt=1e9,tg=null;
 for(const en of enemies)if(en.alive){const vx=en.p.x-e[0],vy=en.p.y+.9-e[1],vz=en.p.z-e[2],t=vx*L[0]+vy*L[1]+vz*L[2];
  if(t>0&&t<32){const dx=vx-L[0]*t,dy=vy-L[1]*t,dz=vz-L[2]*t;if(dx*dx+dy*dy+dz*dz<1&&t<bt){bt=t;tg=en}}}
 const r=ray(e,L,24);
 if(tg&&!(r&&Math.hypot(r.p[0]-e[0],r.p[1]-e[1],r.p[2]-e[2])<bt-.5)){hook=tg;pullT=.8;blade_='pull';tb.visible=true;rope.visible=true;tip('YANK')}
 else if(r)throwBlade(r);else tip('OUT OF RANGE')}
function endPull(){blade_='ret';ret=0;rope.visible=false;if(hook){hook.stun=.7;hook.v.multiplyScalar(.7)}hook=null}
function enemies_(dt){
 hurtT-=dt;tipT-=dt;if(tipT<=0)$('tip').textContent='';$('hurt').style.opacity=Math.max(0,hurtT*2)+(hp<30?.2:0);$('hb').style.width=hp+'%';
 if(blade_==='pull'){if(!hook||!hook.alive||(pullT-=dt)<=0)endPull();else{const dx=pos.x-hook.p.x,dy=pos.y+1-hook.p.y,dz=pos.z-hook.p.z,d=Math.hypot(dx,dy,dz);
  if(d<2)endPull();else{hook.v.set(dx/d*30,dy/d*30+4,dz/d*30);hook.stun=.5;A=[hook.p.x,hook.p.y+1,hook.p.z];tb.position.set(...A);tb.lookAt(pos.x,pos.y+1.5,pos.z)}}}
 for(const en of enemies){if(!en.alive)continue;en.stun-=dt;en.cd-=dt;
  const dx=pos.x-en.p.x,dz=pos.z-en.p.z,dy=pos.y-en.p.y,dh=Math.hypot(dx,dz),ux=dx/(dh||1),uz=dz/(dh||1);
  if(en.stun<=0&&dh<45&&Math.abs(dy)<14){en.g.rotation.y=Math.atan2(ux,uz);let mv=0;
   if(!en.ty){if(dh>1.7)mv=5.8;if(dh<2.3&&Math.abs(dy)<2&&en.cd<=0&&en.wind<=0)en.wind=.35;
    if(en.wind>0){en.wind-=dt;en.g.rotation.x=-.5;mv=0;if(en.wind<=0){en.g.rotation.x=0;en.cd=1.2;if(dh<2.8&&Math.abs(dy)<2.2){dmg(14);vel.x+=ux*7;vel.z+=uz*7;vel.y=Math.max(vel.y,3.5)}}}}
   else{mv=dh<9?-4:dh>16?4.5:0;if(dh<32&&en.cd<=0){en.cd=2.2;shoot(en)}}
   if(mv){const sg=Math.sign(mv),sx=ux*sg,sz=uz*sg;if(hit(en.p.x+sx*.9,en.p.y-.5,en.p.z+sz*.9,.4)){en.v.x=sx*Math.abs(mv);en.v.z=sz*Math.abs(mv)}else en.v.x=en.v.z=0}else{en.v.x*=.8;en.v.z*=.8}}
  en.v.y-=G*dt;if(en.v.y<-55)en.v.y=-55;
  if(emove(en,dt)&&en.stun>0){en.v.x*=Math.pow(.05,dt);en.v.z*=Math.pow(.05,dt)}
  if(en.p.y<-40)killEnemy(en,1)}
 for(let i=projs.length-1;i>=0;i--){const q=projs[i];q.m.position.addScaledVector(q.v,dt);q.l-=dt;const m=q.m.position;
  if(Math.hypot(m.x-pos.x,m.y-pos.y-1,m.z-pos.z)<.9){dmg(12);q.l=0}else if(hit(m.x,m.y-.1,m.z,.2))q.l=0;if(q.l<=0){scene.remove(q.m);projs.splice(i,1)}}
 for(let i=parts.length-1;i>=0;i--){const q=parts[i];q.v.y-=18*dt;q.m.position.addScaledVector(q.v,dt);q.l-=dt;q.m.scale.setScalar(Math.max(q.l,0)*1.4);if(q.l<=0){scene.remove(q.m);parts.splice(i,1)}}
 for(const p of packs){p.m.rotation.y+=dt*2;if(p.on&&hp<100&&Math.hypot(p.m.position.x-pos.x,p.m.position.y-pos.y-1,p.m.position.z-pos.z)<1.5){hp=Math.min(100,hp+40);p.on=0;p.m.visible=false;tip('+HEALTH')}}
 for(const p of pads){p.cd-=dt;if(grounded&&p.cd<=0&&Math.abs(pos.x-p.p[0])<1.4&&Math.abs(pos.z-p.p[2])<1.4&&Math.abs(pos.y-p.p[1])<.3){vel.y=17;vel.z-=12;p.cd=.5;grounded=false;djUsed=false}}}
const SP1=SP.slice();
let lvl=1,goalP=[0,16,-305],spawnP=[0,.01,0],done={};try{done=JSON.parse(localStorage.getItem('sb'))||{}}catch(e){}
let rs=1;const rnd=()=>(rs=rs*16807%2147483647)/2147483647,rr=(a,b)=>a+rnd()*(b-a),PAL=[0x3ee6ff,0xff3dd0,0x7dff4a,0xffb020,0xa070ff,0xffffff];
function gen(n){rs=n*7919+13;const d=(n-2)/48,PK=[],PD=[];SP=[];let y=0,x=0,z=-7;
 const dyc=v=>y+v<0?-y:(y>24&&v>0?-v:v);
 const plat=(w,dp,gap,dy,dx,o)=>{y+=dy;x=Math.max(-14,Math.min(14,x+dx));const cz=z-gap-dp/2;B(x,y,cz,w,2,dp,o||{cp:1});z-=gap+dp;return cz};
 const foe=(cz,w,dp,k)=>{for(let i=0;i<k&&SP.length<18;i++)SP.push([rnd()<.3+d*.3?1:0,x+rr(1.2-w/2,w/2-1.2),y,cz+rr(1.2-dp/2,dp/2-1.2)])};
 B(0,0,0,14,2,14,{cp:1});
 for(let s=0,mx=Math.round(5+d*9);s<mx;s++){const t=Math.floor(rnd()*8);
  if(t<2){for(let i=0,k=2+Math.floor(rnd()*3);i<k;i++){const w=rr(5.5,8.5)-d*2,dp=rr(6,9),cz=plat(w,dp,rr(4,6.2+d*6),dyc(rr(-1.5,2)),rr(-3,3)*(1+d));if(rnd()<.3+d*.4)foe(cz,w,dp,1)}}
  else if(t===2){const l1=rr(22,30),l2=rr(22,30),cx=x;plat(8,8,rr(3,5),0,0);B(cx-5,y+10,z-2-l1/2,2,40,l1,{wall:1});B(cx+5,y+10,z-2-l1+5-l2/2,2,40,l2,{wall:1});z=z-2-l1+5-l2;plat(10,12,3,0,0)}
  else if(t===3){const cz=plat(10,12,rr(19,22.5),dyc(rr(-2,2)),0);foe(cz,10,12,1+(d>.4?1:0));if(rnd()<.4)PK.push([x+2,y+1.2,cz])}
  else if(t===4){const k=2+(d>.5?1:0);for(let i=0;i<k;i++){const g=i?22:rr(10,13);y+=2.5;const cz=z-g-3;B(x,y,cz,6,60,6,{wall:1,cp:1});z-=g+6;if(rnd()<d)SP.push([1,x,y,cz])}plat(10,12,rr(9,12),0,0)}
  else if(t===5){const cz=plat(10,10,rr(4,6),0,0);PD.push([x,y,cz-2.5]);const c2=plat(10,12,rr(18,24),dyc(rr(0,4)),rr(-3,3));foe(c2,10,12,1)}
  else if(t===6){for(let i=0,k=3+Math.floor(rnd()*3);i<k;i++){const w=rr(4,5.5)-d;plat(w,w,rr(3,4.5+d*3),dyc(rr(-.5,1.2)),(i%2?1:-1)*rr(5,8),{})}plat(9,9,rr(4,5),0,0)}
  else{const cz=plat(22,22,rr(5,7),dyc(rr(-1,1)),0);foe(cz,22,22,2+Math.floor(d*7));PK.push([x+rr(-6,6),y+1.2,cz+rr(-6,6)])}}
 plat(16,16,rr(6,8),dyc(0),0,{goal:1,cp:1});goalP=[x,y+4,z+8];spawnP=[0,.01,0];mkPacks(PK);mkPads(PD)}
function buildLevel(n){LG.children.slice().forEach(c=>{LG.remove(c);c.geometry.dispose();if(c.isLineSegments)c.material.dispose()});boxes.length=0;lvl=n;EC=PAL[(n-1)%6];
 if(n===1){wmat.color.setHex(0x9a7ad0);scene.fog.density=.0065;L1();mkPacks([[3,1.2,-20],[-3,7.2,-50],[3,7.2,-135],[2,13.2,-235]]);mkPads([[0,0,-4],[0,6,-171]]);SP=SP1.slice();goalP=[0,16,-305];spawnP=[0,.01,0]}
 else{wmat.color.setHSL(((n*37)%360)/360,.35,.62);scene.fog.density=.005+((n*3)%5)*.0013;gen(n)}
 gr.position.set(...goalP);spawnEnemies()}
function mkGrid(){const g=$('lg');g.innerHTML='';for(let i=1;i<=50;i++){const b=document.createElement('button');b.textContent=i;b.className=(done[i]?'d ':'')+(i===lvl?'c':'');b.onclick=()=>{lvl=i;start()};g.appendChild(b)}$('ls').textContent='LEVEL '+lvl+' · SELECT'}
$('ls').onclick=()=>{const g=$('lg');g.style.display=g.style.display==='grid'?'none':'grid'};
$('next').onclick=()=>{lvl=Math.min(50,lvl+1);start()};
buildLevel(1);mkGrid();
// render
const tmp=new T.Vector3();
function render(dt){
 const e=eyeP();eye+=((H-.15)-eye)*Math.min(1,12*dt);
 const sp=Math.hypot(vel.x,vel.z),tf=85+Math.min(sp,30)*.7;fov+=(tf-fov)*Math.min(1,6*dt);if(cam.fov!==fov){cam.fov=fov;cam.updateProjectionMatrix()}
 const bob=grounded&&!sliding?Math.sin(time*Math.min(sp,12)*1.1)*Math.min(sp,12)*.0035:0;
 cam.position.set(e[0],e[1]+bob,e[2]);cam.rotation.set(pitch,yaw,roll);
 sun.position.set(pos.x+40,pos.y+60,pos.z+25);sun.target.position.copy(pos);
 // viewmodel
 const p=Math.sin(Math.PI*slash);vm.position.set(.3-.55*p,-.3+.05*p+bob*2,-.55-.12*p);vm.rotation.set(.25-.5*p,.15*p*3,-1.1*p+.1);
 vb.visible=blade_==='held';dustUp();sky.position.set(pos.x,0,pos.z);stars.position.copy(sky.position);
 // thrown blade
 if(blade_==='ret'){ret+=dt/.28;const h=cam.localToWorld(tmp.set(.3,-.25,-.6)),a=new T.Vector3(...A);tb.position.lerpVectors(a,h,Math.min(1,ret*ret));tb.rotation.z+=dt*30;
  if(ret>=1){blade_='held';tb.visible=false;tb.rotation.set(0,0,0)}}
 if(blade_==='stuck'||blade_==='pull'){const h=cam.localToWorld(tmp.set(.3,-.25,-.6));rope.geometry.setFromPoints([h.clone(),new T.Vector3(...A)])}
 for(const t of targets){t.m.rotation.y+=dt*2;t.m.rotation.x+=dt;if(!t.alive){t.m.scale.multiplyScalar(Math.max(0,1-dt*10));if(t.m.scale.x<.02)t.m.visible=false}}
 gr.rotation.z+=dt;
 if(comp)comp.render(dt);else{R.clear();R.render(scene,cam);R.clearDepth();R.render(vs,vcam)}
 // hud
 $('sp').firstChild.nodeValue=Math.round(Math.hypot(vel.x,vel.y,vel.z));$('st').textContent=stateTxt;$('speed').style.opacity=Math.min(1,Math.max(0,(Math.hypot(vel.x,vel.z)-14)/16));
 $('tm').textContent=fmt(time);$('kl').textContent='LEVEL '+lvl+'   ENEMIES '+ek+'/'+enemies.length+(lvl===1?'   TARGETS '+kills+'/'+targets.length:'');$('db').style.width=(100-Math.max(0,dashCd)*10)+'%';$('db').style.opacity=dashCd>0?.45:1;
}
let last=performance.now();
function loop(n){requestAnimationFrame(loop);const dt=Math.min((n-last)/1000,.05);last=n;
 if(playing&&!paused){step(dt/2);step(dt/2);time+=dt;enemies_(dt)}render(dt)}
loop(last);
// input
function start(){
 buildLevel(lvl);mkGrid();$('lg').style.display='none';$('go').textContent='START RUN';pos.set(spawnP[0],spawnP[1],spawnP[2]);vel.set(0,0,0);cp=[spawnP[0],spawnP[1]+.04,spawnP[2]];time=0;kills=0;dashCd=0;crouch=false;H=1.8;yaw=0;pitch=0;blade_='held';tb.visible=false;rope.visible=false;
 targets.forEach(t=>{t.alive=lvl===1?1:0;t.m.visible=lvl===1;t.m.scale.setScalar(1)});spawnEnemies();ek=0;hp=100;sprintT=false;packs.forEach(p=>{p.on=1;p.m.visible=true});projs.forEach(q=>scene.remove(q.m));projs.length=0;hook=null;playing=true;resume()}
function resume(){$('menu').style.display=$('end').style.display='none';$('hud').style.display='block';paused=false;
 const p=R.domElement.requestPointerLock&&R.domElement.requestPointerLock();if(p&&p.catch)p.catch(()=>{noLock=true})}
function pause(){if(!playing||paused)return;paused=true;$('menu').style.display='flex';$('go').textContent='RESUME';$('hud').style.display='none';for(const c in k)k[c]=0}
$('go').onclick=()=>{playing&&paused?resume():start()};$('again').onclick=start;
$('cb').onclick=()=>{const c=$('ctl');c.style.display=c.style.display==='block'?'none':'block'};
document.addEventListener('pointerlockerror',()=>noLock=true);
document.addEventListener('pointerlockchange',()=>{if(!document.pointerLockElement&&playing&&!paused)pause()});
document.addEventListener('mousemove',e=>{if(paused||!(document.pointerLockElement||noLock))return;yaw-=e.movementX*.0022;pitch=Math.max(-1.55,Math.min(1.55,pitch-e.movementY*.0022))});
document.addEventListener('mousedown',e=>{if(paused||e.button)return;k.mouse0=1;slashAttack()});
document.addEventListener('mouseup',e=>{if(!e.button)k.mouse0=0});
document.addEventListener('keydown',e=>{if(e.code==='Space')e.preventDefault();if(e.code==='Escape'&&noLock){paused?resume():pause();return}if(paused||e.repeat)return;if(e.code==='ShiftLeft'||e.code==='ShiftRight'){sprintT=!sprintT;return}if(e.code==='KeyF')fReq=1;k[e.code]=1;
 if(e.code==='Space')jumpReq=true;if(e.code==='KeyQ'||e.code==='KeyE')dashReq=true});
document.addEventListener('keyup',e=>k[e.code]=0);
addEventListener('resize',()=>{R.setSize(innerWidth,innerHeight);comp&&comp.setSize(innerWidth,innerHeight);cam.aspect=vcam.aspect=innerWidth/innerHeight;cam.updateProjectionMatrix();vcam.updateProjectionMatrix()});
</script></body></html>
