/// @description Insert description here

if (async_load[? "id"] == request_id) // http_id is the id returned by http_post_string
{
    if (async_load[? "status"] == 0) // HTTP status code 200 means success
    {
        var response = async_load[? "result"];
        var json = json_parse(response);
        var chat_response = json.choices[0].message.content;

        // Use chat_response as needed in your game
		show_message(chat_response);
    }
    else {
        var status_code = async_load[? "status"];
    }
}