/// @description Create

request_id = -1;

move_speed = .05;
x_offset = 36;
y_offset = -36;

//visuals
depth = -1000000;


// Set your API key
var api_key = "";
var message_to = "\"sup m8\"";

// Create a map for the headers
var headers_map = ds_map_create();
ds_map_add(headers_map, "Authorization", "Bearer " + api_key); // Replace YOUR_API_KEY with your actual API key
ds_map_add(headers_map, "Content-Type", "application/json");
// Add any other headers you need here

// The body data should be in JSON format for the ChatGPT API
var data = "{\"messages\": [{\"role\": \"user\", \"content\":" + string(message_to) + "}], \"model\": \"gpt-3.5-turbo\"}";

// Perform the HTTP request
request_id = http_request("https://api.openai.com/v1/chat/completions", "POST", headers_map, data);
show_message(request_id);
// Remember to eventually clean up the ds_map to prevent memory leaks
// You can do this after you're done processing the HTTP response


