/// @description Create

move_speed = .05;
x_offset = 36;
y_offset = -36;

//visuals
depth = -1000000;

// Chatgpt
request_id = -1;

// Set your API key
var api_key = "";
var message_to = "\"sup m8\"";

// Create a map for the headers
var headers_map = ds_map_create();
ds_map_add(headers_map, "Authorization", "Bearer " + api_key);
ds_map_add(headers_map, "Content-Type", "application/json");

// The body data should be in JSON format for the ChatGPT API
var data = "{\"messages\": [{\"role\": \"user\", \"content\":" + string(message_to) + "}], \"model\": \"gpt-3.5-turbo\"}";

// Perform the HTTP request
request_id = http_request("https://api.openai.com/v1/chat/completions", "POST", headers_map, data);
ds_map_destroy(headers_map);


