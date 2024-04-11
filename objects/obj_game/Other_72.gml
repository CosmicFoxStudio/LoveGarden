/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _type, _group_id;
_type = async_load[? "type"];
_group_id = async_load[? "group_id"]

if(_type = "audiogroup_load") {
	total_audio_groups_loaded++;
}

if(total_audio_groups == total_audio_groups_loaded) {
	event_user(0);
}
