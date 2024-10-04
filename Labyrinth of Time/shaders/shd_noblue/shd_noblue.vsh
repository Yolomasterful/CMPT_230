// Vertex Shader
attribute vec2 in_Position;      // Vertex position
attribute vec2 in_TextureCoord;  // Texture coordinates

varying vec2 v_vTexcoord;        // Output to the fragment shader

void main() {
    gl_Position = vec4(in_Position.x, in_Position.y, 0.0, 1.0); // Use in_Position directly
    v_vTexcoord = in_TextureCoord; // Pass texture coordinates to fragment shader
}
