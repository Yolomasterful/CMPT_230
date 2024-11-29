x = path_get_x(Path1, 0);
y = path_get_y(Path1, 0);

// Count only instances of this object
var obj_count = 0;
var obj_index = 0;
with (object_index) { // Filters only instances of the same object
    if (id == other.id) { // Find the current instance's position
        obj_index = obj_count;
    }
    obj_count++;
}

// Start the path with a position offset
path_start(Path1, 1, path_action_restart, false);
path_position = (obj_index / obj_count); // Adjust spacing by altering the division