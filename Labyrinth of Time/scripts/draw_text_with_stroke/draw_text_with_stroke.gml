function draw_text_with_stroke(txt, x, y, main_color, stroke_color, offset) {
    // Draw the outline by drawing the text in all directions around the main text
    draw_set_color(stroke_color);
    draw_text(x - offset, y, txt); // Left
    draw_text(x + offset, y, txt); // Right
    draw_text(x, y - offset, txt); // Up
    draw_text(x, y + offset, txt); // Down
    draw_text(x - offset, y - offset, txt); // Top-left
    draw_text(x + offset, y - offset, txt); // Top-right
    draw_text(x - offset, y + offset, txt); // Bottom-left
    draw_text(x + offset, y + offset, txt); // Bottom-right

    // Draw the main text in the center
    draw_set_color(main_color);
    draw_text(x, y, txt);
}