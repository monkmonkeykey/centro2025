#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform vec2 resolution;
uniform float time;
uniform vec2 mouse;
uniform float click;

float nsin(float v) {
  return sin(v * 6.2831) * 0.5 + 0.5;
}

float rand(vec3 p) {
  return fract(sin(dot(p ,vec3(12.9898,78.233, 54.53))) * 43758.5453);
}

vec3 fbm(vec3 p, float offset, float rings) {
  return vec3(
    nsin(rand(p) * rings),
    nsin(rand(p + vec3(offset)) * rings),
    nsin(rand(p + vec3(offset * 2.0)) * rings)
  );
}

void main() {
  vec2 uv = gl_FragCoord.xy / resolution.xy;
  uv = uv * 2.0 - 1.0;
  uv.x *= resolution.x / resolution.y;

  float nscale = 1.2;
  float hueOffset = 0.03;
  float rings = 4.0;
  float mixAmt = 1.0 - click;

  vec3 samplePos = vec3(uv * nscale, time * 0.2);
  vec3 col = fbm(samplePos, hueOffset, rings);
  col = pow(col, vec3(4.2));

  gl_FragColor = vec4(col, 1.0);
}
