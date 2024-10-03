function min_distance(objects=[]) {
	var min_dist = -1
	for (var i = 0; i < array_length(objects); i++) {
		if ((distance_to_object(objects[i]) < min_dist) or (min_dist == -1)) {
			try {
				min_dist = distance_to_object(objects[i]);
			}
		}
	}
	return min_dist
}