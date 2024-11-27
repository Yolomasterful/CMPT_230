// Fragment Shader
varying vec2 v_vTexcoord;         // Texture coordinates from vertex shader
uniform sampler2D gm_Texture;     // Use gm_Texture instead of gm_BaseTexture

void main() {
    vec4 color = texture2D(gm_Texture, v_vTexcoord); // Sample the texture using gm_Texture
    color.b = 0.0; // Remove the blue channel
    gl_FragColor = color; // Output the modified color
}
