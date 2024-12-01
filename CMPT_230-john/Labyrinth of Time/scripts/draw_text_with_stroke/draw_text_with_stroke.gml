function draw_text_with_stroke(x, y, text, sep, w, xscale, yscale, angle, stroke_color, stroke_width) {
    // Save the current drawing color
    var original_color = draw_get_color();

    // Draw the stroke by offsetting the text in 8 directions
    draw_set_color(stroke_color);
    for (var dx = -stroke_width; dx <= stroke_width; dx += stroke_width) {
        for (var dy = -stroke_width; dy <= stroke_width; dy += stroke_width) {
            if (dx != 0 || dy != 0) { // Skip the center
                draw_text_ext_transformed(x + dx, y + dy, text, sep, w, xscale, yscale, angle);
            }
        }
    }

    // Draw the main text
    draw_set_color(original_color);
    draw_text_ext_transformed(x, y, text, sep, w, xscale, yscale, angle);
}