/// @description Step sound
play_step_audio = true;

var sounds = [grass1, grass2, grass3, grass4, grass5, grass6];
audio_play_sound(sounds[irandom(5)], 1, false, .2);