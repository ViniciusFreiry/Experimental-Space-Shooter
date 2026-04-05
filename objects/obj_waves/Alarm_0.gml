alarm[0] = wave_cd * 5;

layer_sequence_create("Sq_Enemies", 0, 0, waves[wave_index]);

if (wave_index >= array_length(waves) - 1) wave_index = 0;
else wave_index++;